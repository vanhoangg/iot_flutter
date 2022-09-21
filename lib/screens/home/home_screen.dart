import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/screens/home/components/home_menu.dart';

import '../../components/nav_bar/my_bottom_nav_bar.dart';
import '../../constants.dart';
import '../iot_dashboard/dashboard_controller.dart';
import 'components/recomend_plants.dart';
import 'components/title_with_more_bbtn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final HomeController homeController = Get.find();
  @override
  void initState() {
    Get.put(DashBoardController());

    // setState(() {
    //   homeController.getInfoIot();
    //   homeController.getInfoIotDevice();
    //   homeController.getInfoIotAgri();
    //   homeController.getListPlant();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: const <Widget>[
              TitleWithMoreBtn(title: "Recomended"),
              RecomendsPlants(),
              TitleWithMoreBtn(title: "Menu"),
              MenuItemDashBoard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
