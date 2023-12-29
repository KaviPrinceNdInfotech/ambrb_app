import 'dart:convert';

import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/accept_reject_list.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/firebase_notification_servc.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageScreen3 extends StatefulWidget {
  final String id;
  MessageScreen3({Key? key, required this.id}) : super(key: key);

  @override
  State<MessageScreen3> createState() => _MessageScreen3State();
}

class _MessageScreen3State extends State<MessageScreen3> {
  //DriverPayoutController _driverPayoutController =
  UseracptrejectController _useracptrejectController =
      Get.put(UseracptrejectController());

  NotificationServices notificationServices = NotificationServices();

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();

    ///
    // _useracptrejectController.driveracceptrejctlistApi();
    //_useracptrejectController.update();
    // _useracptrejectController.refresh();

    ///
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    // notificationServices.requestNotificationPermission();
    // notificationServices.isTokenRefresh();
    // notificationServices.firebaseInit();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
      // print('device token');
      // print(value);
    });

    /// 1. This method call when app in terminated state and you get a notification
    /// when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");

          ///you can call local notification....
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

  // get kButtonAnimationDuration => null;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: MyTheme.ThemeColors,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child:
                // Obx(() =>
                //   _useracptrejectController.isLoading.value
                //       ? Center(
                //           child: CircularProgressIndicator(),
                //         )
                //       :
                Stack(
          children: [
            Positioned(
              top: size.height * 0.0,
              //bottom: size.height * 0.64,
              //left: -30,
              right: -size.width * 0.024,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: size.height * 0.176,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      //color: Colors.,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                            'lib/assets/image/psambulance.png',
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.04),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: size.height * 0.03,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white70,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            size: size.height * 0.022,
                            color: MyTheme.ambapp3,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        'User Ambulance\n Request ',
                        style: GoogleFonts.alatsi(
                            fontSize: size.height * 0.022,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff023382)),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => (_useracptrejectController.isLoading.value)
                      ? const Center(child: CircularProgressIndicator())
                      : _useracptrejectController.userListModeldriver
                                  ?.userListForBookingAmbulance ==
                              null
                          ? const Center(
                              child: Text('No Data'),
                            )
                          : Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      //4,
                                      _useracptrejectController
                                          .userListModeldriver
                                          ?.userListForBookingAmbulance
                                          ?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      //height: size.height * 0.5,
                                      width: size.width,
                                      child: Column(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.03,
                                                vertical: size.height * 0.0005),
                                            child: Container(
                                              height: size.height * 0.35,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 30 / 8),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                                    fit: BoxFit.fill),
                                                //color: MyTheme.containercolor8,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: Offset(-0, -0),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.grey.shade100,

                                                    // color: darkShadow1,
                                                  ),
                                                  BoxShadow(
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 0,
                                                    blurRadius: 0,
                                                    color: Colors.grey.shade200,
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                height: size.height * 0.093,
                                                width: double.infinity,
                                                margin: EdgeInsets.symmetric(
                                                    vertical:
                                                        size.width * 0.0 / 05),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                        colors: [
                                                          Color(0xffF0F3F8),
                                                          Color(0xffF0F3F8)
                                                          //darkPrimary,
                                                        ]),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(2, 2),
                                                        spreadRadius: 1,
                                                        blurRadius: 0,
                                                        color: Colors
                                                            .grey.shade200,
                                                      ),
                                                      BoxShadow(
                                                        offset: Offset(2, 2),
                                                        spreadRadius: 1,
                                                        blurRadius: 3,
                                                        color: Colors
                                                            .grey.shade500,
                                                      ),
                                                    ]),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.verified,
                                                            color: Color(
                                                                0xff12BFC4),
                                                          ),
                                                          Text(
                                                            "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].patientName.toString()}",
                                                            //"Kumar Prince",
                                                            // 'Kumar Prince',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .aBeeZee(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: MyTheme
                                                                  .ambapp3,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Mobile Number:',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.045,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          // Icon(
                                                          //   Icons
                                                          //       .car_crash_sharp,
                                                          //   size: size.height *
                                                          //       0.02,
                                                          //   color: Colors
                                                          //       .grey.shade600,
                                                          // ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].mobileNumber.toString()}",

                                                            // "10 km.",
                                                            //'2020 Honda Clive',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .aBeeZee(
                                                              fontSize:
                                                                  size.width *
                                                                      0.036,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Total Distance:',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.045,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          // Icon(
                                                          //   Icons
                                                          //       .car_crash_sharp,
                                                          //   size: size.height *
                                                          //       0.02,
                                                          //   color: Colors
                                                          //       .grey.shade600,
                                                          // ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].toatlDistance}Km",

                                                            // "10 km.",
                                                            //'2020 Honda Clive',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .aBeeZee(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.02,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Total Price :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "\u{20B9}${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].totalPrice}",

                                                            //"\u{20B9} 100",
                                                            // '121234333377',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize:
                                                                  size.width *
                                                                      0.04,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Colors.grey
                                                                  .shade900,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.01,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Pickup Address :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          SizedBox(
                                                            //  height: size.height * 0.02,
                                                            width: size.width *
                                                                0.61,
                                                            child: Text(
                                                              "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].reverseStartLatLongToLocation.toString()}",

                                                              // """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                              maxLines: 2,
                                                              //'ENP 2345',
                                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .grey
                                                                    .shade900,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.012,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'End Address :',
                                                            //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                            style: GoogleFonts
                                                                .actor(
                                                              fontSize:
                                                                  size.width *
                                                                      0.035,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xff12BFC4),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: size.width *
                                                                0.01,
                                                          ),
                                                          SizedBox(
                                                            //  height: size.height * 0.02,
                                                            width: size.width *
                                                                0.66,
                                                            child: Text(
                                                              "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].reverseEndLatLongToLocation.toString()}",

                                                              //  """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                              maxLines: 2,
                                                              //'ENP 2345',
                                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .grey
                                                                    .shade900,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.05,
                                                            width: size.width *
                                                                0.35,
                                                            child: NeoPopButton(
                                                              color: Colors.red,
                                                              bottomShadowColor:
                                                                  ColorUtils.getVerticalShadow(Colors
                                                                          .orange
                                                                          .shade300)
                                                                      .toColor(),
                                                              rightShadowColor:
                                                                  ColorUtils.getHorizontalShadow(Colors
                                                                          .orange
                                                                          .shade300)
                                                                      .toColor(),
                                                              //animationDuration: kButtonAnimationDuration,
                                                              depth:
                                                                  kButtonDepth,
                                                              onTapUp:
                                                                  () async {
                                                                SharedPreferences
                                                                    prefs =
                                                                    await SharedPreferences
                                                                        .getInstance();
                                                                prefs.setString(
                                                                    "driacceptrejectlistid",
                                                                    "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].id}");
                                                                prefs.setString(
                                                                    "driveracceptrjctDeviceid",
                                                                    "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}");
                                                                // prefs.setString(
                                                                //     "lng1",
                                                                //     "${widget.driverlist?.startLong.toString()}");
                                                                // prefs.setString(
                                                                //     "lat1",
                                                                //     "${widget.driverlist?.startLat.toString()}");
                                                                //
                                                                // prefs.setString(
                                                                //     "lng2",
                                                                //     "${widget.driverlist?.endLong.toString()}");
                                                                // prefs.setString(
                                                                //     "lat2",
                                                                //     "${widget.driverlist?.endLat.toString()}");
                                                                // prefs.setString(
                                                                //     "ambulance1",
                                                                //     "${widget.driverlist?.ambulanceTypeId.toString()}");
                                                                // prefs.setString(
                                                                //     "vehicle1",
                                                                //     "${widget.driverlist?.vehicleTypeId.toString()}");

                                                                // _ambulancegetController
                                                                // .postAmbulancerequestApi2();
                                                                ///todo: call reject booking api...

                                                                _useracptrejectController
                                                                    .rejectbookingdriverApi();

                                                                ///.......
                                                                print(
                                                                    'princee notification');
                                                                notificationServices
                                                                    .getDeviceToken()
                                                                    .then(
                                                                        (value) async {
                                                                  var data = {
                                                                    //this the particular device id.....
                                                                    'to':
                                                                        "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}",

                                                                    //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                    //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                    //.toString(),

                                                                    ///this is same device token....
                                                                    // value
                                                                    // .toString(),
                                                                    'notification':
                                                                        {
                                                                      'title':
                                                                          'Ps_Wellness',
                                                                      'body':
                                                                          'You request rejected by Driver',
                                                                      //"sound": "jetsons_doorbell.mp3"
                                                                    },
                                                                    'android': {
                                                                      'notification':
                                                                          {
                                                                        'notification_count':
                                                                            23,
                                                                      },
                                                                    },
                                                                    'data': {
                                                                      'type':
                                                                          'reject_case',
                                                                      //reject_case
                                                                      //accept_case
                                                                      'id':
                                                                          '1234567'
                                                                    }
                                                                  };
                                                                  print(
                                                                      "datareject:${data}");

                                                                  await http.post(
                                                                      Uri.parse(
                                                                          'https://fcm.googleapis.com/fcm/send'),
                                                                      body: jsonEncode(
                                                                          data),
                                                                      headers: {
                                                                        'Content-Type':
                                                                            'application/json; charset=UTF-8',
                                                                        'Authorization':
                                                                            //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                                            'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                                      }).then(
                                                                      (value) {
                                                                    if (kDebugMode) {
                                                                      print(
                                                                          "princedriverreject${value.body.toString()}");
                                                                    }
                                                                  }).onError((error,
                                                                      stackTrace) {
                                                                    if (kDebugMode) {
                                                                      print(
                                                                          error);
                                                                    }
                                                                  });
                                                                });
                                                              },
                                                              border:
                                                                  Border.all(
                                                                color:
                                                                    Colors.red,
                                                                width: 3,
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        0,
                                                                    vertical:
                                                                        0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: const [
                                                                    Text(
                                                                        "Reject",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.05,
                                                            width: size.width *
                                                                0.35,
                                                            child: NeoPopButton(
                                                              color:
                                                                  Colors.green,
                                                              bottomShadowColor:
                                                                  ColorUtils.getVerticalShadow(Colors
                                                                          .greenAccent
                                                                          .shade100)
                                                                      .toColor(),
                                                              rightShadowColor:
                                                                  ColorUtils.getHorizontalShadow(Colors
                                                                          .greenAccent
                                                                          .shade100)
                                                                      .toColor(),
                                                              //animationDuration: kButtonAnimationDuration,
                                                              depth:
                                                                  kButtonDepth,
                                                              onTapUp:
                                                                  () async {
                                                                SharedPreferences
                                                                    prefs =
                                                                    await SharedPreferences
                                                                        .getInstance();
                                                                prefs.setString(
                                                                    "driveracceptrjctDeviceid",
                                                                    "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}");

                                                                prefs.setString(
                                                                    "driacceptrejectlistid",
                                                                    "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].id}");
                                                                // SharedPreferences
                                                                // prefs =
                                                                // await SharedPreferences
                                                                //     .getInstance();
                                                                // prefs.setString(
                                                                //     "driverlistssId",
                                                                //     "${widget.driverlist?.message?[index].driverId.toString()}");
                                                                // prefs.setString(
                                                                //     "lng1",
                                                                //     "${widget.driverlist?.startLong.toString()}");
                                                                // prefs.setString(
                                                                //     "lat1",
                                                                //     "${widget.driverlist?.startLat.toString()}");
                                                                //
                                                                // prefs.setString(
                                                                //     "lng2",
                                                                //     "${widget.driverlist?.endLong.toString()}");
                                                                // prefs.setString(
                                                                //     "lat2",
                                                                //     "${widget.driverlist?.endLat.toString()}");
                                                                // prefs.setString(
                                                                //     "ambulance1",
                                                                //     "${widget.driverlist?.ambulanceTypeId.toString()}");
                                                                // prefs.setString(
                                                                //     "vehicle1",
                                                                //     "${widget.driverlist?.vehicleTypeId.toString()}");

                                                                // _ambulancegetController
                                                                // .postAmbulancerequestApi2();

                                                                ///.......
                                                                ///todo: call accept booking api...
                                                                _useracptrejectController
                                                                    .acceptbookingdriverApi();
                                                                print(
                                                                    'princee notification');
                                                                notificationServices
                                                                    .getDeviceToken()
                                                                    .then(
                                                                        (value) async {
                                                                  var data = {
                                                                    //this the particular device id.....
                                                                    'to':
                                                                        "${_useracptrejectController.userListModeldriver?.userListForBookingAmbulance?[index].deviceId}",

                                                                    //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                    //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                    //.toString(),

                                                                    ///this is same device token....
                                                                    //value
                                                                    //.toString(),
                                                                    'notification':
                                                                        {
                                                                      'title':
                                                                          'Ps_Wellness',
                                                                      'body':
                                                                          'Your request accepted by driver',
                                                                      //"sound": "jetsons_doorbell.mp3"
                                                                    },
                                                                    'android': {
                                                                      'notification':
                                                                          {
                                                                        'notification_count':
                                                                            23,
                                                                      },
                                                                    },
                                                                    'data': {
                                                                      'type':
                                                                          'accept_case',
                                                                      'id':
                                                                          '12345678'
                                                                    }
                                                                  };
                                                                  print(
                                                                      "dataccept:${data}");

                                                                  await http.post(
                                                                      Uri.parse(
                                                                          'https://fcm.googleapis.com/fcm/send'),
                                                                      body: jsonEncode(
                                                                          data),
                                                                      headers: {
                                                                        'Content-Type':
                                                                            'application/json; charset=UTF-8',
                                                                        'Authorization':
                                                                            //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                                            'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                                      }).then(
                                                                      (value) {
                                                                    if (kDebugMode) {
                                                                      print(
                                                                          "princedriver${value.body.toString()}");
                                                                    }
                                                                  }).onError((error,
                                                                      stackTrace) {
                                                                    if (kDebugMode) {
                                                                      print(
                                                                          error);
                                                                    }
                                                                  });
                                                                });
                                                              },
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .green,
                                                                width: 3,
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        0,
                                                                    vertical:
                                                                        0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: const [
                                                                    Text(
                                                                        "Accept",
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              17,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          //Spacer(),

                                          //)
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
              ],
            ),
          ],
        )
            //),
            ),
      ),
    );
  }
}

///

// class MessageScreen1 extends StatefulWidget {
//   final String id;
//   const MessageScreen({Key? key, required this.id}) : super(key: key);
//
//   @override
//   State<MessageScreen> createState() => _MessageScreenState();
// }
//
// class _MessageScreenState extends State<MessageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Message Screen' + widget.id),
//       ),
//     );
//   }
// }
