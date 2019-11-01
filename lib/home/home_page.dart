import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rick_and_morty_hub/api/api.dart';
import 'package:rick_and_morty_hub/utils/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final api = ApiRequest();
  final color = ColorOption();
  final image = Images();
  int page = 1;
  var result;

  @override
  Widget build(BuildContext context) {
    return Query(
      options:
          QueryOptions(document: api.getCharacters, variables: {'page': page}),
      builder: (
        QueryResult queryResult, {
        BoolCallback refetch,
        FetchMore fetchMore,
      }) {
        return Scaffold(
          body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 220.0,
                    floating: false,
                    pinned: false,
                    backgroundColor: Color(0xE6e07c27),
                    flexibleSpace: FlexibleSpaceBar(
                      /* centerTitle: true,
                      title: Text(
                        "Rick N Morty",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ), */
                      background: Image.asset(
                        image.headerImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Material(
                          color: color.primaryColor,
                          child: TabBar(
                            labelColor: Colors.black87,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: color.secondaryColor,
                            tabs: [
                              Tab(
                                icon: Icon(Icons.info),
                              ),
                              Tab(
                                icon: Icon(Icons.video_library),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  characterArchive(queryResult),
                  episodesArchive(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  characterArchive(queryResult) {
    return Column(
      children: <Widget>[
        Flexible(
          flex: 9,
          child: getCharacters(queryResult),
        ),
        renderNavigationButtons(queryResult),
      ],
    );
  }

  episodesArchive() {
    return Center(
      child: Text('Episodes'),
    );
  }

  getCharacters(queryResult) {
    if (queryResult?.data != null) {
      result = queryResult.data['characters'];

      return GridView.builder(
        padding: EdgeInsets.only(top: 0),
        shrinkWrap: true,
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
          crossAxisCount: 2,
          // childAspectRatio: MediaQuery.of(context).size.width /
          //     (MediaQuery.of(context).size.height / 4),
        ),
      );
    }
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  renderNavigationButtons(queryResult) {
    if (queryResult?.data != null) {
      result = queryResult.data['characters'];

      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          result['info']['prev'] != null
              ? Expanded(
                  child: RaisedButton(
                    child: Text('Previous'),
                    onPressed: () {
                      setState(() {
                        page = result['info']['prev'];
                      });
                    },
                    color: color.secondaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                )
              : SizedBox.shrink(),
          result['info']['next'] != null
              ? Expanded(
                  child: RaisedButton(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        page = result['info']['next'];
                      });
                    },
                    color: color.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                  ),
                )
              : SizedBox.shrink(),
        ],
      );
    }
    return Container();
  }
}
