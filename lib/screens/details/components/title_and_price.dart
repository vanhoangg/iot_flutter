import 'package:flutter/material.dart';
import 'package:iot_flutter/model/plant-model.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    this.plants,
  }) : super(key: key);

  final Plant plants;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "${plants.title}\n",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: kTextColor, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Desciption",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 2,
          ),
          RichText(
            text: TextSpan(
              text: plants.description,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: kTextColor, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
