// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screen_util.dart';
// import 'package:get/get.dart';

// import '../../app_btn.dart';
// import '../../components/nav_bar/my_bottom_nav_bar.dart';
// import '../../constants.dart';
// import 'chart_month.dart';
// import 'components/chart_history.dart';
// import 'history_controller.dart';

// class HistoryPage extends StatefulWidget {
//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(isBack: true, context: context),
//       body: GetX<HistoryController>(builder: (controller) {
//         if (controller.listHistory.value == null) {
//           return loadding;
//         }
//         return SingleChildScrollView(
//           child: Container(
//             height: ScreenUtil.defaultSize.height,
//             width: double.infinity,
//             child: Column(
//               children: [
//                 GestureDetector(
//                   child: AppBtn(
//                     title: "Theo ngày",
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//                   child: BarChartSample2(),
//                 ),
//                 Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
//                   child: LineChartSample2(),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }),
//       bottomNavigationBar: MyBottomNavBar(),
//     );
//   }
// }
