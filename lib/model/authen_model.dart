// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    this.profile,
    this.token,
  });

  Profile? profile;
  String? token;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        profile: Profile.fromJson(json["profile"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile?.toJson(),
        "token": token,
      };
}

class Profile {
  Profile({
    this.listPlant,
    this.id,
    this.userName,
    this.password,
    this.email,
    this.phoneNumber,
    this.address,
    this.avatar,
    this.v,
  });

  List<dynamic>? listPlant;
  String? id;
  String? userName;
  String? password;
  String? email;
  String? phoneNumber;
  String? address;
  String? avatar;
  int? v;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        listPlant: List<dynamic>.from(json["listPlant"].map((x) => x)),
        id: json["_id"],
        userName: json["userName"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        avatar: json["avatar"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "listPlant": List<dynamic>.from(listPlant?.map((x) => x) ?? []),
        "_id": id,
        "userName": userName,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "avatar": avatar,
        "__v": v,
      };
}
