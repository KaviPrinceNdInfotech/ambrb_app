import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/ambulance_order_payment_controllerss.dart';
import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/driver_list_new.dart';
import 'package:ambrd_appss/controllers/get_profile_detail_controller/get_profile_details_controller.dart';
import 'package:ambrd_appss/controllers/wallet_controllers/wallet_controllers.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/message_screen.dart';
//import 'package:ambrd_driver_app/controllers/wallet_controllers/wallet_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:ps_welness_new_ui/controllers/1_user_view_controller/wallet_user_controller/wallet_controllers_user.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

//import '../post_order_controller/post_order_controller.dart';

class RozarwalletController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;
  final GlobalKey<FormState> walletamountFormKey = GlobalKey();
  //final CartController controller = Get.put(CartController());
  Wallet_2_Controller _walletController = Get.put(Wallet_2_Controller());

  GetProfileController _getProfileController = Get.put(GetProfileController());

  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  NavController _navcontroller = Get.put(NavController(), permanent: true);

  GetProfileController _userrsProfileControllers =
      Get.put(GetProfileController());

  // GetProfileController getProfileController =
  // Get.put(GetProfileController());

  AmbulanceOrderpaymentController _ambulanceOrderpaymentController =
      Get.put(AmbulanceOrderpaymentController());
  //Wallet_2_Controller _walletPostController = Get.put(WalletPostController());
  //GetProfileController _getProfileController = Get.put(GetProfileController());

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  late Razorpay _razorpay;

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

//int.parse(amount != null ? amount : '0');
  void openCheckout() async {
    var options = {
      // 'key': 'rzp_live_sTN4TNvGmEs3C1',
      //'key': 'rzp_test_aeRns0u8gPpOUK',
      'key': 'rzp_test_s1VIQAlF8CZRCE',
      'amount':
          //100*100,

          int.parse(
                _walletController.walletAmount.text,
                // _walletPostController.Money.toString()
                // '${_walletPostController.walletamountFormKey.currentState}'
              ) *
              100,

      // 'amount': int.parse(
      //     '${_walletPostController.walletPostApi.toString()}') *
      //     100,
      'name':
          "${_userrsProfileControllers.getProfileDetail?.patientName.toString()}",

      // _walletController.getprofileModel?.result?.name.toString(),
      // 'Kumar Prince',
      'timeout': 60 * 5,
      'description': 'Do Payment',
      'prefill': {
        'contact':
            "${_userrsProfileControllers.getProfileDetail?.mobileNumber.toString()}",

        //_getProfileController.getprofileModel?.result?.mobileNo.toString(),
        //'7019380053',
        'email': _userrsProfileControllers.getProfileDetail?.emailId.toString(),
        //_getProfileController.getprofileModel?.result?.emailId.toString(),
        // 'kumarprince269@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  // void handlerPaymentSuccess() {
  //   Get.to(Itemsbuy());
  // }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Get.snackbar("SUCCESS", "ID: ${response.paymentId}");
    print('payment sucess');

    await _walletController.walletPostApi().then((statusCode) async {
      // _postOrderController.postOrderApi().then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        // _getProfileController.OrderHistoryApi();
        await _walletController.walletAmount.text;
        await _walletController.WalletGetApi();
        Get.back();
        Get.to(MessageScreen5(
          id: "12345678",
        ));
      } else {
        // SHow
      }
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar(
        "ERROR", "CODE: ${response.code}  MESSAGE:${response.message}");
    print('payment fail');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("EXTERNAL WALLET", "WALLET NAME: ${response.walletName}");
  }
}
