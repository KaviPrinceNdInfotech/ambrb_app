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

import 'package:ambrd_appss/controllers/booking_vehicle_controller_common/vehicle_controller_new_comman.dart';
import 'package:ambrd_appss/controllers/booking_vehicle_controller_common/vehicle_detail_common_controller.dart';
import 'package:ambrd_appss/model/driver_list_by_post_book_ambulance_api_model/driver_list_by_post_model.dart';
import 'package:ambrd_appss/modules/driver_lists/driver_listss.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart';
import 'package:http/http.dart' as http;

class AmbulancegetsController extends GetxController {
  final GlobalKey<FormState> Chooseambulancevehicletypekey =
      GlobalKey<FormState>();
  RxBool isLoading = true.obs;

  ///todo:list of driver...
  // DriverListApi? driverlist;

  DriverListByPostModel? driverlist;

  ///ambulancde catagary Id...........

  Rx<Vehicle?> selectedambCatagary = (null as Vehicle?).obs;
  List<Vehicle> ambulancvecatagarys = <Vehicle>[].obs;

  ///vehicle by catagary Id...........
  ///
  Rx<VehicleDetaile?> selectedvhicleCatagary = (null as VehicleDetaile?).obs;
  RxList<VehicleDetaile> vhicletypes = <VehicleDetaile>[].obs;

  ///ambulancde catagary Id...........

  void ambulancecatagaryyApi() async {
    ambulancvecatagarys = (await ApiProvider.getambulancecatagaryApi())!;
    print('Prince ambulance catagary list');
    print(ambulancvecatagarys);
  }

  ///get vehicle api...........
  void getvehicletype(String ambulancecatagaryID) async {
    vhicletypes.clear();
    final localList = await ApiProvider.getvechilebyidApi(ambulancecatagaryID);
    vhicletypes.addAll(localList!);
    print("Prince cities of $ambulancecatagaryID");
    print(vhicletypes);
  }

  ///......
  //DriverListApi? driverlist;

  // void nearlistdriverApi() async {
  //   isLoading(true);
  //   driverlist = await ApiProvider.DrivernearListApi();
  //   if (driverlist?.message != null) {
  //     isLoading(false);
  //
  //     ///  print(body),
  //     // foundneardriver.value = driverlist!.message!;
  //   }
  // }

  ///todo: google book ambulance api post Api...........2 may 2023.....

