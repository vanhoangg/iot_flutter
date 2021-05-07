import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/model/air-conditioner_model.dart';
import 'package:iot_flutter/model/history_model.dart';
import 'package:iot_flutter/screens/history/history_controller.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../constants.dart';

class DashBoardController extends GetxController {
  HistoryController historyController = HistoryController();
  var sensor = SensorModel().obs;
  String clientId = Random().toString();
  String mqtt_server = "192.168.11.164";
  String mqtt_user = "hoang";
  String mqtt_pass = "";
  int mqtt_port = 1883; // APP => TCP
  String socket_io_server = "http://localhost";
  int socket_io_port = 3001;
  String topicsub = "air-conditioner"; // nhan du lieu
  String topicpub = "air-conditioner";
  var sendMessage;

  var socket;

  MqttClient client;
  MqttConnectionState connectionState;
  @override
  void onInit() {
    sensor.value = SensorModel(name: "dinhvanhoang", isStart: false);
    ConnectMQTT();
    update();
    super.onInit();
  }

  checkSensor(SensorModel sensor, String topic, List<History> list) {
    if (sensor.isStart == null) {
      for (int i = 0; i < list.length; i++) {
        if (list[i].topic == topic) {
          sensor.isStart = list[i].isStart;
        }
      }
    }
  }

  void ConnectMQTT() async {
    client = MqttClient(mqtt_server, '');
    client.logging(on: true);
    client.keepAlivePeriod = 30;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .keepAliveFor(30)
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMess;
    try {
      await client.connect(mqtt_user, mqtt_pass);
    } catch (e) {
      print(e);
      disconnect();
    }
    if (client.connectionState == MqttConnectionState.connected) {
      connectionState = client.connectionState;
      client.subscribe(topicsub, MqttQos.exactlyOnce);
      print('CONNECT MQTT BROKER AND SUBSCRIBE TOPIC: $topicsub');
      ShowToask("'CONNECT MQTT BROKER");
      client.updates.listen(onMessage);
    } else {
      disconnect();
      print('Connection failed , state is ${client.connectionState}');
      ShowToask("'NOT CONNECT MQTT BROKER");
    }
  }

  void disconnect() {
    client.disconnect();
    ShowToask("Disconnect Broker MQTT");
  }

  void publish(var message) {
    if (connectionState == MqttConnectionState.connected) {
      final MqttClientPayloadBuilder message1 = MqttClientPayloadBuilder();
      message1.addString(message);
      client.publishMessage(topicpub, MqttQos.exactlyOnce, message1.payload);
      print('Data send:  ${message}');
      ShowToask(message);
    }
  }

  void onMessage(List<MqttReceivedMessage<MqttMessage>> event) {
    // hàm nhận dũ liệu từ server mqtt
    final MqttPublishMessage recMess = event[0].payload;
    final String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    var data = json.decode(message);
    sensor.value = SensorModel.fromJsonMap(data);
    update();
  }

  void ShowToask(String message) {
    Fluttertoast.showToast(
        msg: '$message',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool onChangeSensor() {
    sensor.value.isStart = !sensor.value.isStart;
    sensor.value.name = mqtt_user;

    sendMessage = sensor.value.toJson();
    sendMessage.publish(sendMessage);
    return sensor.value.isStart;
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
