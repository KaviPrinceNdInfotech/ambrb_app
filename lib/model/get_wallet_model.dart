// To parse this JSON data, do
//
//     final walletAmountModel = walletAmountModelFromJson(jsonString);

import 'dart:convert';

WalletAmountModel walletAmountModelFromJson(String str) =>
    WalletAmountModel.fromJson(json.decode(str));

String walletAmountModelToJson(WalletAmountModel data) =>
    json.encode(data.toJson());

class WalletAmountModel {
  int? userId;
  num? walletAmount;

  WalletAmountModel({
    this.userId,
    this.walletAmount,
  });

  factory WalletAmountModel.fromJson(Map<String, dynamic> json) =>
      WalletAmountModel(
        userId: json["UserId"],
        walletAmount: json["walletAmount"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "walletAmount": walletAmount,
      };
}
