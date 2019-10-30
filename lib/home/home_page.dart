import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_hub/api/api.dart';
import 'package:rick_and_morty_hub/utils/route_path.dart';

class Home extends StatelessWidget {
  final api = Api();

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: api.characters),
      builder: (
        QueryResult queryResult, {
        BoolCallback refetch,
        FetchMore fetchMore,
      }) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Rick n Morty'),
          ),
          body: getCharacters(queryResult),
        );
      },
    );
  }

  getCharacters(queryResult) {
    if (queryResult?.data != null) {
      final result = queryResult.data['characters'];

      return GridView.builder(
        itemCount: result['results'].length,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () => Navigator.pushNamed(context, CHARACTER,
                arguments: result['results'][index]),
            child: GridTile(
              child: Image.network(result['results'][index]['image']),
              footer: GridTileBar(
                backgroundColor: Color(0xB3353536),
                title: Text(
                  result['results'][index]['name'].toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // childAspectRatio: MediaQuery.of(context).size.width /
          //     (MediaQuery.of(context).size.height / 4),
        ),
      );
    }
    return Center(
      child: const CircularProgressIndicator(),
    );
  }
}
