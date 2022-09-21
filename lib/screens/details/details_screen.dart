import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/plant_model.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Plant plants;

  const DetailsScreen({Key? key, required this.plants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(isBack: true, context: context),
      body: SafeArea(
          child: Body(
        plants: plants,
      )),
    );
  }
}
