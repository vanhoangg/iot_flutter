import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/model/plant-model.dart';
import 'package:iot_flutter/screens/details/components/weather_banner.dart';
import 'package:iot_flutter/screens/iot_dashboard/dashboard.dart';

import '../../../constants.dart';

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
      height: size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              WeatherBanner(
                plants: plants,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.to(DashBoardScreen());
                },
                child: RaisedButton(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    padding: EdgeInsets.all(kDefaultPadding / 2),
                    height: 40,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 15),
                          blurRadius: 22,
                          color: kPrimaryColor.withOpacity(0.22),
                        ),
                        BoxShadow(
                          offset: Offset(-15, -15),
                          blurRadius: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset("assets/icons/sun.svg"),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashBoardScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: kDefaultPadding),
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(63),
                bottomLeft: Radius.circular(63),
              ),
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
