// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../modules/home_page/home_page.dart';
// import '../../services/api_provider.dart';
// import '../login_mobile_controller/login_mobile_controllers.dart';
//
// class OtpVerifyController extends GetxController {
//   RxBool isLoading = true.obs;
//
//   GlobalKey<FormState> mobileform = GlobalKey();
//
//   LoginMobileController loginMobileController = Get.put(LoginMobileController());
//
//   void callOtpApi(String Otp) async {
//     http.Response r = await ApiProvider.verifyOTP(
//         loginMobileController.MobileOrEmail.text, Otp);
//     print("RRRRRRrrrrrr: ${r}");
//     if (r.statusCode == 200) {
//       print("##############Successfully");
//       Get.to(() => HomePage());
//     } else {
//       Get.to(() => HomePage());
//     }
//   }
//
//   String? validateMobile(value) {
//     if (value == '') {
//       return 'please enter your otp';
//     }
//     return null;
//   }
//
//   checkMobile() async {
//     var isValidate = mobileform.currentState!.validate();
//     if (!isValidate) {
//       return;
//     } else {
//       //callOtpApi;
//     }
//     mobileform.currentState!.save();
//   }
// }
