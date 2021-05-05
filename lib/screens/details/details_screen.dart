import 'package:flutter/material.dart';
import 'package:iot_flutter/model/plant-model.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Plant plants;

  const DetailsScreen({Key key, this.plants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Body(
        plants: plants,
      )),
    );
  }
}
