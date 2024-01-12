import 'package:ambrd_appss/model/payment_history_modelview.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:get/get.dart';
//import 'package:ps_welness_new_ui/servicess_api/api_services_all_api.dart';

class DriverPaymentHistoryController extends GetxController {
  RxBool isLoading = true.obs;
  // List<DriverPaymentHistory>? getDriverPaymentHistory;
  DriverPaymentsHistoryModel? getDriverPaymentHistory;
  //DriverPaymentHistoryModel

  Future<void> userPaymentHistoryApi() async {
    isLoading(true);
    getDriverPaymentHistory = await ApiProvider.UserPaymentHistory();
    if (getDriverPaymentHistory != null) {
      isLoading(false);
      foundpaymenthistorydriver.value =
          getDriverPaymentHistory!.paymentHistory!;
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

  RxList<PaymentHistory> foundpaymenthistorydriver = RxList<PaymentHistory>([]);
  void filterdriverpaymenthistory(String searchpaymenthistorydriverName) {
    List<PaymentHistory>? finalResult = [];
    if (searchpaymenthistorydriverName.isEmpty) {
      finalResult = getDriverPaymentHistory!.paymentHistory;
    } else {
      finalResult = getDriverPaymentHistory!.paymentHistory!
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
