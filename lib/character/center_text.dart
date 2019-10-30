import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  final content;

  CenterText(this.content);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.center,
    );
  }
}
