// To parse this JSON data, do
//
//     final serviceDetailModel = serviceDetailModelFromJson(jsonString);

import 'dart:convert';

ServiceDetailModel serviceDetailModelFromJson(String str) =>
    ServiceDetailModel.fromJson(json.decode(str));

String serviceDetailModelToJson(ServiceDetailModel data) =>
    json.encode(data.toJson());

class ServiceDetailModel {
  int? id;
  String? serviceName;
  String? image;
  String? description;

  ServiceDetailModel({
    this.id,
    this.serviceName,
    this.image,
    this.description,
  });

  factory ServiceDetailModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailModel(
        id: json["Id"],
        serviceName: json["ServiceName"],
        image: json["Image"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ServiceName": serviceName,
        "Image": image,
        "Description": description,
      };
}
