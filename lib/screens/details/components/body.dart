import 'package:flutter/material.dart';

import '../../../model/plant_model.dart';
import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  final Plant plants;

  const Body({Key? key, required this.plants}) : super(key: key);
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
