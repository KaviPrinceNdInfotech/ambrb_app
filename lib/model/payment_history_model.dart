// To parse this JSON data, do
//
//     final driverPaymentHistoryModel = driverPaymentHistoryModelFromJson(jsonString);

import 'dart:convert';

DriverPaymentHistoryModel driverPaymentHistoryModelFromJson(String str) =>
    DriverPaymentHistoryModel.fromJson(json.decode(str));

String driverPaymentHistoryModelToJson(DriverPaymentHistoryModel data) =>
    json.encode(data.toJson());

class DriverPaymentHistoryModel {
  List<DriverDetail>? driverDetails;

  DriverPaymentHistoryModel({
    this.driverDetails,
  });

  factory DriverPaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverPaymentHistoryModel(
        driverDetails: json["driverDetails"] == null
            ? []
            : List<DriverDetail>.from(
                json["driverDetails"]!.map((x) => DriverDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "driverDetails": driverDetails == null
            ? []
            : List<dynamic>.from(driverDetails!.map((x) => x.toJson())),
      };
}

class DriverDetail {
  int? id;
  num? driverId;
  String? driverName;
  String? mobileNumber;
  String? driverImage;
  String? dlNumber;
  num? totalPrice;
  num? paidAmount;
  dynamic remainingAmount;
  String? vehicleNumber;
  String? vehicleTypeName;
  num? totalDistance;
  dynamic latDriver;
  dynamic langDriver;
  dynamic userLat;
  dynamic userLong;
  double? startLat;
  double? startLong;
  double? endLat;
  double? endLong;
  dynamic driverUserDistance;
  num? expectedTime;
  DateTime? paymentDate;
  String? pickupLocation;
  String? dropLocation;

  DriverDetail({
    this.id,
    this.driverId,
    this.driverName,
    this.mobileNumber,
    this.driverImage,
    this.dlNumber,
    this.totalPrice,
    this.paidAmount,
    this.remainingAmount,
    this.vehicleNumber,
    this.vehicleTypeName,
    this.totalDistance,
    this.latDriver,
    this.langDriver,
    this.userLat,
    this.userLong,
    this.startLat,
    this.startLong,
    this.endLat,
    this.endLong,
    this.driverUserDistance,
    this.expectedTime,
    this.paymentDate,
    this.pickupLocation,
    this.dropLocation,
  });

  factory DriverDetail.fromJson(Map<String, dynamic> json) => DriverDetail(
        id: json["Id"],
        driverId: json["DriverId"],
        driverName: json["DriverName"],
        mobileNumber: json["MobileNumber"],
        driverImage: json["DriverImage"],
        dlNumber: json["DlNumber"],
        totalPrice: json["TotalPrice"],
        paidAmount: json["PaidAmount"],
        remainingAmount: json["RemainingAmount"],
        vehicleNumber: json["VehicleNumber"],
        vehicleTypeName: json["VehicleTypeName"],
        totalDistance: json["TotalDistance"],
        latDriver: json["Lat_Driver"],
        langDriver: json["Lang_Driver"],
        userLat: json["UserLat"],
        userLong: json["UserLong"],
        startLat: json["start_Lat"]?.toDouble(),
        startLong: json["start_Long"]?.toDouble(),
        endLat: json["end_Lat"]?.toDouble(),
        endLong: json["end_Long"]?.toDouble(),
        driverUserDistance: json["DriverUserDistance"],
        expectedTime: json["ExpectedTime"],
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
        pickupLocation: json["PickupLocation"],
        dropLocation: json["DropLocation"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverId": driverId,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "DriverImage": driverImage,
        "DlNumber": dlNumber,
        "TotalPrice": totalPrice,
        "PaidAmount": paidAmount,
        "RemainingAmount": remainingAmount,
        "VehicleNumber": vehicleNumber,
        "VehicleTypeName": vehicleTypeName,
        "TotalDistance": totalDistance,
        "Lat_Driver": latDriver,
        "Lang_Driver": langDriver,
        "UserLat": userLat,
        "UserLong": userLong,
        "start_Lat": startLat,
        "start_Long": startLong,
        "end_Lat": endLat,
        "end_Long": endLong,
        "DriverUserDistance": driverUserDistance,
        "ExpectedTime": expectedTime,
        "PaymentDate": paymentDate?.toIso8601String(),
        "PickupLocation": pickupLocation,
        "DropLocation": dropLocation,
      };
}
