import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/model/air-conditioner_model.dart';
import 'package:mqtt_client/mqtt_client.dart';

class DashBoardController extends GetxController {
  var mayLanh = AirConditionerModel().obs;
  String clientId = Random().toString();
  String mqtt_server = "192.168.1.217";
  String mqtt_user = "taolaThachSauDoi";
  String mqtt_pass = "";
  int mqtt_port = 1883; // APP => TCP
  String socket_io_server = "http://localhost";
  int socket_io_port = 3001;
  String topicsub = "air-conditioner"; // nhan du lieu
  String topicpub = "air-conditioner";
  var sendMessage;

  MqttClient client;
  MqttConnectionState connectionState;
  @override
  void onInit() {
    ConnectMQTT();
    super.onInit();
  }

  void ConnectMQTT() async {
    client = MqttClient(mqtt_server, '');
    client.port = mqtt_port;
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
    mayLanh.value = AirConditionerModel.fromJsonMap(data);
    update();
  }
  // void connectSocketIO() {
  //   // Dart client
  //   IO.Socket socket = IO.io('$mqtt_server:$mqtt_port');
  //   socket.onConnect((_) {
  //     print('connect');
  //     socket.emit('msg', 'test');
  //   });
  //   socket.on('event', (data) => print(data));
  //   socket.onDisconnect((_) => print('disconnect'));
  //   socket.on('fromServer', (_) => print(_));
  // }

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
    mayLanh.value.isStart = !mayLanh.value.isStart;
    mayLanh.value.name = mqtt_user;

    sendMessage = mayLanh.value.toJson();
    sendMessage.publish(sendMessage);
    return mayLanh.value.isStart;
  }
}
