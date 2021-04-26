import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter/model/air-conditioner_model.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants.dart';
import 'components/sensor_item.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _AppStateMQTT createState() => _AppStateMQTT();
}

class _AppStateMQTT extends State<DashBoardScreen> {
  // khai báo thông số
  String clientId = Random().toString();
  String mqtt_server = "192.168.1.216";
  String mqtt_user = "taolaThachSauDoi";
  String mqtt_pass = "";
  int mqtt_port = 1883; // APP => TCP
  String socket_io_server = "http://localhost";
  int socket_io_port = 3001;
  String topicsub = "air-conditioner"; // nhan du lieu
  String topicpub = "air-conditioner";
  bool _isStart = false;
  var data;
  String mqttmessage = "";
  String nhietdo = "0";
  String doam = "0";
  String relay1 = "OFF";
  String relay2 = "OFF";
  String cai1 = "0";
  String cai2 = "0";
  bool isChecked = false;
  MqttClient client;
  MqttConnectionState connectionState;

  TextEditingController text1 = new TextEditingController();
  TextEditingController text2 = new TextEditingController();

  TextEditingController messageServer = new TextEditingController();
  AirConditionerModel mayLanh;
  double _currentSliderValue = 0;
  @override
  void initState() {
    super.initState();
    mayLanh = new AirConditionerModel(mqtt_user, _isStart);
    ShowToask("WELCOME TO APP IOT MQTT");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Color(0xFFF9F8FD),
                Color(0xFFF9F8FD),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(children: [
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
              ]),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SensorItem(title: "Nhiệt độ", data: "38", unit: "°C"),
                    SensorItem(
                      title: "Độ ẩm",
                      data: "38",
                      unit: "g/m",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void UpdateTemperature() {
    data = mayLanh?.toJson().toString();
    print(data);
    publish(data);
  }

  void _isChecked(value) {
    if (value) {
      ConnectMQTT();
    } else {
      _disconnect();
    }
    
    isChecked = value;
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
      _disconnect();
    }
    if (client.connectionState == MqttConnectionState.connected) {
      setState(() {
        connectionState = client.connectionState;
        client.subscribe(topicsub, MqttQos.exactlyOnce);
        print('CONNECT MQTT BROKER AND SUBSCRIBE TOPIC: $topicsub');
        ShowToask("'CONNECT MQTT BROKER");
        client.updates.listen(_onMessage);
      });
    } else {
      _disconnect();
      print('Connection failed , state is ${client.connectionState}');
      ShowToask("'NOT CONNECT MQTT BROKER");
    }
  }

  void send1() {
    print("Send 1");
    print(text1.text.toString());
    String tx = "E" + text1.text.toString() + "F";
    publish(tx);
  }

  void onclick1() {
    print("Onclick button 1");
    // String tx = "Send Message Nut 1 ";

    // {"RL1":"0"}
    String tx =
        "{\"topic\":\"$topicpub\",\"user\":\"vanHoang\",\"isStart\":\"false\"}";
    publish(tx);
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

  void _onMessage(List<MqttReceivedMessage<MqttMessage>> event) {
    // hàm nhận dũ liệu từ server mqtt
    final MqttPublishMessage recMess = event[0].payload;
    final String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    var DataJsonObject = json.decode(message);
    print('tin nhan :${DataJsonObject["user"]}');
    setState(() {
      messageServer.text = DataJsonObject['user'];
      if (messageServer.text != null) {
        messageServer.text = DataJsonObject['user'];
        print("day la tin nhan " + messageServer.text.toString());
      }
    });
  }

  void _disconnect() {
    client.disconnect();
    ShowToask("Disconnect Broker MQTT");
  }

  void connectSocketIO() {
    // Dart client
    IO.Socket socket = IO.io('$mqtt_server:$mqtt_port');
    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    socket.on('event', (data) => print(data));
    socket.onDisconnect((_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  }
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
