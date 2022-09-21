// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screen_util.dart';
// import 'package:get/get.dart';

// import '../../app_color.dart';
// import '../../constants.dart';
// import 'history_controller.dart';

// class BarChartSample2 extends StatefulWidget {
//   final HistoryController controller = Get.find();

//   @override
//   State<StatefulWidget> createState() => BarChartSample2State();
// }

// class BarChartSample2State extends State<BarChartSample2> {
//   final Color leftBarColor = const Color(0xff53fdd7);
//   final Color rightBarColor = const Color(0xffff5182);
//   final double width = 20;

//   List<BarChartGroupData> rawBarGroups;
//   List<BarChartGroupData> showingBarGroups;

//   int touchedGroupIndex = -1;

//   HistoryController controller = Get.find();

//   @override
//   void initState() {
//     super.initState();

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1,
//       child: Card(
//         elevation: 0,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
//         color: const Color(0xff2c4260),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: GetX<HistoryController>(builder: (controller) {
//             controller.getHistory();

//             final barGroup1 = makeGroupData(
//                 0, widget.controller.listChartData[0].countEnable);
//             final barGroup2 = makeGroupData(
//                 1, widget.controller.listChartData[1].countEnable);
//             final barGroup3 = makeGroupData(
//                 2, widget.controller.listChartData[2].countEnable);
//             final barGroup4 = makeGroupData(
//                 3, widget.controller.listChartData[3].countEnable);
//             final barGroup5 = makeGroupData(
//                 4, widget.controller.listChartData[4].countEnable);
//             // final barGroup3 = makeGroupData(2, 18, 5);
//             // final barGroup4 = makeGroupData(3, 20, 16);
//             // final barGroup5 = makeGroupData(4, 17, 6);
//             // final barGroup6 = makeGroupData(5, 19, 1.5);
//             // final barGroup7 = makeGroupData(6, 10, 1.5);

//             final items = [
//               barGroup1,
//               barGroup2,
//               barGroup3,
//               barGroup4,
//               barGroup5,
//               // barGroup6,
//               // barGroup7,
//             ];

//             rawBarGroups = items;

//             showingBarGroups = rawBarGroups;
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         top: kDefaultPadding, left: kDefaultPadding / 6),
//                     child: BarChart(
//                       BarChartData(
//                         maxY: controller.listChartData.last.countEnable
//                             .toDouble(),
//                         barTouchData: BarTouchData(
//                             touchTooltipData: BarTouchTooltipData(
//                               tooltipBgColor: Colors.grey,
//                               getTooltipItem: (_a, _b, _c, _d) => null,
//                             ),
//                             touchCallback: (response) {
//                               if (response.spot == null) {
//                                 setState(() {
//                                   touchedGroupIndex = -1;
//                                   showingBarGroups = List.of(rawBarGroups);
//                                 });
//                                 return;
//                               }

//                               touchedGroupIndex =
//                                   response.spot?.touchedBarGroupIndex;

//                               setState(() {
//                                 if (response.touchInput is PointerExitEvent ||
//                                     response.touchInput is PointerUpEvent) {
//                                   touchedGroupIndex = -1;
//                                   showingBarGroups = List.of(rawBarGroups);
//                                 } else {
//                                   showingBarGroups = List.of(rawBarGroups);
//                                   if (touchedGroupIndex != -1) {
//                                     var sum = 0.0;
//                                     for (var rod
//                                         in showingBarGroups[touchedGroupIndex]
//                                             .barRods) {
//                                       sum += rod.y;
//                                     }
//                                     final avg = sum /
//                                         showingBarGroups[touchedGroupIndex]
//                                             .barRods
//                                             .length;

//                                     showingBarGroups[touchedGroupIndex] =
//                                         showingBarGroups[touchedGroupIndex]
//                                             .copyWith(
//                                       barRods:
//                                           showingBarGroups[touchedGroupIndex]
//                                               .barRods
//                                               .map((rod) {
//                                         return rod.copyWith(y: avg);
//                                       }).toList(),
//                                     );
//                                   }
//                                 }
//                               });
//                             }),
//                         titlesData: FlTitlesData(
//                           show: true,
//                           bottomTitles: SideTitles(
//                             showTitles: true,
//                             getTextStyles: (value) => TextStyle(
//                                 color: Color(0xff7589a2),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: ScreenUtil().setSp(8)),
//                             margin: kDefaultPadding,
//                             getTitles: (double value) {
//                               print(controller.listChartData[0].topic);

//                               switch (value.toInt()) {
//                                 case 0:
//                                   return controller.listChartData[0].topic;
//                                 case 1:
//                                   return controller.listChartData[1].topic;
//                                 case 2:
//                                   return controller.listChartData[2].topic;
//                                 case 3:
//                                   return controller.listChartData[3].topic;
//                                 case 4:
//                                   return controller.listChartData[4].topic;
//                               }
//                               return "";
//                             },
//                           ),
//                           leftTitles: SideTitles(
//                             showTitles: true,
//                             getTextStyles: (value) => const TextStyle(
//                                 color: Color(0xff7589a2),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12),
//                             margin: kDefaultPadding,
//                             reservedSize: 0,
//                             getTitles: (value) {
//                               // if (widget.controller.listChartData.value.where(
//                               //         (e) => e.countEnable == value.toInt()) !=
//                               //     null) {
//                               //   return widget.controller.listChartData
//                               //       .value[value.toInt()].countEnable
//                               //       .toString();
//                               // } else
//                               //   return "";

//                               if (value ==
//                                   controller.listChartData[0].countEnable) {
//                                 return controller.listChartData[0].countEnable
//                                     .toString();
//                               } else if (value ==
//                                   controller
//                                       .listChartData[
//                                           controller.listChartData.length ~/ 2]
//                                       .countEnable) {
//                                 return controller
//                                     .listChartData[controller
//                                             .listChartData.length -
//                                         (controller.listChartData.length ~/ 2)
//                                             .toInt()]
//                                     .countEnable
//                                     .toString();
//                               } else if (value ==
//                                   controller.listChartData.last.countEnable) {
//                                 return controller.listChartData.last.countEnable
//                                     .toString();
//                               } else if (value == 0) {
//                                 return '0';
//                               }
//                               return "";
//                             },
//                           ),
//                         ),
//                         borderData: FlBorderData(
//                           show: false,
//                         ),
//                         barGroups: showingBarGroups,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }

//   BarChartGroupData makeGroupData(int x, int value) {
//     return BarChartGroupData(barsSpace: 4, x: x, barRods: [
//       BarChartRodData(
//         y: value.toDouble(),
//         colors: [AppColor.secondary],
//         width: width,
//       ),
//     ]
//         // List.generate(
//         //   value.length,
//         //   (index) => BarChartRodData(
//         //     y: value[index].toDouble(),
//         //     colors: [AppColor.secondary],
//         //     width: width,
//         //   ),
//         // ),
//         );
//   }

//   Widget makeTransactionsIcon() {
//     const width = 4.5;
//     const space = 3.5;
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           width: width,
//           height: 10,
//           color: Colors.white.withOpacity(0.4),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 28,
//           color: Colors.white.withOpacity(0.8),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 42,
//           color: Colors.white.withOpacity(1),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 28,
//           color: Colors.white.withOpacity(0.8),
//         ),
//         const SizedBox(
//           width: space,
//         ),
//         Container(
//           width: width,
//           height: 10,
//           color: Colors.white.withOpacity(0.4),
//         ),
//       ],
//     );
//   }
// }
