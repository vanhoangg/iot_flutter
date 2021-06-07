import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/nav_bar/my_bottom_nav_bar.dart';
import '../../constants.dart';
import '../history/history_controller.dart';
import 'components/header_with_seachbox.dart';
import 'components/home_menu.dart';
import 'components/recomend_plants.dart';
import 'components/title_with_more_bbtn.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController());

    return Scaffold(
      appBar: buildAppBar(context: context),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              HeaderWithSearchBox(size: MediaQuery.of(context).size),
              TitleWithMoreBtn(title: "Recomended"),
              RecomendsPlants(),
              TitleWithMoreBtn(title: "Menu"),
              MenuItem(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
