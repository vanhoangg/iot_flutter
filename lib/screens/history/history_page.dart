import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import '../../components/nav_bar/my_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/chart_history.dart';
import 'history_controller.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(isBack: true, context: context),
      body: GetX<HistoryController>(builder: (controller) {
        if (controller.listHistory.value == null) {
          return loadding;
        }

        print(controller.listChartData.length);

        return Container(
          height: ScreenUtil.defaultSize.height,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding),
            child: SizedBox(
                height: 200,
                child: HistoryChartPage(
                  data: controller.listChartData,
                )),
          ),
        );
      }),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
