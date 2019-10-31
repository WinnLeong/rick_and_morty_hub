import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Api {
  static final HttpLink httpLink = HttpLink(
    uri: 'https://rickandmortyapi.com/graphql/',
  );

  /* static final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  static final Link link = authLink.concat(httpLink); */

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    ),
  );
}
