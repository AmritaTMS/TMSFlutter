import 'package:graphql/client.dart';
import 'package:tms/constants.dart';

class GraphQL {
  final baseURL = url;

  GraphQLClient getClient() => GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(baseURL).concat(null),
      );
}

extension Graph on GraphQLClient {
  Future queryCharacter(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.noCache,
    ));
  }
}
