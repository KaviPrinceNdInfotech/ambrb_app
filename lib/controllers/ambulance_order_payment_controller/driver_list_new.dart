import 'dart:async';

import 'package:ambrd_appss/model/driver_acceptlist_model/driver_acceptlist_model.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:get/get.dart';

class DriverAcceptlistController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  DriveracceptModeluser? getDriveracceptDetail;

  Future<void> driveracceptuserDetailApi() async {
    isLoading(true);

    getDriveracceptDetail = await ApiProvider.AcceptDriverDetailUserApi();
    if (getDriveracceptDetail?.driverName == null) {
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
      getDriveracceptDetail = await ApiProvider.AcceptDriverDetailUserApi();
    }
    if (getDriveracceptDetail?.driverName != null) {
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
    driveracceptuserDetailApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
