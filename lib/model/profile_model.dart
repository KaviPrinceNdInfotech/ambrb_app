// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  ProfileData? result;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    status: json["status"],
    message: json["message"],
    result: ProfileData.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result?.toJson(),
  };
}

class ProfileData {
  ProfileData({
    this.id,
    this.name,
    this.companyname,
    this.mobileNo,
    this.address,
    this.aadhar,
    this.membershipplan,
    this.typeOfCompany,
  });

  int? id;
  String? name;
  String? companyname;
  String? mobileNo;
  String? address;
  String? aadhar;
  String? membershipplan;
  dynamic typeOfCompany;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: json["id"],
    name: json["name"],
    companyname: json["companyname"],
    mobileNo: json["mobileNo"],
    address: json["address"],
    aadhar: json["aadhar"],
    membershipplan: json["membershipplan"],
    typeOfCompany: json["typeOfCompany"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "companyname": companyname,
    "mobileNo": mobileNo,
    "address": address,
    "aadhar": aadhar,
    "membershipplan": membershipplan,
    "typeOfCompany": typeOfCompany,
  };
}
