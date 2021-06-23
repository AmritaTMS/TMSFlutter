import 'package:graphql/client.dart';
import 'package:tms/constants.dart';

class GraphQL {
  final baseURL = url;
  GraphQLClient getClient() => GraphQLClient(
        cache: GraphQLCache(),
        link: HttpLink(baseURL),
      );
}

extension Graph on GraphQLClient {
  Future queryC(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      errorPolicy: ErrorPolicy.all,
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
    ));
  }

  Future mutationC(String query) {
    final String readCharacter = query;
    return this.mutate(MutationOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.all,
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
    ));
  }
}
