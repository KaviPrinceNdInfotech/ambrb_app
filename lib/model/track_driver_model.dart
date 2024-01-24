// To parse this JSON data, do
//
//     final driverTrackModel = driverTrackModelFromJson(jsonString);

import 'dart:convert';

DriverTrackModel driverTrackModelFromJson(String str) =>
    DriverTrackModel.fromJson(json.decode(str));

String driverTrackModelToJson(DriverTrackModel data) =>
    json.encode(data.toJson());

class DriverTrackModel {
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
  dynamic latDriver;
  dynamic langDriver;
  double? driverStartLang;
  double? driverStartLat;
  double? userlocationLat;
  double? userlocationLang;
  double? updatedDriverLat;
  double? updatedDriverLang;

  DriverTrackModel({
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
    this.driverStartLang,
    this.driverStartLat,
    this.userlocationLat,
    this.userlocationLang,
    this.updatedDriverLat,
    this.updatedDriverLang,
  });

  factory DriverTrackModel.fromJson(Map<String, dynamic> json) =>
      DriverTrackModel(
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
        latDriver: json["Lat_Driver"],
        langDriver: json["Lang_Driver"],
        driverStartLang: json["DriverStartLang"]?.toDouble(),
        driverStartLat: json["DriverStartLat"]?.toDouble(),
        userlocationLat: json["UserlocationLat"]?.toDouble(),
        userlocationLang: json["UserlocationLang"]?.toDouble(),
        updatedDriverLat: json["UpdatedDriverLat"]?.toDouble(),
        updatedDriverLang: json["UpdatedDriverLang"]?.toDouble(),
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
        "DriverStartLang": driverStartLang,
        "DriverStartLat": driverStartLat,
        "UserlocationLat": userlocationLat,
        "UserlocationLang": userlocationLang,
        "UpdatedDriverLat": updatedDriverLat,
        "UpdatedDriverLang": updatedDriverLang,
      };
}
