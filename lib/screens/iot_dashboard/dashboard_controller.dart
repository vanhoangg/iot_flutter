import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:uuid/uuid.dart';

import '../../constants.dart';
import '../../model/history_model.dart';
import '../../model/sub_sensor.model.dart';
import '../authen/controller/auth_controller.dart';

class DashBoardController extends GetxController {
  var subSensor = Rx<SubSensorModel>(SubSensorModel());
  String clientId = Random().toString();
  AuthController authController = Get.find();
  var uuid = const Uuid().v1();

  // String mqtt_server = "192.168.1.217";
  String mqttUsername = "hoang";
  String mqttPassword = "";
  Rx<bool> isClicked = Rx<bool>(true);

  var humidity = 0.obs;
  var temp = 0.obs;

  MqttClient client = MqttClient(mqttUrl, "uuid");
  MqttConnectionState? connectionState;
  @override
  void onInit() {
    conecttMQTT(iotTopic);
    // conecttMQTT(airTopic);
    update();
    super.onInit();
  }

  void conecttMQTT(String topicsub) async {
    client = MqttClient(mqttUrl, uuid);
    client.port = mqttPort;
    client.logging(on: true);
    client.keepAlivePeriod = 20;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(uuid)
        .keepAliveFor(30)
        // .authenticateAs(mqttUsername, password)
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMess;
    try {
      await client.connect(mqttUsername, mqttPassword);
    } catch (e) {
      disconnect();
    }
    if (client.connectionState == MqttConnectionState.connected) {
      connectionState = client.connectionState;
      client.subscribe(topicsub, MqttQos.exactlyOnce);

      // showToask("'CONNECT MQTT BROKER");
      client.updates?.listen(onMessage);
    } else {
      disconnect();
      // showToask("'NOT CONNECT MQTT BROKER");
    }
  }

  void disconnect() async {
    client.disconnect();
    showToask("Disconnect Broker MQTT");
  }

  void publish(var message, String topicPub) {
    if (connectionState == MqttConnectionState.connected) {
      final MqttClientPayloadBuilder message1 = MqttClientPayloadBuilder();
      message1.addString(message);
      client.publishMessage(topicPub, MqttQos.exactlyOnce, message1.payload!);
      // ShowToask(message);
    }
  }

  void onMessage(List<MqttReceivedMessage<MqttMessage>> event) async {
    // hàm nhận dũ liệu từ server mqtt
    final MqttPublishMessage recMess = event[0].payload as MqttPublishMessage;
    final String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    var data = json.decode(message);
    subSensor.value = SubSensorModel.fromJson(data);
    // Get.find<HistoryController>().updateHistory();
    await getSubSensor();
    update();
  }

  showToask(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void onclick1(SubSensorModel sensor) {
    sensor.isStart = !(sensor.isStart ?? false);
    // String tx = "Send Message Nut 1 ";
    temp += Random().nextInt(30);
    humidity += Random().nextInt(100);
    update();
    // {"RL1":"0"}
    String tx =
        "{\"sensorName\":\"${sensor.sensorName}\",\"user\":\"${authController.userProfile.value.profile?.userName}\",\"isStart\":${sensor.isStart},\"sensorType\":1}";

    publish(tx, iotTopic);
  }

  var sonometerSensor = SubSensorModel().obs;
  var thermometerSensor = SubSensorModel().obs;
  var cloudSensor = SubSensorModel().obs;
  var windSensor = SubSensorModel().obs;
  var temperatureSensor = SubSensorModel().obs;
  var pressureSensor = SubSensorModel().obs;
  var mainSensor = SubSensorModel().obs;
  var rainSensor = SubSensorModel().obs;

  getSubSensor() {
    if (subSensor.value.sensorType == 2) {
      switch (subSensor.value.sensorName) {
        case "sonometer":
          return sonometerSensor.value = subSensor.value;
        case "thermometer":
          return thermometerSensor.value = subSensor.value;
        case "cloud":
          return cloudSensor.value = subSensor.value;
        case "wind":
          return windSensor.value = subSensor.value;
        case "pressure":
          return pressureSensor.value = subSensor.value;
        case "temperature":
          return temperatureSensor.value = subSensor.value;
        case "rain":
          return rainSensor.value = subSensor.value;
      }
    }
    if (subSensor.value.sensorType == 1) {
      return mainSensor.value = subSensor.value;
    }
  }

  setImageForSensor(SubSensorModel a) {
    switch (a.sensorName) {
      case "fan":
        if (a.isStart ?? false) return "assets/fan_on.png";
        return "assets/fan_off.png";
      case "Motor pH":
        if (a.isStart ?? false) return "assets/ph_on.png";
        return "assets/ph_off.png";
      case "air-conditioner":
        if (a.isStart ?? false) return "assets/air_conditioner_on.png";
        return "assets/air_connditoner_off.png";
      case "fountain":
        if (a.isStart ?? false) return "assets/fountain_on.png";
        return "assets/fountain_off.png";
      case "incandescent bulbs":
        if (a.isStart ?? false) return "assets/icons/on.jpg";
        return "assets/icons/off.jpg";
      default:
        return "assets/icons/temp.jpg";
    }
  }

  checkLastAction(History? lastAction) {
    if (mainSensor.value.isStart == null) {
      mainSensor.value = SubSensorModel(
          sensorType: lastAction?.sensorType,
          sensorName: lastAction?.sensorName,
          user: lastAction?.user,
          isStart: lastAction?.isStart);
      return mainSensor.value;
    }
  }

  ///
  // void connectToServer() {
  //   try {
  //     // Configure socket transports must be sepecified
  //     socket = io('$tracking', <String, dynamic>{
  //       'transports': ['websocket'],
  //       'autoConnect': false,
  //     });

  //     // Connect to websocket
  //     socket.connect();

  //     // Handle socket events
  //     socket.on('connect', (_) => print('connect: ${socket.id}'));
  //     socket.on('newAction', (_)=> print('${soc}'));
  //     socket.on('disconnect', (_) => print('disconnect'));
  //     socket.on('fromServer', (_) => print(_));
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // // Listen to all message events from connected users
  // void handleMessage(dynamic data) {
  //   print("day la data $data");
  // }
}
