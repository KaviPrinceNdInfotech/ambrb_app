import 'package:ambrd_appss/controllers/home_controllers/home_controllers.dart';
import 'package:ambrd_appss/controllers/login_mobile_controller/login_mobile_controllers.dart';
import 'package:ambrd_appss/controllers/vehicle_service_catagary_list_controller/vehicle_cat_list_controller.dart';
import 'package:ambrd_appss/model/account_model_login_autologin/account_login_account_model.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_navbar.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpVerifyController extends GetxController {
  RxBool isLoading = true.obs;

  GlobalKey<FormState> mobileform = GlobalKey();

  ///todo: this is the login apis....controller...
  LoginMobileController _loginMobileController =
      Get.put(LoginMobileController());

  VehicleServicecatController _vehicleservicecatController =
      Get.put(VehicleServicecatController());
  NavController _navController = Get.put(NavController());
  HomeController _homePageController = Get.put(HomeController());

  ///todo: this is the nav controller....controller...
  //NavController _navController = Get.put(NavController());

  //LoginMobileController loginMobileController = Get.find();

  ///this is the api call....

  Future<void> callOtpApi(String otp) async {
    http.Response r = await ApiProvider.verifyOTP(
        _loginMobileController.MobileOrEmail.text, otp);
    if (r.statusCode == 200) {
      print("ACCOUNT ${r.body}");
      final accountData = messageFromJson(r.body);
      print("ACCOUNT ${accountData.toJson()}");
      await accountService.setAccountData(accountData);
      //Get.to(() => DetailsProfile());
      ///api calling...
      await _homePageController.AllServicesApi();
      await _homePageController.sliderBannerApi();
      _homePageController.onInit();

      // _vehicleservicecatController.servicecatvehicleApi();
      // _vehicleservicecatController.onInit();
      //_vehicleservicecatController.update();
      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 1000));
      CallLoader.hideLoader();

      ///todo:..........................................................
      await Get.to(() => BottommNavBar());
      await _navController.tabindex(0);
    }
  }

  String? validateMobile(value) {
    if (value == '') {
      return 'please enter your otp';
    }
    return null;
  }

  checkMobile() async {
    var isValidate = mobileform.currentState!.validate();
    if (!isValidate) {
      return;
    } else {
      // callotpApi();
    }
    mobileform.currentState!.save();
  }
}
