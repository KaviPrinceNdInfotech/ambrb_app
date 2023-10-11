import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/complaint_list_model.dart';
import '../../services/api_provider.dart';

class ComplaintListController extends GetxController {
  RxBool isLoading = true.obs;

  ComplaintListOpenModel? complaintListOpenModel;
  ComplaintListCloseModel? complaintListCloseModel;
  ComplaintListPendingModel? complaintListPendingModel;

//ComplaintList Open
  void complainListOpenApi() async {
    isLoading(true);
    complaintListOpenModel = await ApiProvider.complaintListOpenApi();
    if (complaintListOpenModel != null) {
      isLoading(false);
    }
  }

  //ComplaintList Close
  void complainListCloseApi() async {
    isLoading(true);
    complaintListCloseModel = await ApiProvider.complaintListCloseApi();
    if (complaintListCloseModel != null) {
      isLoading(false);
    }
  }

  //ComplaintList Pending
  void complainListPendingApi() async {
    isLoading(true);
    complaintListPendingModel = await ApiProvider.complaintListPendingApi();
    if (complaintListPendingModel != null) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    complainListOpenApi();
    complainListCloseApi();
    complainListPendingApi();
    super.onInit();
  }

  @override
  void onClose() {
    complaintListOpenModel = null;
    complaintListPendingModel = null;
    super.onClose();
  }

  @override
  void dispose() {
    complaintListOpenModel = null;
    complaintListPendingModel = null;
    super.dispose();
  }
}
