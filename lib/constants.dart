import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

const double kDefaultPadding = 20.0;

const String baseUrl = "http://192.168.1.217:3001/";
const String infoIots = "info-iots";
const String plants = "suggestion-plants";
const String history = "history";
const String mqttUrl = "mqtt://192.168.1.217";
const String tracking = "http://localhost:3001/tracking";

Center kLoadingSpinner = const Center(
  child: SpinKitCircle(
    color: Color(0xff008080),
    size: 50.0,
  ),
);
