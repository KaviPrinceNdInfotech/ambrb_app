import 'dart:async';

import 'package:ambrd_appss/controllers/edit_bank_controller/edit_bank_detail_controller.dart';
import 'package:ambrd_appss/controllers/get_profile_detail_controller/get_profile_details_controller.dart';
import 'package:ambrd_appss/controllers/home_controllers/home_controllers.dart';
import 'package:ambrd_appss/controllers/vehicle_service_catagary_list_controller/vehicle_cat_list_controller.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_navbar.dart';
import 'package:ambrd_appss/modules/login_view/login_page.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // Animation<double>? animation;
  VehicleServicecatController _vehicleservicecatController =
      Get.put(VehicleServicecatController());
  GetProfileController _getProfileController = Get.put(GetProfileController());
  // await _getProfileController.getProfileApi();
  NavController _navController = Get.put(NavController());
  HomeController _homePageController = Get.put(HomeController());

  EditbankdetailController _editbankdetailController =
      Get.put(EditbankdetailController());

//my
  final getStorage = GetStorage();
  @override
  void onInit() {
    // animationInitilization();
    super.onInit();

    accountService.getAccountData.then((accountData) {
      Timer(
        const Duration(seconds: 2),
        () async {
          if (accountData == null) {
            _editbankdetailController.getBankProfileApi();
            _getProfileController.getProfileApi();

            await _homePageController.AllServicesApi();
            await _homePageController.sliderBannerApi();
            _homePageController.onInit();

            _vehicleservicecatController.servicecatvehicleApi();
            _vehicleservicecatController.onInit();
            _vehicleservicecatController.update();

            await Future.delayed(Duration(milliseconds: 1000));

            await Get.to(LoginScreen());

            ///todo: 2 sep....2023..
            throw Exception();
          } else {
            // SharedPreferences
            // prefs =
            // await SharedPreferences
            //     .getInstance();
            // prefs.setString(
            //     "AmbulancelistssId",
            //     "${_userHomepagContreoller.ambulancetype!.ambulanceT![index].id.toString()}");
            // _ambulancegetController
            //     .update();

            accountService.getAccountData.then((accountData) {
              //CallLoader.loader();
              Timer(
                const Duration(seconds: 3),
                () {
                  // Get.to(
                  //  MapView());
                  // CallLoader
                  //     .hideLoader();
                  //_ambulancegetController.selectedvhicleCatagary();
                  //_ambulancegetController.ambulancecatagaryyApi();
                  //Get.to((MapView));

                  ///
                },
              );
              //CallLoader.hideLoader();
            });
            _editbankdetailController.getBankProfileApi();
            _getProfileController.getProfileApi();
            await _homePageController.AllServicesApi();
            await _homePageController.sliderBannerApi();
            // _homePageController.onInit();
            _vehicleservicecatController.servicecatvehicleApi();
            _vehicleservicecatController.onInit();
            _vehicleservicecatController.update();
            // CallLoader.loader();
            await Future.delayed(Duration(milliseconds: 1000));
            CallLoader.hideLoader();
            await _navController.tabindex(0);

            await Get.to(BottommNavBar());

            // switch (accountData.role) {
            //   case 'patient':
            //     _userprofile.userprofileApi();
            //     _userprofile.update();
            //     _devicetokenController.UsertokenApi();
            //
            //     /// we can navigate to user page.....................................
            //     Get.to(UserHomePage());
            //
            // }

          }
        },
      );
    });

    ///todo: from here we have auto login function...code..
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Get.to(
    //     LoginScreen(),
    //     // WelcomeScreen(),
    //   ),
    // );
    //Get.to(() => WelcomeScreen());
  }

  @override
  void onReady() {
    super.onReady();
    // if (getStorage.read("id") != null) {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.LOGIN);
    //   });
    // }

    ///
    // if (getStorage.read("id") != null) {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.HOME);
    //   });
    // }
    ///
    // else {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.LOGIN);
    //   });
    // }
  }

  // animationInitilization() {
  //   animationController =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 3));
  //   animation =
  //       CurvedAnimation(parent: animationController, curve: Curves.easeOut)
  //           .obs
  //           .value;
  //   animation.addListener(() => update());
  //   animationController.forward();
  //   //Get.to(() => WelcomeScreen());
  // }

  //Get.to(() => WelcomeScreen());

}

// abstract class Routes {
//   Routes._();
//   static const SPLASH = _Paths.SPLASH;
//   static const HOME = _Paths.HOME;
//
//   static const LOGIN = _Paths.LOGIN;
// }
///
// abstract class _Paths {
//   _Paths._();
//   static const SPLASH = '/splash';
//   static const HOME = '/home';
//
//   static const LOGIN = '/login';
// }
