import 'package:flutter/material.dart';

import '../../../app_color.dart';
import '../../../constants.dart';

class AvatarBanner extends StatelessWidget {
  final String avatar;
  final VoidCallback onClick;

  const AvatarBanner({Key key, @required this.avatar, this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: AppColor.grey,
            radius: 45,
            // onBackgroundImageError: ,
            backgroundImage:
                // avatar == null   ?
                AssetImage("images/icons/mqtt.jpg")
            // : NetworkImage(avatar)
            ),
        title: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.primary),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
                child: Text(
              'Đổi ảnh',
              style: TextStyle(color: AppColor.primary),
            )),
          ),
        ),
      ),
    );
  }
}
