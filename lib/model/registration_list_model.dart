// To parse this JSON data, do
//
//     final registrationList = registrationListFromJson(jsonString);

import 'dart:convert';

RegistrationListModel registrationListFromJson(String str) => RegistrationListModel.fromJson(json.decode(str));

String registrationListToJson(RegistrationListModel data) => json.encode(data.toJson());

class RegistrationListModel {
  RegistrationListModel({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory RegistrationListModel.fromJson(Map<String, dynamic> json) => RegistrationListModel(
    status: json["status"],
    message: json["message"],
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.name,
    this.number,
    this.shopName,
    this.address,
    this.servicetype,
    this.password,
    this.aadharName,
    this.rgx,
    this.invoiceNo,
    this.image,
  });

  int? id;
  String? name;
  String? number;
  String? shopName;
  String? address;
  Servicetype? servicetype;
  String? password;
  String? aadharName;
  String? rgx;
  int? invoiceNo;
  String? image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    number: json["number"],
    shopName: json["shopName"],
    address: json["address"],
    servicetype: servicetypeValues.map[json["servicetype"]]!,
    password: json["password"],
    aadharName: json["aadharName"],
    rgx: json["rgx"],
    invoiceNo: json["invoiceNo"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "number": number,
    "shopName": shopName,
    "address": address,
    "servicetype": servicetypeValues.reverse[servicetype],
    "password": password,
    "aadharName": aadharName,
    "rgx": rgx,
    "invoiceNo": invoiceNo,
    "image": image,
  };
}

enum Servicetype { AMC, CUSTOMER, REPAIR, EMPTY, GG }

final servicetypeValues = EnumValues({
  "AMC": Servicetype.AMC,
  "Customer": Servicetype.CUSTOMER,
  "": Servicetype.EMPTY,
  "gg": Servicetype.GG,
  "Repair": Servicetype.REPAIR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
