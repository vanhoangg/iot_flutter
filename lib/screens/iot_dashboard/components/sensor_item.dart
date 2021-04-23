import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter/screens/iot_dashboard/components/unicorn_button.dart';

class SensorItem extends StatefulWidget {
  @override
  _SensorItemState createState() => _SensorItemState();
}

class _SensorItemState extends State<SensorItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          UnicornOutlineButton(
            strokeWidth: 4,
            radius: size.width / 2,
            gradient: LinearGradient(
              colors: [Colors.red, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/9.jpg"),
                Text(
                  "15 g/m3",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            onPressed: () {},
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("A"),
                  Text("A"),
                  Text("A"),
                  Text("A"),
                  Text("A"),
                ],
              ),
            ),
          )
        ],
      ),
      // ElevatedButton(
      //   style: ElevatedButton.styleFrom(
      //       shape: CircleBorder(), primary: Colors.black.withOpacity(0.05)),
      //   child: Container(
      //     width: MediaQuery.of(context).size.width / 3,
      //     height: MediaQuery.of(context).size.width / 3,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(shape: BoxShape.circle),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Image.asset("assets/icons/9.jpg"),
      //         Text(
      //           "15 g/m3",
      //           style: TextStyle(color: Colors.black),
      //         ),
      //       ],
      //     ),
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}
