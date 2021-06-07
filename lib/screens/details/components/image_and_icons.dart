import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

import '../../../constants.dart';
import '../../../model/plant-model.dart';

class ImageAndIcons extends StatelessWidget {
  ImageAndIcons({
    Key key,
    @required this.size,
    this.plants,
  }) : super(key: key);

  final Size size;
  final Plant plants;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: kDefaultPadding),
            height: ScreenUtil.defaultSize.height * 0.3,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 60,
                  color: kPrimaryColor.withOpacity(0.29),
                ),
              ],
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
                image: NetworkImage("$baseUrl${plants.filePath}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
