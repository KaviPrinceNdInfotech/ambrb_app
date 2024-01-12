// To parse this JSON data, do
//
//     final driverPaymentsHistoryModel = driverPaymentsHistoryModelFromJson(jsonString);

import 'dart:convert';

DriverPaymentsHistoryModel driverPaymentsHistoryModelFromJson(String str) =>
    DriverPaymentsHistoryModel.fromJson(json.decode(str));

String driverPaymentsHistoryModelToJson(DriverPaymentsHistoryModel data) =>
    json.encode(data.toJson());

class DriverPaymentsHistoryModel {
  List<PaymentHistory>? paymentHistory;

  DriverPaymentsHistoryModel({
    this.paymentHistory,
  });

  factory DriverPaymentsHistoryModel.fromJson(Map<String, dynamic> json) =>
      DriverPaymentsHistoryModel(
        paymentHistory: json["PaymentHistory"] == null
            ? []
            : List<PaymentHistory>.from(
                json["PaymentHistory"]!.map((x) => PaymentHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PaymentHistory": paymentHistory == null
            ? []
            : List<dynamic>.from(paymentHistory!.map((x) => x.toJson())),
      };
}

class PaymentHistory {
  int? id;
  String? driverName;
  String? mobileNumber;
  double? startLat;
  double? startLong;
  double? endLat;
  double? endLong;
  DateTime? paymentDate;
  String? pickupLocation;
  String? dropLocation;
  String? location;
  num? amount;

  PaymentHistory({
    this.id,
    this.driverName,
    this.mobileNumber,
    this.startLat,
    this.startLong,
    this.endLat,
    this.endLong,
    this.paymentDate,
    this.pickupLocation,
    this.dropLocation,
    this.location,
    this.amount,
  });

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
        id: json["Id"],
        driverName: json["DriverName"],
        mobileNumber: json["MobileNumber"],
        startLat: json["start_Lat"]?.toDouble(),
        startLong: json["start_Long"]?.toDouble(),
        endLat: json["end_Lat"]?.toDouble(),
        endLong: json["end_Long"]?.toDouble(),
        paymentDate: json["PaymentDate"] == null
            ? null
            : DateTime.parse(json["PaymentDate"]),
        pickupLocation: json["PickupLocation"],
        dropLocation: json["DropLocation"],
        location: json["Location"],
        amount: json["Amount"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "DriverName": driverName,
        "MobileNumber": mobileNumber,
        "start_Lat": startLat,
        "start_Long": startLong,
        "end_Lat": endLat,
        "end_Long": endLong,
        "PaymentDate": paymentDate?.toIso8601String(),
        "PickupLocation": pickupLocation,
        "DropLocation": dropLocation,
        "Location": location,
        "Amount": amount,
      };
}
