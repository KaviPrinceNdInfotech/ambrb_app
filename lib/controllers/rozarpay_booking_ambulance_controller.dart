import 'dart:async';
import 'dart:convert';

import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/ambulance_order_payment_controllerss.dart';
import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/driver_list_new.dart';
import 'package:ambrd_appss/controllers/get_profile_detail_controller/get_profile_details_controller.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_navbar.dart';
import 'package:ambrd_appss/modules/driver_list/driver_offer_listss.dart';
import 'package:ambrd_appss/services/api_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/acount_service_for_autologin.dart';

class RozarPayAmbulanceController extends GetxController {
  //get isLoading => null;

  RxBool isLoading = false.obs;

  ///

  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  NavController _navcontroller = Get.put(NavController(), permanent: true);

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

  Future<void> openCheckout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ambulanceFee = preferences.getString("ambulanceFee");
    print("ambulance: ${ambulanceFee}");
    var ListpayId = preferences.getString("ambulanceFee");
    print("ambulance: ${ambulanceFee}");
    //ListpayId
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
            const Duration(microseconds: 1000),
            () {
              _navcontroller.tabindex(0);

              Get.to(BottommNavBar());
              // Get.to(MessageScreen(
              //   id: message.data['id'],
              // ));
              //Get.to((MapView));
              //postAmbulancerequestApi(markers);

              ///
            },
          );

          ///todo: start notification.....
          try {
            notificationServices.getDeviceToken().then((value) async {
              var data = {
                //this the particular device id.....
                'to':
                    "${_driverAcceptlistController.getDriveracceptDetail?.deviceId}"
                        .toString(),

                'notification': {
                  'title': 'Ambrd User',
                  'body': 'Your payment done  by user',
                },
                'android': {
                  'notification': {
                    'notification_count': 23,
                  },
                },
                'data': {'type': 'payment_case', 'id': '1233'}
              };

              print("data3${data}");

              await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
                  body: jsonEncode(data),
                  headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization':
                        //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                        'key=AAAAp6CyXz4:APA91bEKZ_ArxpUWyMYnP8Do3oYrgXFVdNm2jQk-i1DjKcR8duPeccS64TohP-OAqxL57-840qWe0oeYDBAOO68-aOO2z9EWIcBbUIsXc-3kA5usYMviDYc_wK6qMsQecvAdM54xfZsO'
                    //'AAAAbao_0RU:APA91bFNp9i75TwjvU16WgWfPltmSZS4RLdHKCXmk93D5RBLXBSmI2ArbPbd4mcSvNaN8w_A-JuERFWLHf00NkRannNN4dJBR_ok3SkDM_erMRYUUUZChujPJXJK8-MFmxtN23Vodtyv'
                  }).then((value) {
                if (kDebugMode) {
                  print("bookdriver${value.body.toString()}");
                }
              }).onError((error, stackTrace) {
                if (kDebugMode) {
                  print(error);
                }
              });

              ///todo: from here custom from backend start...
              var prefs = GetStorage();

              ///todo: from here custom from backend start...
              // PatientRegNo =
              // prefs.read("PatientRegNo").toString();

              AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
              PatientRegNo = prefs.read("PatientRegNo").toString();
              print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
              var body = {
                "AdminLoginId": "${AdminLogin_Id}",
                "DeviceId": value.toString(),
              };
              print("uqdtt${body}");
              http.Response r = await http.post(
                Uri.parse('http://admin.ambrd.in/api/CommonApi/UpdateDeviceId'),
                body: body,
              );

              print(r.body);
              if (r.statusCode == 200) {
                print("usesxssxedd99999${body}");
                return r;
              } else if (r.statusCode == 401) {
                Get.snackbar('message', r.body);
              } else {
                Get.snackbar('Error', r.body);
                return r;
              }

              ///todo end post api from backend..
              ///
              ///call message 2 screen....from book driver....21 july..

              _driverAcceptlistController.update();
              accountService.getAccountData.then((accountData) {});
            });
          } catch (e, s) {
            print(s);
          }

          ///todo: end notificattion....
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
