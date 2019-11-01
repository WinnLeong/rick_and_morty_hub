import 'package:cached_network_image/cached_network_image.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CachedNetworkImage(
                  imageUrl: data['image'],
                  width: 330,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
      ),
    );
  }
}
