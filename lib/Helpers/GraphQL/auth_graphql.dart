import 'package:graphql/client.dart';
import 'package:tms/constants.dart';

class AuthGraphQL {
  final baseURL = url;
  static late String _auth;

  void setAuth(String value) {
    _auth = value;
  }

  final _authLink = AuthLink(
    getToken: () async => 'JWT ' + _auth,
  );

  GraphQLClient getClient() => GraphQLClient(
        cache: GraphQLCache(),
        link: _authLink.concat(HttpLink(baseURL)),
      );
}

extension Graph on GraphQLClient {
  Future queryA(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.all,
    ));
  }

  Future mutationA(String query) {
    final String readCharacter = query;
    return this.mutate(MutationOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.noCache,
      errorPolicy: ErrorPolicy.all,
    ));
  }

  Future queryCFA(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheFirst,
      errorPolicy: ErrorPolicy.all,
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
    ));
  }

  Future mutationCFA(String query) {
    final String readCharacter = query;
    return this.mutate(MutationOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheFirst,
      errorPolicy: ErrorPolicy.all,
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
    ));
  }

  Future queryCNA(String query) {
    final String readCharacter = query;
    return this.query(QueryOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      errorPolicy: ErrorPolicy.all,
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
    ));
  }

  Future mutationCNA(String query) {
    final String readCharacter = query;
    return this.mutate(MutationOptions(
      document: gql(readCharacter),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      errorPolicy: ErrorPolicy.all,
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
    ));
  }
}
