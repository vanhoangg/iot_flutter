import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_flutter/screens/iot_dashboard/dashboard.dart';

import '../../../constants.dart';
import 'icon_card.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.03),
                      padding: EdgeInsets.all(kDefaultPadding / 2),
                      height: 62,
                      width: 62,
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
                  RaisedButton(
                    onPressed: () {},
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.03),
                      padding: EdgeInsets.all(kDefaultPadding / 2),
                      height: 62,
                      width: 62,
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
                      child: SvgPicture.asset("assets/icons/icon_2.svg"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
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
                  image: AssetImage("assets/images/img.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
