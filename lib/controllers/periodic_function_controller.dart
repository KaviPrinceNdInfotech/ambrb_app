import 'dart:async';

import 'package:ambrd_appss/model/track_driver_model.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:get/get.dart';

Timer? timer;

class PeriodicFunctionController extends GetxController {
  RxBool isLoading = false.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  // DriveracceptModeluser? getDriveracceptDetail;

  DriverTrackModel? driverTrackModel;

  ///PriodicFunctionModel? getDriveracceptDetail2;

  Future<void> TrackDriverssApi() async {
    isLoading(false);

    driverTrackModel = await ApiProvider.TrackDriverApi();
    if (driverTrackModel?.driverName == null) {
      print("ambucedrivesaxasr:${driverTrackModel?.driverName}");

      isLoading(false);
      driverTrackModel = await ApiProvider.TrackDriverApi();
    }
    if (driverTrackModel?.driverName != null) {
      print("ambucedrivscser:${driverTrackModel?.driverName}");

      //Get.to(() => TotalPrice());
      isLoading(false);
      // accountService.getAccountData.then((accountData) {
      //   Timer(
      //     const Duration(seconds: 1),
      //     () {
      //       Get.to(CheckOutMedicine());
      //       //Get.to((page))
      //       ///
      //     },
      //   );
      // });
    }
  }

  ///todo: testing periodic function....
  Future<void> driveracceptuserDetailApi2() async {
    isLoading(true);
    driverTrackModel = await ApiProvider.TrackDriverApi();
    if (driverTrackModel?.driverName == null) {
      print("ambucedrivesaxasr:${driverTrackModel?.driverName}");

      Timer(
        const Duration(seconds: 1),
        () {
          //Get.snackbar("Fail", "${medicinecheckoutModel?.data}");
          //Get.to(() => MedicineCart());
          //Get.to((page))
          ///
        },
      );
      isLoading(false);
      driverTrackModel = await ApiProvider.TrackDriverApi();
    }
    if (driverTrackModel?.driverName != null) {
      print("ambucedrivscser:${driverTrackModel?.driverName}");

      //Get.to(() => TotalPrice());
      isLoading(false);
      // accountService.getAccountData.then((accountData) {
      //   Timer(
      //     const Duration(seconds: 1),
      //     () {
      //       Get.to(CheckOutMedicine());
      //       //Get.to((page))
      //       ///
      //     },
      //   );
      // });
    }
  }

  @override
  void onInit() {
    ///driveracceptuserDetailApi();
    super.onInit();
    driveracceptuserDetailApi2();
    TrackDriverssApi();
    // timer = Timer.periodic(
    //   Duration(seconds: 30),
    //   (Timer t) => driveracceptuserDetailApi2(),
    // );

    Timer.periodic(
      Duration(seconds: 20),
      (Timer t) => TrackDriverssApi(),
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
