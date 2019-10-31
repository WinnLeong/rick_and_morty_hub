import 'package:flutter/material.dart';
import 'package:rick_and_morty_hub/utils/utils.dart';

class Description extends StatelessWidget {
  final String desc;
  final String detail;
  final color = ColorOption();

  Description(this.desc, this.detail);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  desc,
                  style: TextStyle(
                    color: color.fontGrey,
                  ),
                ),
                Text(detail,
                    style: TextStyle(
                      color: color.primaryColor,
                    )),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            color: color.primaryColor,
          ),
        ],
      ),
    );
  }
}
