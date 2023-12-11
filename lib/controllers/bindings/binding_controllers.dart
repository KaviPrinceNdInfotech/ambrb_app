import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../add_services_controllerss/add_service_controller.dart';
import '../add_tecnician_controller/add_technicians_controller.dart';
import '../home_controllers/home_controllers.dart';
import '../login_password_controller/login_password_controller.dart';
import '../register_complaint_controller/register_complain_controller.dart';
import '../signup_controller/signup_controler.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    //Get.lazyPut(() => HomeController());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    // );
    // Get.lazyPut<OtpTimerphoneController>(
    //   () => OtpTimerphoneController(),
    // );

    //Get.lazyPut(() => SplashController());
    //Get.lazyPut(() => OtpTimerphoneController());
    Get.lazyPut(() => SignUpController());
    //Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => RegisterComplainController());
    Get.lazyPut(() => AddtechnicianController());
    Get.lazyPut(() => LoginpasswordController());
    // Get.lazyPut(() => ForgotWithPhoneController());
    // Get.lazyPut(() => pinpasswordController());
    Get.lazyPut(() => AddserviceController());

    Get.put(SignUpController());
    // Get.put(DashboardController());
    Get.put(RegisterComplainController());
    Get.put(AddtechnicianController());
    Get.put(LoginpasswordController());
    // Get.put(ForgotWithPhoneController());
    // Get.put(pinpasswordController());
    Get.put(AddserviceController());
  }
}
