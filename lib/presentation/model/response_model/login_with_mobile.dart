// To parse this JSON data, do
//
//     final loginWithMobileResponse = loginWithMobileResponseFromJson(jsonString);

import 'dart:convert';

LoginWithMobileResponse loginWithMobileResponseFromJson(String str) => LoginWithMobileResponse.fromJson(json.decode(str));

String loginWithMobileResponseToJson(LoginWithMobileResponse data) => json.encode(data.toJson());

class LoginWithMobileResponse {
  final String? message;
  final MobilLogin? data;
  final String? token;

  LoginWithMobileResponse({
    this.message,
    this.data,
    this.token,
  });

  factory LoginWithMobileResponse.fromJson(Map<String, dynamic> json) => LoginWithMobileResponse(
    message: json["message"],
    data: json["data"] == null ? null : MobilLogin.fromJson(json["data"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "token": token,
  };
}

class MobilLogin {
  final String? id;
  final String? mobile;
  final String? otp;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  MobilLogin({
    this.id,
    this.mobile,
    this.otp,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MobilLogin.fromJson(Map<String, dynamic> json) => MobilLogin(
    id: json["_id"],
    mobile: json["mobile"],
    otp: json["otp"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "mobile": mobile,
    "otp": otp,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
