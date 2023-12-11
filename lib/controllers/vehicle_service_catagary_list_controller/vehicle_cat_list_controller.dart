import 'dart:async';

import 'package:ambrd_appss/model/ambulance_catagary_service_model.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class VehicleServicecatController extends GetxController {
  RxBool isLoading = true.obs;

  AmbulanceCatServiceModel? servicecatserviceModel;

  Future<void> servicecatvehicleApi() async {
    isLoading(true);
    servicecatserviceModel = await ApiProvider.servicecatagaryvehicleApi();
    if (servicecatserviceModel?.vehicles![0].id != null) {
      isLoading(false);

      //isLoading(true);
      //servicecatserviceModel = await ApiProvider.servicecatagaryvehicleApi();
    }

    // if (servicecatserviceModel?.vehicles![0].id == null) {
    //   //Get.to(() => TotalPrice());
    //   isLoading(false);
    // }

    else {}
  }

  @override
  void onInit() {
    servicecatvehicleApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
