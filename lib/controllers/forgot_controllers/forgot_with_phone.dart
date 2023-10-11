// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:roshini/modules/forgot_section/rorgot_with_pin.dart';
//
// class ForgotWithPhoneController extends GetxController {
//   final GlobalKey<FormState> forgotphoneformkey = GlobalKey<FormState>();
//
//   late TextEditingController mobileeController;
//
//   var mobile = '';
//
//   @override
//   void onInit() {
//     super.onInit();
//     mobileeController = TextEditingController();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     mobileeController.dispose();
//   }
//
//   String? validPhone(String value) {
//     if (value.length < 10) {
//       return "provide valid phone";
//     }
//     return null;
//   }
//
//   void checkMobile() {
//     final isValid = forgotphoneformkey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     forgotphoneformkey.currentState!.save();
//     Get.to(() => ForgotpasswordPinPage());
//   }
// }
