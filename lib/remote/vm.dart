import 'package:flutter/material.dart';
import 'package:flutter_application_1/remote/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

ValueNotifier<GraphQLClient> getClientNotifier() {
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: MyQueries.httpLink as Link,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
  return client;
}
