// import 'package:get/get.dart';
// import 'package:ps_welness_new_ui/model/1_user_model/ambulance/ambulance_type_model.dart';
// import 'package:ps_welness_new_ui/model/1_user_model/lab_details/lab_details_api.dart';
//
// import '../../../model/1_user_model/lab_list_models.dart';
// import '../../../servicess_api/api_services_all_api.dart';
// //import 'package:ps_welness/model/1_user_model/lab_list_models.dart';
// //import 'package:ps_welness/servicess_api/api_services_all_api.dart';
//
// class GetAmbulanceController extends GetxController {
//   RxBool isLoading = true.obs;
//
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     getambulanceApi();
//   }
//
//   @override
//   void onClose() {
//     ambulancetype = null;
//     super.onClose();
//   }
//
//   @override
//   void dispose() {
//     ambulancetype = null;
//     super.dispose();
//   }
//
//
//
// }
//
// ///todo from here checkout model value..............
import 'dart:async';
import 'dart:convert';

import 'package:ambrd_appss/modules/driver_list/driver_offer_listss.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OfferuserController extends GetxController {
  final GlobalKey<FormState> Chooseambulancevehicleofferkey =
      GlobalKey<FormState>();
  RxBool isLoading = true.obs;

  void offerPostApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.OfferBypatientApi(
      offercontroller2.text,
    );
    print("ACCOUNT ${r.body}");
    if (r.statusCode == 200) {
      print("ACCOUNT ${r.body}");
      var data = jsonDecode(r.body);
      //nearlistdriverApi();

      CallLoader.hideLoader();

      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(seconds: 2),
          () {
            Get.to(
              DriverOfferListById(),
            );
          },
        );
        //CallLoader.hideLoader();
      });
    }
  }

  late TextEditingController offercontroller2;
  var offer2 = '';

  ///todo:user complain...........

  @override
  void onInit() {
    // nearlistdriverApi();
    super.onInit();
    offercontroller2 = TextEditingController();

    // selectedambCatagary.listen((p0) {
    //   if (p0 != null) {
    //     getvehicletype("${p0.id}");
    //   }
    // });

    // getTestNameeApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // clinicnameController.dispose();
    // mobileController.dispose();
  }

  String? validClinicname(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  void checkofferuser() {
    if (Chooseambulancevehicleofferkey.currentState!.validate()) {
      offerPostApi();
    }
    Chooseambulancevehicleofferkey.currentState!.save();
  }
}
