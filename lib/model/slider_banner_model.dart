

import 'dart:convert';

SliderListModel sliderListModelFromJson(String str) => SliderListModel.fromJson(json.decode(str));

String sliderListModelToJson(SliderListModel data) => json.encode(data.toJson());

class SliderListModel {
  SliderListModel({
    this.status,
    this.message,
    this.result,
  });

  int? status;
  String? message;
  List<Result>? result;

  factory SliderListModel.fromJson(Map<String, dynamic> json) => SliderListModel(
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
    this.image,
    this.vendorId,
  });

  int? id;
  String? image;
  int? vendorId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    image: json["image"],
    vendorId: json["vendorId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "vendorId": vendorId,
  };
}




// import 'dart:convert';
//
// SliderListModel sliderListModelFromJson(String str) =>
//     SliderListModel.fromJson(json.decode(str));
//
// String sliderListModelToJson(SliderListModel data) =>
//     json.encode(data.toJson());
//
// class SliderListModel {
//   SliderListModel({
//     this.bannerImageList,
//     this.status,
//     this.message,
//   });
//
//   List<String>? bannerImageList;
//   int? status;
//   String? message;
//
//   factory SliderListModel.fromJson(Map<String, dynamic> json) =>
//       SliderListModel(
//         bannerImageList:
//         List<String>.from(json["BannerImageList"].map((x) => x)),
//         status: json["status"],
//         message: json["message"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "BannerImageList": List<dynamic>.from(bannerImageList!.map((x) => x)),
//     "status": status,
//     "message": message,
//   };
// }
