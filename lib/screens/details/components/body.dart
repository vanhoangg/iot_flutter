import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          TitleAndPrice(title: "Angelica", country: "Russia"),
          Container(
            padding: EdgeInsets.only(top: kDefaultPadding),
              width: size.width,
              child: Column(
                children: [Text(
                  "Description",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),]
              )),
        ],
      ),
    );
  }
}
