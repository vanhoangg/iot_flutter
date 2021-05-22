import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const double kDefaultPadding = 20.0;
const String baseUrl = "http://127.0.0.1:3001/";
const String infoIots = "info-iots";
const String plants = "suggestion-plants";
const String history = "history";
const String mqttUrl = "mqtt://127.0.0.1";
const int mqttPort = 1883; // APP
Center kLoadingSpinner = const Center(
  child: SpinKitCircle(
    color: Color(0xff008080),
    size: 50.0,
  ),
);
