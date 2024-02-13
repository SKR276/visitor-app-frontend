// To parse this JSON data, do
//
//     final viewVisitorList = viewVisitorListFromJson(jsonString);

import 'dart:convert';

List<ViewVisitorList> viewVisitorListFromJson(String str) => List<ViewVisitorList>.from(json.decode(str).map((x) => ViewVisitorList.fromJson(x)));

String viewVisitorListToJson(List<ViewVisitorList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewVisitorList {
  SecurityId securityId;
  String visitorName;
  String purpose;
  String address;
  String phoneNo;
  DateTime visitDate;

  ViewVisitorList({
    required this.securityId,
    required this.visitorName,
    required this.purpose,
    required this.address,
    required this.phoneNo,
    required this.visitDate,
  });

  factory ViewVisitorList.fromJson(Map<String, dynamic> json) => ViewVisitorList(
    securityId: SecurityId.fromJson(json["securityId"]),
    visitorName: json["visitorName"],
    purpose: json["purpose"],
    address: json["address"],
    phoneNo: json["phoneNo"],
    visitDate: DateTime.parse(json["visitDate"]),
  );

  Map<String, dynamic> toJson() => {
    "securityId": securityId.toJson(),
    "visitorName": visitorName,
    "purpose": purpose,
    "address": address,
    "phoneNo": phoneNo,
    "visitDate": visitDate.toIso8601String(),
  };
}

class SecurityId {
  String id;
  String securityName;

  SecurityId({
    required this.id,
    required this.securityName,
  });

  factory SecurityId.fromJson(Map<String, dynamic> json) => SecurityId(
    id: json["_id"],
    securityName: json["securityName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "securityName": securityName,
  };
}
