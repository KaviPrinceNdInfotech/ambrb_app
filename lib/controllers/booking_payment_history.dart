import 'package:ambrd_appss/model/payment_history_model.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:get/get.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverPaymentHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  DriverPaymentHistoryModel? getDriverPaymentHistory;
  //DriverPaymentHistoryModel

  Future<void> userPaymentHistoryApi() async {
    isLoading(true);
    getDriverPaymentHistory = await ApiProvider.UserPaymentHistory();
    if (getDriverPaymentHistory != null) {
      isLoading(false);
      foundpaymenthistorydriver.value = getDriverPaymentHistory!.driverDetails!;
    }
  }

  @override
  void onInit() {
    super.onInit();
    userPaymentHistoryApi();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  RxList<DriverDetail> foundpaymenthistorydriver = RxList<DriverDetail>([]);
  void filterdriverpaymenthistory(String searchpaymenthistorydriverName) {
    List<DriverDetail>? finalResult = [];
    if (searchpaymenthistorydriverName.isEmpty) {
      finalResult = getDriverPaymentHistory!.driverDetails;
    } else {
      finalResult = getDriverPaymentHistory!.driverDetails!
          .where((element) => element.driverName
              .toString()
              .toLowerCase()
              .contains(searchpaymenthistorydriverName
                  .toString()
                  .toLowerCase()
                  .trim()))
          .toList();
    }
    print(finalResult!.length);
    foundpaymenthistorydriver.value = finalResult!;
  }
}
