import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

import '../../constants.dart';
import '../history/components/item_store.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(isBack: true, context: context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: ScreenUtil.defaultSize.height * 2,
          child: Column(children: [Expanded(child: ItemStore())]),
        ),
      ),
    );
  }
}
