import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/components/nav_bar/my_bottom_nav_bar.dart';
import 'package:iot_flutter/screens/home/components/recomend_plants.dart';
import 'package:iot_flutter/screens/home/components/title_with_more_bbtn.dart';
import 'components/header_with_seachbox.dart';
import 'components/home_menu.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Expanded(child: InfoPage()),

            HeaderWithSearchBox(size: MediaQuery.of(context).size),
            TitleWithMoreBtn(title: "Recomended"),
            RecomendsPlants(),
            TitleWithMoreBtn(title: "Menu"),
            SizedBox(
              height: 10,
            ),
            DashBoardItem(),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
