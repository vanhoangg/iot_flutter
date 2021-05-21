import 'package:flutter/material.dart';
import 'package:iot_flutter/model/plant-model.dart';

import '../../../constants.dart';
import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  final Plant plants;

  const Body({Key key, this.plants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            plants: plants,
          ),
          TitleAndPrice(plants: plants),
        ],
      ),
    );
  }
}
