import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/components/nav_bar/my_bottom_nav_bar.dart';
import 'package:iot_flutter/constants.dart';
import 'package:iot_flutter/model/chart_history_model.dart';
import 'package:iot_flutter/screens/history/history_controller.dart';

import 'components/chart_history.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GetX<HistoryController>(
          init: HistoryController(),
          builder: (controller) {
            if (controller.listHistory.value == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            print(controller.listChartData.length);

            return Container(
              height: MediaQuery.of(context).size.height,
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

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
  );
}
