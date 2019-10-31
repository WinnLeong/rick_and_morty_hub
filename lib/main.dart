import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_hub/api/api.dart';
import 'package:rick_and_morty_hub/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final api = Api();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: api.client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Rick And Morty Hub',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: HOME,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
