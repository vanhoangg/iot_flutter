import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/authen_model.dart';

class AuthRepository {
  Future<Auth> login({@required String user, @required String password}) async {
    final client = new http.Client();
    var response =
        await client.post("${loginUrl}userName=$user&password=$password");
    print(response);
    if (response.statusCode == 200) {
      if (response == null) return null;
      var jsonString = response.body;

      return authFromJson(jsonString);
    }
    return null;
  }

  Future<dynamic> reg({Profile user}) async {
    final client = new http.Client();
    // http://localhost:3001/signup?userName=shin1232&password=123&email=123@gmail.com&phoneNumber=12323&address=234234
    var response = await client.post(
        "${signupUrl}userName=${user.userName}&password=${user.password}&email=${user.email}&phoneNumber=${user.phoneNumber}&address=${user.address}");
    // var response = await client.post(reg, body: {
    //   "username": user.userName,
    //   "password": user.password,
    //   "email": user.email,
    //   "phoneNumber": user.phoneNumber,
    //   "address": user.address
    // });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return authFromJson(jsonString);
    }
    if (response == null) return null;

    return response.statusCode;
  }
}
