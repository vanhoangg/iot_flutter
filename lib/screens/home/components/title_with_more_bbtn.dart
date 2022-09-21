import 'package:flutter/material.dart';

import '../../../app_color.dart';
import '../../../constants.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    this.title,
    this.press,
  }) : super(key: key);
  final String? title;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title ?? ""),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          border: Border.all(color: AppColor.secondary),
          borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 4, vertical: kDefaultPadding / 4),
            child: Text(
              text ?? "",
              style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  color: kBackgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
