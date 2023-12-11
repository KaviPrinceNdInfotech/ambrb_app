import 'dart:async';

import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/ambulance_order_payment_controllerss.dart';
import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/driver_list_new.dart';
import 'package:ambrd_appss/controllers/get_profile_detail_controller/get_profile_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/acount_service_for_autologin.dart';

class RozarPayAmbulanceController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;

  ///

  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  GetProfileController _userrsProfileControllers =
      Get.put(GetProfileController());

  AmbulanceOrderpaymentController _ambulanceOrderpaymentController =
      Get.put(AmbulanceOrderpaymentController());

  // LabHistoryController _labHistoryController = Get.put(LabHistoryController());
  // DoctorHistoryController _doctorHistoryController =
  //     Get.put(DoctorHistoryController());

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

  void openCheckout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ambulanceFee = preferences.getString("ambulanceFee");
    print("ambulance: ${ambulanceFee}");
    var options = {
      //'key': 'rzp_live_sTN4TNvGmEs3C1',
      'key': 'rzp_test_aeRns0u8gPpOUK',
      'amount': double.parse(
              // '100'
              '${ambulanceFee}'

              // '${_driverAcceptlistController.getDriveracceptDetail?.totalPrice?.toInt()}'
              ) *
          100,
      'name':
          //'Kavi Singh',
          "${_userrsProfileControllers.getProfileDetail?.patientName.toString()}",
      'timeout': 60 * 5,
      'description': 'Do Payment',
      'prefill': {
        'contact':
            "${_userrsProfileControllers.getProfileDetail?.mobileNumber.toString()}",

        //'7877663456',
        //_getProfileController.getprofileModel!.result!.mobileNo.toString(),
        //'7019380053',
        'email': _userrsProfileControllers.getProfileDetail?.emailId.toString(),

        //'kp@gmail.com',
        // _getProfileController.getprofileModel!.result!.emailId.toString(),
        //'kumarprince261299@gmail.com'
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar("SUCCESS", "ID: ${response.paymentId}");
    print('payment sucess');

    _ambulanceOrderpaymentController
        .postOrderAmbulanceonlineApi()
        .then((statusCode) {
      if (statusCode == 200) {
        ///This is the main thing to provide updated list history...
        //_driverAcceptlistController.driveracceptuserDetailApi();

        ///nov 14....................................
        _driverAcceptlistController.driveracceptuserDetailApi();
        _driverAcceptlistController.update();
        _driverAcceptlistController.refresh();
        accountService.getAccountData.then((accountData) {
          // CallLoader.loader();
          // nearlistdriverApi();

          Timer(
            const Duration(microseconds: 500),
            () {
              // nearlistdriverApi();
              Get.to(BottomAppBar());
              // Get.to(MessageScreen(
              //   id: message.data['id'],
              // ));
              //Get.to((MapView));
              //postAmbulancerequestApi(markers);

              ///
            },
          );
          //CallLoader.hideLoader();
        });
        //_doctorHistoryController.update();
        //_doctorHistoryController.doctorListHospitalApi();
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
