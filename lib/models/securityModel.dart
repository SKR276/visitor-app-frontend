// To parse this JSON data, do
//
//     final viewList = viewListFromJson(jsonString);

import 'dart:convert';

List<ViewList> viewListFromJson(String str) => List<ViewList>.from(json.decode(str).map((x) => ViewList.fromJson(x)));

String viewListToJson(List<ViewList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewList {
  String securityName;
  String securityId;
  String address;
  String phoneNo;
  String email;
  String password;

  ViewList({
    required this.securityName,
    required this.securityId,
    required this.address,
    required this.phoneNo,
    required this.email,
    required this.password,
  });

  factory ViewList.fromJson(Map<String, dynamic> json) => ViewList(
    securityName: json["securityName"],
    securityId: json["securityId"],
    address: json["address"],
    phoneNo: json["phoneNo"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "securityName": securityName,
    "securityId": securityId,
    "address": address,
    "phoneNo": phoneNo,
    "email": email,
    "password": password,
  };
}
