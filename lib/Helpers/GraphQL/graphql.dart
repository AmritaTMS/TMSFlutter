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
  Future queryCharacter(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.all,
    ));
  }

  Future mutationCharacter(String query) {
    final String readCharacter = query;
    return this.mutate(MutationOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.all,
    ));
  }

  Future queryCF(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheFirst,
      errorPolicy: ErrorPolicy.all,
    ));
  }

  Future mutationCF(String query) {
    final String readCharacter = query;
    return this.mutate(MutationOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheFirst,
      errorPolicy: ErrorPolicy.all,
    ));
  }

  Future queryCN(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      errorPolicy: ErrorPolicy.all,
    ));
  }

  Future mutationCN(String query) {
    final String readCharacter = query;
    return this.mutate(MutationOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      errorPolicy: ErrorPolicy.all,
    ));
  }
}
