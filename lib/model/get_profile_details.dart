// To parse this JSON data, do
//
//     final getProfileDetail = getProfileDetailFromJson(jsonString);

import 'dart:convert';

GetProfileDetail getProfileDetailFromJson(String str) =>
    GetProfileDetail.fromJson(json.decode(str));

String getProfileDetailToJson(GetProfileDetail data) =>
    json.encode(data.toJson());

class GetProfileDetail {
  int? id;
  String? patientName;
  String? emailId;
  dynamic mobileNumber;
  String? location;
  String? pinCode;
  String? stateName;
  String? cityName;
  String? gender;
  DateTime? dob;

  GetProfileDetail({
    this.id,
    this.patientName,
    this.emailId,
    this.mobileNumber,
    this.location,
    this.pinCode,
    this.stateName,
    this.cityName,
    this.gender,
    this.dob,
  });

  factory GetProfileDetail.fromJson(Map<String, dynamic> json) =>
      GetProfileDetail(
        id: json["Id"],
        patientName: json["PatientName"],
        emailId: json["EmailId"],
        mobileNumber: json["MobileNumber"],
        location: json["Location"],
        pinCode: json["PinCode"],
        stateName: json["StateName"],
        cityName: json["CityName"],
        gender: json["Gender"],
        dob: json["DOB"] == null ? null : DateTime.parse(json["DOB"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "PatientName": patientName,
        "EmailId": emailId,
        "MobileNumber": mobileNumber,
        "Location": location,
        "PinCode": pinCode,
        "StateName": stateName,
        "CityName": cityName,
        "Gender": gender,
        "DOB": dob?.toIso8601String(),
      };
}
