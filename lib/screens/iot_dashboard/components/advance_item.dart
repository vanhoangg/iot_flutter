import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class AdvanceItem extends StatelessWidget {
  const AdvanceItem({
    Key? key,
    required this.content,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String content, title, icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: ScreenUtil().setWidth(40),
          height: ScreenUtil().setHeight(40),
          child: Image.asset(icon),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.black54, fontSize: titleSize),
              ),
              Text(
                content,
                style: TextStyle(
                    fontSize: subTitleSize, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
