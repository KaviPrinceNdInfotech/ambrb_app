// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:roshini/modules/login_password/login_passwords_page.dart';
// import 'package:roshini/modules/login_view/login_page.dart';
//
// class pinpasswordController extends GetxController {
//   final GlobalKey<FormState> pinformkey = GlobalKey<FormState>();
//
//   late TextEditingController passwordController;
//
//   var password = '';
//
//   @override
//   void onInit() {
//     super.onInit();
//     passwordController = TextEditingController();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     passwordController.dispose();
//   }
//
//   String? validPhone(String value) {
//     if (value.length < 10) {
//       return "provide valid phone";
//     }
//     return null;
//   }
//
//   String? validPassword(String value) {
//     if (value.length < 5) {
//       return "Must be minimum  5 character";
//     }
//     return null;
//   }
//
//   void checkLoginpasswordd() {
//     final isValid = pinformkey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     pinformkey.currentState!.save();
//     Get.to(() => LoginPasswordPage()//LoginScreen()
//     );
//   }
// }
