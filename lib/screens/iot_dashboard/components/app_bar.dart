import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
                Expanded(
                  child: IconButton(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Smart IOT",
                        style: TextStyle(
                            color: Color(0xFF0C9869),
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Row(
                        children: <Widget>[
                          Center(
                            child: Switch(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isChecked(value);
                                });
                              },
                              activeTrackColor: Color(0xFF0C9869),
                              activeColor: Colors.black12,
                            ),
                          ),
                        ],
                      )),
                ),
              ])
  }
}