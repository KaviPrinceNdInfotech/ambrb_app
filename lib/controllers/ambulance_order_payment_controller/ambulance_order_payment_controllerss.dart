import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_navbar.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AmbulanceOrderpaymentController extends GetxController {
  RxBool isLoading = true.obs;
  GlobalKey<FormState> postorderambulanceforms =
      GlobalKey(debugLabel: "postorderambulanceforms");
  NavController _navcontroller = Get.put(NavController(), permanent: true);

  var Id = '';

  ///online ambulance......
  Future<int> postOrderAmbulanceonlineApi() async {
    //isLoading(true);
    CallLoader.loader();
    //print(ProductName.text);
    http.Response r = await ApiProvider.AmbulancepaynowOnlineApi();
    if (r.statusCode == 200) {
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
      //Get.to(()=> LoginPage());
      _navcontroller.tabindex(0);

      Get.to(BottommNavBar());
      CallLoader.hideLoader();
      isLoading(false);
      // Get.to(() => NavBar());
      //_timeController.email = Email.text;
      //_timeController.phoneNumber = OrderNo.text;
    } else {
      _navcontroller.tabindex(0);

      Get.to(BottommNavBar());
      CallLoader.hideLoader();
    }
    return r.statusCode;
  }

  ///offline doctor.....
  // Future<int> postOrderDoctorofflineApi() async {
  //   //isLoading(true);
  //   CallLoader.loader();
  //   //print(ProductName.text);
  //   http.Response r = await ApiProvider.DoctorpaynowOfflineApi();
  //   if (r.statusCode == 200) {
  //     //Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
  //     //Get.to(()=> LoginPage());
  //     CallLoader.hideLoader();
  //     isLoading(false);
  //     // Get.to(() => NavBar());
  //     //_timeController.email = Email.text;
  //     //_timeController.phoneNumber = OrderNo.text;
  //   }
  //   return r.statusCode;
  // }
  ///

  //from here add member and add patient both ccontroller function ..............

  // TextEditingController ProductName = TextEditingController();
  // TextEditingController Total_Item = TextEditingController();
  // TextEditingController Price = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    //ProductName.dispose();
    // Total_Item.dispose();
    //Price.dispose();
  }

  void checkPostnurseQuery() {
    if (postorderambulanceforms.currentState!.validate()) {
      postOrderAmbulanceonlineApi();
    }
    postorderambulanceforms.currentState!.save();
  }
}
