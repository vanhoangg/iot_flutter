import 'dart:convert';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:iot_flutter/air-conditioner.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeMQTT(),
    );
  }
}

class homeMQTT extends StatefulWidget {
  @override
  _AppStateMQTT createState() => _AppStateMQTT();
}

class _AppStateMQTT extends State<homeMQTT> {

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
  AirConditioner mayLanh;
  double _currentSliderValue = 0;
  @override
  void initState() {
    super.initState();
    mayLanh = new AirConditioner(mqtt_user,_isStart);
    ShowToask("WELCOME TO APP IOT MQTT");
  }

  @override
  Widget build(BuildContext context) {
    // TẠO GIAO DIỆN trong Scaffold
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    // Colors.black54,
                    Colors.black,
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex:1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Connect Server",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Row(
                            children: <Widget>[
                              Text("OFF",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              Center(
                                child: Switch(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked(value);
                                    });
                                  },
                                  activeTrackColor: Colors.black,
                                  activeColor: Colors.black12,
                                ),
                              ),
                              Text("ON",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                      SizedBox(
                        child: Row(children:[ Text(messageServer.text.toString()),]),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex:5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonTheme(
                              padding: const EdgeInsets.all(8),
                              height: 48,
                              child: RaisedButton(
                                onPressed: onclick1,
                                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Cập nhật Nhiệt Độ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset("assets/icon/8.jpg"),
                                Text(
                                  "15 g/m3",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0,30,0,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonTheme(
                              padding: const EdgeInsets.all(8),
                              height: 48,
                              child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(16, 0, 32, 0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Cập nhật Độ Ẩm",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset("assets/icon/9.jpg"),
                                Text(
                                  "15 g/m3",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void UpdateTemperature(){
    data = mayLanh?.toJson().toString();
    print(data);
    publish(data);
  }
  void _isChecked(value) {
    if (value) {
      ConnectMQTT();
    }
    else {
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
    String tx = "{\"topic\":\"$topicpub\",\"user\":\"vanHoang\",\"isStart\":\"false\"}";
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
  void connectSocketIO(){
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

