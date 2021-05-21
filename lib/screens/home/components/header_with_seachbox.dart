import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding * 2.5),
      // It will cover 20% of our total height
      child: Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: kPrimaryColor.withOpacity(0.23),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              SvgPicture.asset("assets/icons/search.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
