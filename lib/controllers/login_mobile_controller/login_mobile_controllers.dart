import 'package:ambrd_appss/controllers/home_controllers/home_controllers.dart';
import 'package:ambrd_appss/model/account_model_login_autologin/account_login_account_model.dart';
import 'package:ambrd_appss/modules/otp_new_correct/otp_correct_codee.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class LoginMobileController extends GetxController {
  final getStorage = GetStorage();
  RxBool isLoading = false.obs;
  HomeController _homePageController = Get.put(HomeController());

  final GlobalKey<FormState> MobileLoginFormKey =
      GlobalKey(debugLabel: "MobileLoginFormKey");
  TextEditingController MobileOrEmail = TextEditingController();

  //OtpTimerController _timeController = Get.put(OtpTimerController());

  void phoneemailApi() async {
    CallLoader.loader();
    final http.Response r = await ApiProvider.PhoneLoginApi(
      "${MobileOrEmail.text}",
    );

    if (r.statusCode == 200) {
      // CallLoader.hideLoader();
      // _homePageController.AllServicesApi();
      //_homePageController.sliderBannerApi();
      //_homePageController.onInit();
      // _homePageController.update();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 500));
      CallLoader.hideLoader();
      await Get.to(() => OtpVerification());
      print("ACCOUNT ${r.body}");
      final accountData = messageFromJson(r.body);
      print("ACCOUNT ${accountData.toJson()}");
      await accountService.setAccountData(accountData);
      // Get.to(() => OtpVerification());
      ///todo: change on 4 dec 2023...Get.to(() => OTPPhone());

    }
  }

  @override
  void onInit() {
    super.onInit();
    MobileOrEmail;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //MobileOrEmail.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  String? validatePhone(String value) {
    if (value.length < 1) {
      return "provide valid Id";
    }
    return null;
  }

  void checkMobileLogin() {
    if (MobileLoginFormKey.currentState!.validate()) {
      phoneemailApi();
    }
    MobileLoginFormKey.currentState!.save();
  }

  // login() {
  //   getStorage.write("id", 1);
  //   getStorage.write("name", " Prince Kumar");
  //   Get.offAllNamed(Routes.HOME);
  // }
}
