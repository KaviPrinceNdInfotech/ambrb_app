import 'package:get/get.dart';

import '../../model/registration_list_model.dart';
import '../../services/api_provider.dart';

class RegistrationListController extends GetxController {
  RxBool isLoading = true.obs;
  RegistrationListModel? getRegistrationList;

  void registrationListApi() async {
    isLoading(true);
    getRegistrationList = await ApiProvider.RegistrationListApi();
    if (getRegistrationList != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    registrationListApi();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
