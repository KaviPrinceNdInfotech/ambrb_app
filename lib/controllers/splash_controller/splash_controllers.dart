import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // late AnimationController animationController;
  // Animation<double>? animation;
//my
  final getStorage = GetStorage();
  @override
  void onInit() {
    // animationInitilization();
    super.onInit();
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
    if (getStorage.read("id") != null) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
    // if (getStorage.read("id") != null) {
    //   Future.delayed(const Duration(milliseconds: 3000), () {
    //     Get.offAllNamed(Routes.HOME);
    //   });
    // }
    else {
      Future.delayed(const Duration(milliseconds: 3000), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
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

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;

  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';

  static const LOGIN = '/login';
}
