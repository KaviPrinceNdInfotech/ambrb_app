// To parse this JSON data, do
//
//     final complainList = complainListFromJson(jsonString);

import 'dart:convert';

//////////////////complaintList Open
ComplaintListOpenModel complaintListOpenModelFromJson(String str) => ComplaintListOpenModel.fromJson(json.decode(str));
String complaintListOpenModelToJson(ComplaintListOpenModel data) => json.encode(data.toJson());

class ComplaintListOpenModel {
  ComplaintListOpenModel({
    this.status,
    this.message,
    this.openresult,
  });

  int? status;
  String? message;
  List<OpenResult>? openresult;

  factory ComplaintListOpenModel.fromJson(Map<String, dynamic> json) => ComplaintListOpenModel(
    status: json["status"],
    message: json["message"],
    openresult: List<OpenResult>.from(json["result"].map((x) => OpenResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(openresult!.map((x) => x.toJson())),
  };
}
class OpenResult {
  OpenResult({
    this.id,
    this.company,
    this.name,
    this.mobile,
    this.services,
    this.address,
    this.typeOfService,
    this.status,
  });
  int? id;
  dynamic company;
  String? name;
  String? mobile;
  String? services;
  String? address;
  String? typeOfService;
  String? status;

  factory OpenResult.fromJson(Map<String, dynamic> json) => OpenResult(
    id: json["id"],
    company: json["company"],
    name: json["name"],
    mobile: json["mobile"],
    services: json["services"],
    address: json["address"],
    typeOfService: json["typeOfService"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "name": name,
    "mobile": mobile,
    "services": services,
    "address": address,
    "typeOfService": typeOfService,
    "status": status,
  };
}

/////////////////complaintList  Close
ComplaintListCloseModel complaintListCloseModelFromJson(String str) => ComplaintListCloseModel.fromJson(json.decode(str));
String complaintListCloseModelToJson(ComplaintListCloseModel data) => json.encode(data.toJson());

class ComplaintListCloseModel {
  ComplaintListCloseModel({
    this.status,
    this.message,
    this.closeresult,
  });

  int? status;
  String? message;
  List<CloseResult>? closeresult;

  factory ComplaintListCloseModel.fromJson(Map<String, dynamic> json) => ComplaintListCloseModel(
    status: json["status"],
    message: json["message"],
    closeresult: List<CloseResult>.from(json["result"].map((x) => CloseResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(closeresult!.map((x) => x.toJson())),
  };
}
class CloseResult {
  CloseResult({
    this.id,
    this.company,
    this.name,
    this.mobile,
    this.services,
    this.address,
    this.typeOfService,
    this.status,
  });

  int? id;
  dynamic company;
  String? name;
  String? mobile;
  String? services;
  String? address;
  String? typeOfService;
  String? status;

  factory CloseResult.fromJson(Map<String, dynamic> json) => CloseResult(
    id: json["id"],
    company: json["company"],
    name: json["name"],
    mobile: json["mobile"],
    services: json["services"],
    address: json["address"],
    typeOfService: json["typeOfService"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "name": name,
    "mobile": mobile,
    "services": services,
    "address": address,
    "typeOfService": typeOfService,
    "status": status,
  };
}
////////////////////////////////////////////////Pending
ComplaintListPendingModel complaintListPendingFromJson(String str) => ComplaintListPendingModel.fromJson(json.decode(str));
String complainListPendingToJson(ComplaintListPendingModel data) => json.encode(data.toJson());

class ComplaintListPendingModel {
  ComplaintListPendingModel({
    this.status,
    this.message,
    this.pendingresult,
  });

  int? status;
  String? message;
  List<PendingResult>? pendingresult;

  factory ComplaintListPendingModel.fromJson(Map<String, dynamic> json) => ComplaintListPendingModel(
    status: json["status"],
    message: json["message"],
    pendingresult: List<PendingResult>.from(json["result"].map((x) => PendingResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": List<dynamic>.from(pendingresult!.map((x) => x.toJson())),
  };
}
class PendingResult {
  PendingResult({
    this.id,
    this.company,
    this.name,
    this.mobile,
    this.services,
    this.address,
    this.typeOfService,
    this.status,
  });

  int? id;
  dynamic company;
  String? name;
  String? mobile;
  String? services;
  String? address;
  String? typeOfService;
  String? status;

  factory PendingResult.fromJson(Map<String, dynamic> json) => PendingResult(
    id: json["id"],
    company: json["company"],
    name: json["name"],
    mobile: json["mobile"],
    services: json["services"] == null ? null : json["services"],
    address: json["address"],
    typeOfService: json["typeOfService"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "name": name,
    "mobile": mobile,
    "services": services == null ? null : services,
    "address": address,
    "typeOfService": typeOfService,
    "status": status,
  };
}
