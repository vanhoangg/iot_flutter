import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/plant_model.dart';
import 'weather_banner.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.plants,
  }) : super(key: key);

  final Plant plants;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              "${plants.title}",
              style: TextStyle(
                  fontSize: titleSize,
                  color: kTextColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: WeatherBanner(
              plants: plants,
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              "Desciption",
              style:
                  TextStyle(fontSize: titleSize, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          RichText(
            text: TextSpan(
              text: plants.description,
              style: TextStyle(
                  fontSize: subTitleSize,
                  fontWeight: FontWeight.w300,
                  color: kTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
