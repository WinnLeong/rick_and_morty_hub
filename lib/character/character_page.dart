import 'package:flutter/material.dart';
import 'package:rick_and_morty_hub/character/description.dart';
import 'package:rick_and_morty_hub/utils/utils.dart';

class Character extends StatelessWidget {
  final data;
  final color = ColorOption();

  Character(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xE6e07c27),
        title: Text(
          data['name'],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(20.0),
                child: Image.network(
                  data['image'],
                  fit: BoxFit.fill,
                  height: 300.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Description(
              'Name',
              data['name'],
            ),
            Description('Status', data['status']),
            Description('Species', data['species']),
            data['type'].isNotEmpty
                ? Description('Type', data['type'])
                : SizedBox.shrink(),
            Description('Gender', data['gender']),
            Description('Origin', data['origin']['name']),
            Description('Location', data['location']['name']),
          ],
        ),
      ),
    );
  }
}
