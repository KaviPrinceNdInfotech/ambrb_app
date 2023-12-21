import 'package:ambrd_appss/model/driver_acceptlist_model/driver_acceptlist_model.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:get/get.dart';

class DriverAcceptlistController extends GetxController {
  RxBool isLoading = true.obs;
  //List<DriverProfileDetailModel>? getDriverProfileDetail;
  DriveracceptModeluser? getDriveracceptDetail;

  Future<void> driveracceptuserDetailApi() async {
    isLoading(false);

    getDriveracceptDetail = await ApiProvider.AcceptDriverDetailUserApi();
    if (getDriveracceptDetail?.driverName == null) {
      isLoading(false);
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
