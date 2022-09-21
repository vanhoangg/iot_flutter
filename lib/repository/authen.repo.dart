import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/authen_model.dart';

class AuthRepository {
  Future<Auth?> login({required String user, required String password}) async {
    final client = http.Client();
    var response = await client
        .post(Uri.parse("${loginUrl}userName=$user&password=$password"));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return authFromJson(jsonString);
    }
    return null;
  }

  Future<dynamic> reg({required Profile user}) async {
    final client = http.Client();
    // http://localhost:3001/signup?userName=shin1232&password=123&email=123@gmail.com&phoneNumber=12323&address=234234
    var response = await client.post(Uri.parse(
        "${signupUrl}userName=${user.userName}&password=${user.password}&email=${user.email}&phoneNumber=${user.phoneNumber}&address=${user.address}"));
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

    return response.statusCode;
  }
}