  void postAmbulancerequestApi(Set<Marker> markers) async {
    final startLat = markers.first.position.latitude;
    final startLong = markers.first.position.longitude;

    final endLat = markers.last.position.latitude;
    final endLong = markers.last.position.longitude;
    //CallLoader.loader();
    http.Response r = await ApiProvider.GooglebookambulanceApi(
      startLat.toDouble(),
      startLong.toDouble(),
      endLat.toDouble(),
      endLong.toDouble(),
      noofpassengercontroller.text,
      offercontroller.text,
    );
    if (r.statusCode == 200) {
      print("ACCOUNT ${r.body}");
      //final accountData = driverListApiFromJson(r.body);
      //print("ACCOUNT ${accountData.toJson()}");
      //await accountService.setAccountData(accountData);
      Get.snackbar('List', "This is driver's nearby list ");
      var data = jsonDecode(r.body);
      //nearlistdriverApi();

      CallLoader.hideLoader();

      /// we can navigate to user page.....................................
      //Get.offAll(UserHomePage());
      //Driver_List_LocationId
      //_nearambulancelistController.nearlistdriverApi();
      //_nearambulancelistController.update();

      accountService.getAccountData.then((accountData) {
        // CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(seconds: 2),
          () {
            //DriverListById
            // nearlistdriverApi();
            ///Get.to(DriverListById()
            // DriverListById(
            //   driverlist: driverListApiFromJson(r.body),
            // ),
            //);

            Get.to(
              DriverListById(
                driverlist: driverListByPostModelFromJson(r.body),
              ),
            );
            //Get.to((MapView));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        //CallLoader.hideLoader();
      });

      //Get.to(Driver_List_LocationId());

      //Get.offAll(() => UserHomePage());
      // ambulancecatagaryyApi();
      //getvehicletype(markers);
    }
  }

  ///todo: google book ambulance api post Api...........2 may 2023.....

  void postAmbulancerequestApi2() async {
    //CallLoader.loader();
    http.Response r = await ApiProvider.Googlebookambulance2Api();
    if (r.statusCode == 200) {
      print("ACCOUNT ${r.body}");
      Get.snackbar('Successfully', "Request send");

      /// we can navigate to user page.....................................
      //Get.offAll(UserHomePage());
      //Driver_List_LocationId
      //_nearambulancelistController.nearlistdriverApi();
      //_nearambulancelistController.update();

      accountService.getAccountData.then((accountData) {
        //CallLoader.loader();
        // nearlistdriverApi();

        Timer(
          const Duration(seconds: 05),
          () {
            ///Get.to(UserHomePage());
            // nearlistdriverApi();
            // Get.to(
            //   Driver_List_LocationId(
            //     driverlist: driverListApiFromJson(r.body),
            //   ),
            // );
            //Get.to((MapView));
            //postAmbulancerequestApi(markers);

            ///
          },
        );
        CallLoader.hideLoader();
      });

      //Get.to(Driver_List_LocationId());

      //Get.offAll(() => UserHomePage());
      // ambulancecatagaryyApi();
      //getvehicletype(markers);
    }
  }

  ///todo: google book ambulance api post Api...........2 may 2023.....

  // void postAmbulancerequestApi2() async {
  //   //CallLoader.loader();
  //   http.Response r = await ApiProvider.Googlebookambulance2Api();
  //   if (r.statusCode == 200) {
  //     print("ACCOUNT ${r.body}");
  //     Get.snackbar('Successfully', "Request send");
  //
  //     /// we can navigate to user page.....................................
  //     //Get.offAll(UserHomePage());
  //     //Driver_List_LocationId
  //     //_nearambulancelistController.nearlistdriverApi();
  //     //_nearambulancelistController.update();
  //
  //     accountService.getAccountData.then((accountData) {
  //       //CallLoader.loader();
  //       // nearlistdriverApi();
  //
  //       Timer(
  //         const Duration(seconds: 05),
  //         () {
  //           ///Get.to(UserHomePage());
  //           // nearlistdriverApi();
  //           // Get.to(
  //           //   Driver_List_LocationId(
  //           //     driverlist: driverListApiFromJson(r.body),
  //           //   ),
  //           // );
  //           //Get.to((MapView));
  //           //postAmbulancerequestApi(markers);
  //
  //           ///
  //         },
  //       );
  //       CallLoader.hideLoader();
  //     });
  //
  //     //Get.to(Driver_List_LocationId());
  //
  //     //Get.offAll(() => UserHomePage());
  //     // ambulancecatagaryyApi();
  //     //getvehicletype(markers);
  //   }
  // }

  late TextEditingController latiudecontroller,
      longitudecontroller,
      patientidcontroller,
      noofpassengercontroller,
      offercontroller;

  var lat = '';
  var lang = '';
  var id = '';
  var noofpassenger = '';
  var offer = '';

  ///todo:user complain...........

  @override
  void onInit() {
    // nearlistdriverApi();
    super.onInit();

    //ambulancecatagaryyApi();
    latiudecontroller = TextEditingController();
    longitudecontroller = TextEditingController();
    noofpassengercontroller = TextEditingController();
    offercontroller = TextEditingController();

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
      return '              This field is required';
    }

    return null;
  }

  String? validPhone(String value) {
    if (value.isEmpty) {
      return '              This field is required';
    }
    if (value.length != 10) {
      return '              A valid phone number should be of 10 digits';
    }
    return null;
  }

  void googlerequestambulance(Set<Marker> markers) {
    postAmbulancerequestApi(markers);

    //nearlistdriverApi();

    //Get.to(Driver_List_LocationId());

    // if (Chooseambulancevehicletypekey.currentState!.validate()) {
    // }
    // Chooseambulancevehicletypekey.currentState!.save();
  }
}
