// To parse this JSON data, do
//
//     final driverListByPostModel = driverListByPostModelFromJson(jsonString);

import 'dart:convert';

DriverListByPostModel driverListByPostModelFromJson(String str) =>
    DriverListByPostModel.fromJson(json.decode(str));

String driverListByPostModelToJson(DriverListByPostModel data) =>
    json.encode(data.toJson());

class DriverListByPostModel {
  double? startLat;
  double? startLong;
  double? endLong;
  double? endLat;
  dynamic ambulanceTypeId;
  int? vehicleTypeId;
  int? patientId;
  List<Message>? message;

  DriverListByPostModel({
    this.startLat,
    this.startLong,
    this.endLong,
    this.endLat,
    this.ambulanceTypeId,
    this.vehicleTypeId,
    this.patientId,
    this.message,
  });

  factory DriverListByPostModel.fromJson(Map<String, dynamic> json) =>
      DriverListByPostModel(
        startLat: json["start_Lat"]?.toDouble(),
        startLong: json["start_Long"]?.toDouble(),
        endLong: json["end_Long"]?.toDouble(),
        endLat: json["end_Lat"]?.toDouble(),
        ambulanceTypeId: json["AmbulanceType_id"],
        vehicleTypeId: json["VehicleType_id"],
        patientId: json["Patient_Id"],
        message: json["Message"] == null
            ? []
            : List<Message>.from(
                json["Message"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_Lat": startLat,
        "start_Long": startLong,
        "end_Long": endLong,
        "end_Lat": endLat,
        "AmbulanceType_id": ambulanceTypeId,
        "VehicleType_id": vehicleTypeId,
        "Patient_Id": patientId,
        "Message": message == null
            ? []
            : List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class Message {
  num? id;
  num? driverId;
  num? km;
  String? name;
  String? dl;
  num? charge;
  num? totalPrice;
  String? deviceId;
  dynamic toalDistance;

  Message({
    this.id,
    this.driverId,
    this.km,
    this.name,
    this.dl,
    this.charge,
    this.totalPrice,
    this.deviceId,
    this.toalDistance,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["Id"],
        driverId: json["DriverId"],
        km: json["KM"],
        name: json["Name"],
        dl: json["DL"],
        charge: json["Charge"],
        totalPrice: json["TotalPrice"],
        deviceId: json["DeviceId"],
        toalDistance: json["ToalDistance"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "KM": km,
        "Name": name,
        "DL": dl,
        "Charge": charge,
        "TotalPrice": totalPrice,
        "DeviceId": deviceId,
        "ToalDistance": toalDistance,
      };
}
