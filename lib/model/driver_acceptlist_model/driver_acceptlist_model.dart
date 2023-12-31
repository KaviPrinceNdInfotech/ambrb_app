// To parse this JSON data, do
//
//     final driveracceptModeluser = driveracceptModeluserFromJson(jsonString);

import 'dart:convert';

DriveracceptModeluser driveracceptModeluserFromJson(String str) =>
    DriveracceptModeluser.fromJson(json.decode(str));

String driveracceptModeluserToJson(DriveracceptModeluser data) =>
    json.encode(data.toJson());

class DriveracceptModeluser {
  int? id;
  num? driverId;
  String? driverName;
  String? mobileNumber;
  String? driverImage;
  String? dlNumber;
  num? totalPrice;
  String? vehicleNumber;
  String? vehicleTypeName;
  num? totalDistance;
  String? deviceId;
  double? latDriver;
  double? langDriver;
  double? endLong;
  double? endLat;

  DriveracceptModeluser({
    this.id,
    this.driverId,
    this.driverName,
    this.mobileNumber,
    this.driverImage,
    this.dlNumber,
    this.totalPrice,
    this.vehicleNumber,
    this.vehicleTypeName,
    this.totalDistance,
    this.deviceId,
    this.latDriver,
    this.langDriver,
    this.endLong,
    this.endLat,
  });

  factory DriveracceptModeluser.fromJson(Map<String, dynamic> json) =>
      DriveracceptModeluser(
        id: json["Id"],
        driverId: json["DriverId"],
        driverName: json["DriverName"],
        mobileNumber: json["MobileNumber"],
        driverImage: json["DriverImage"],
        dlNumber: json["DlNumber"],
        totalPrice: json["TotalPrice"],
        vehicleNumber: json["VehicleNumber"],
        vehicleTypeName: json["VehicleTypeName"],
        totalDistance: json["TotalDistance"],
        deviceId: json["DeviceId"],
        latDriver: json["Lat_Driver"]?.toDouble(),
        langDriver: json["Lang_Driver"]?.toDouble(),
        endLong: json["end_Long"]?.toDouble(),
        endLat: json["end_Lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "DriverImage": driverImage,
        "DlNumber": dlNumber,
        "TotalPrice": totalPrice,
        "VehicleNumber": vehicleNumber,
        "VehicleTypeName": vehicleTypeName,
        "TotalDistance": totalDistance,
        "DeviceId": deviceId,
        "Lat_Driver": latDriver,
        "Lang_Driver": langDriver,
        "end_Long": endLong,
        "end_Lat": endLat,
      };
}
