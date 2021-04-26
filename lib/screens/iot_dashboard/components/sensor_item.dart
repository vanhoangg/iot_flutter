import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter/constants.dart';
import 'package:iot_flutter/screens/iot_dashboard/components/unicorn_button.dart';

class SensorItem extends StatefulWidget {
  final String title;
  final String data;
  final String unit;
  SensorItem({this.title, this.data, this.unit});
  @override
  _SensorItemState createState() => _SensorItemState();
}

class _SensorItemState extends State<SensorItem> {
  bool isStart;
  @override
  void initState() {
    isStart = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 4,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                Image.asset("assets/icons/enable.png",
                    color: isStart ? Colors.red : Colors.black),
              ],
            ),
            onPressed: () {
              setState(() {
                isStart = !isStart;
              });
            },
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width / 3,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: kDefaultPadding * 2,
                      child: ListTile(
                        title: Text(
                          "${widget.title}: ",
                          style: TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          "${widget.data}" + "${widget.unit}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  }),
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
