import 'package:flutter/material.dart';
import 'package:rick_and_morty_hub/character/center_text.dart';

class Character extends StatelessWidget {
  final data;

  Character(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['name'],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(data['image']),
          CenterText("Name: ${data['name']}"),
          CenterText("Status: ${data['status']}"),
          CenterText("Species: ${data['species']}"),
          data['type'].isNotEmpty
              ? CenterText("Type: ${data['type']}")
              : SizedBox.shrink(),
          CenterText("Gender: ${data['gender']}"),
          CenterText("Origin: ${data['origin']['name']}"),
          CenterText("Location: ${data['location']['name']}"),
        ],
      ),
    );
  }
}
