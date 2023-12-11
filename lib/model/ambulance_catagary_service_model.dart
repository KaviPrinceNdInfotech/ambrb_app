// To parse this JSON data, do
//
//     final ambulanceCatServiceModel = ambulanceCatServiceModelFromJson(jsonString);

import 'dart:convert';

AmbulanceCatServiceModel ambulanceCatServiceModelFromJson(String str) =>
    AmbulanceCatServiceModel.fromJson(json.decode(str));

String ambulanceCatServiceModelToJson(AmbulanceCatServiceModel data) =>
    json.encode(data.toJson());

class AmbulanceCatServiceModel {
  List<VehicleCat>? vehicles;

  AmbulanceCatServiceModel({
    this.vehicles,
  });

  factory AmbulanceCatServiceModel.fromJson(Map<String, dynamic> json) =>
      AmbulanceCatServiceModel(
        vehicles: json["Vehicles"] == null
            ? []
            : List<VehicleCat>.from(
                json["Vehicles"]!.map((x) => VehicleCat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Vehicles": vehicles == null
            ? []
            : List<dynamic>.from(vehicles!.map((x) => x.toJson())),
      };
}

class VehicleCat {
  int? id;
  String? vehicleImage;
  String? vehicleTypeName;

  VehicleCat({
    this.id,
    this.vehicleImage,
    this.vehicleTypeName,
  });

  factory VehicleCat.fromJson(Map<String, dynamic> json) => VehicleCat(
        id: json["Id"],
        vehicleImage: json["VehicleImage"],
        vehicleTypeName: json["VehicleTypeName"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "VehicleImage": vehicleImage,
        "VehicleTypeName": vehicleTypeName,
      };
}
