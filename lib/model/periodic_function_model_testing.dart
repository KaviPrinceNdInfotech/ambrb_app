// To parse this JSON data, do
//
//     final priodicFunctionModel = priodicFunctionModelFromJson(jsonString);

import 'dart:convert';

PriodicFunctionModel priodicFunctionModelFromJson(String str) =>
    PriodicFunctionModel.fromJson(json.decode(str));

String priodicFunctionModelToJson(PriodicFunctionModel data) =>
    json.encode(data.toJson());

class PriodicFunctionModel {
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

  PriodicFunctionModel({
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
  });

  factory PriodicFunctionModel.fromJson(Map<String, dynamic> json) =>
      PriodicFunctionModel(
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
      };
}
