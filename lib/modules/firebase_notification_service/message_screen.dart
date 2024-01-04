import 'dart:async';
import 'dart:convert';

import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/ambulance_order_payment_controllerss.dart';
import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/driver_list_new.dart';
import 'package:ambrd_appss/controllers/periodic_function_controller.dart';
import 'package:ambrd_appss/controllers/rozarpay_booking_ambulance_controller.dart';
import 'package:ambrd_appss/controllers/wallet_controllers/wallet_controllers.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_navbar.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/walet_user/wallet_user.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/firebase_notification_servc.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/local_notifications.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../driver_list/driver_offer_listss.dart';

class MessageScreen5 extends StatefulWidget {
  final String id;
  const MessageScreen5({Key? key, required this.id}) : super(key: key);

  @override
  State<MessageScreen5> createState() => _MessageScreen5State();
}

class _MessageScreen5State extends State<MessageScreen5> {
  //DriverPayoutController _driverPayoutController =
  // AmbulancegetController _ambulancegetController =
  //     Get.put(AmbulancegetController());
  NotificationServices notificationServices = NotificationServices();
  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  PeriodicFunctionController _periodicFunctionController =
      Get.put(PeriodicFunctionController());

  NavController _navcontroller = Get.put(NavController(), permanent: true);

  RozarPayAmbulanceController _rozarPayAmbulanceController =
      Get.put(RozarPayAmbulanceController());

  AmbulanceOrderpaymentController _ambulanceOrderpaymentController =
      Get.put(AmbulanceOrderpaymentController());

  Wallet_2_Controller _walletPostController = Get.put(Wallet_2_Controller());

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();

    ///
    //  _driverAcceptlistController.driveracceptuserDetailApi();
    // _driverAcceptlistController.update();

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
    var base = 'http://test.pswellness.in/Images/';

    ///todo: maths logoc....
    final driverFee = (_driverAcceptlistController
            .getDriveracceptDetail?.totalPrice
            ?.toDouble() ??
        00);
    // _driverAcceptlistController.getDriveracceptDetail?.totalPrice ?? 00;
    //print("${element.price * element.step} c");
    final driverFeesdiscount = (_driverAcceptlistController
                .getDriveracceptDetail?.totalPrice
                ?.toDouble() ??
            00)! *
        (90 / 100);
    final finaldriverAmounts = driverFee - driverFeesdiscount;
    var finalamtdriver = double.parse("${driverFee.toDouble() - 0}");

    ///double.parse("${driverFee.toDouble() - driverFeesdiscount.toDouble()}");
    var ListpayId =
        _driverAcceptlistController.getDriveracceptDetail?.id.toString();
    print("driverfees:${driverFee}");
    print("driverdiscount:${driverFeesdiscount}");
    print("drivertotal:${finaldriverAmounts}");
    print("drivertotalremaining:${finalamtdriver}");

    return Container(
      color: MyTheme.ambapp5,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: MyTheme.ambapp5,
        //   elevation: 0,
        // ),
        body: SafeArea(
          child: Obx(
            () => (_driverAcceptlistController.isLoading.value)
                ? const Center(child: CircularProgressIndicator())
                : _driverAcceptlistController
                            .getDriveracceptDetail?.driverName ==
                        null
                    ? const Center(
                        child: Text(
                          'No Data',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: size.height * 0.001,
                            //bottom: size.height * 0.64,
                            //left: -30,
                            right: -size.width * 0.024,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: size.height * 0.20,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                    //color: Colors.,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'lib/assets/images/AMB4.png',
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.02),
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
                                          color: MyTheme.ambapp4,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    Text(
                                      'Your Ambulance is \n ready to come',
                                      style: GoogleFonts.alatsi(
                                          fontSize: size.height * 0.022,
                                          fontWeight: FontWeight.w600,
                                          color: MyTheme.ambapp3),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.1,
                              ),
                              //Spacer(),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.5,
                                  margin:
                                      EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                        fit: BoxFit.fill),
                                    //color: MyTheme.containercolor8,
                                    borderRadius: BorderRadius.circular(20),
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
                                        vertical: size.width * 0.0 / 05),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffF0F3F8),
                                              Color(0xffF0F3F8)
                                              //darkPrimary,
                                            ]),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 0,
                                            color: Colors.grey.shade200,
                                          ),
                                          BoxShadow(
                                            offset: Offset(2, 2),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            color: Colors.grey.shade500,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.verified,
                                                color: MyTheme.containercolor17,
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.driverName.toString()}",

                                                /// "Kumar Prince",
                                                // 'Kumar Prince',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: size.width * 0.06,
                                                  fontWeight: FontWeight.w700,
                                                  color: MyTheme.ambapp,
                                                ),
                                              ),
                                              Spacer(),

                                              ///images...
                                              Container(
                                                height: size.height * 0.12,
                                                width: size.width * 0.2,
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow.shade800,
                                                  shape: BoxShape.circle,
                                                  // image: DecorationImage(
                                                  //   fit: BoxFit.fill,
                                                  //   image: NetworkImage(
                                                  //     "$base${_driverAcceptlistController.getDriveracceptDetail?.driverImage.toString()}",
                                                  //     // 'https://wallpaperaccess.com/full/2440003.jpg'
                                                  //   ),
                                                  // )

                                                  ///

                                                  //Image.network(
                                                  //                      base +
                                                  //                                         '${_labreportviewController.labreportimage?.labViewReportFile?[index].file.toString()}',
                                                ),

                                                ///
                                                child: InkWell(
                                                  onTap: () {
                                                    // MapUtils.openMap(
                                                    //     47.628293260721,
                                                    //     -122.34263420105);

                                                    ///todo:.........................................uuuuuu.....google map application open.......
                                                  },
                                                  child: Container(
                                                    height: size.height * 0.12,
                                                    width: size.width * 0.18,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.black38),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: ClipRect(
                                                      child: CachedNetworkImage(
                                                        imageUrl: base +
                                                            '${_driverAcceptlistController.getDriveracceptDetail?.driverImage}',
                                                        //'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          width: 80.0,
                                                          height: 80.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                      // CachedNetworkImage(
                                                      //   imageUrl: base +
                                                      //       "${_driverAcceptlistController.getDriveracceptDetail?.driverImage.toString()}",
                                                      //   fit: BoxFit.fill,
                                                      //   placeholder: (context, url) =>
                                                      //       Container(
                                                      //           height: size.height *
                                                      //               0.17,
                                                      //           width:
                                                      //               size.width * 0.36,
                                                      //
                                                      //           //width: 4.w,
                                                      //           child: Center(
                                                      //             child: Image.asset(
                                                      //               "lib/assets/icons/drdriver.png",
                                                      //               fit: BoxFit.fill,
                                                      //               height:
                                                      //                   size.height *
                                                      //                       0.17,
                                                      //             ),
                                                      //             //CircularProgressIndicator()
                                                      //           )),
                                                      //   errorWidget:
                                                      //       (context, url, error) =>
                                                      //           Icon(
                                                      //     Icons.error,
                                                      //     color: Colors.red,
                                                      //   ),
                                                      // ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.0,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Mobile:',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp
                                                    //Color(0xff12BFC4),
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
                                                width: size.width * 0.006,
                                              ),
                                              Center(
                                                child: Text(
                                                  "${_driverAcceptlistController.getDriveracceptDetail?.mobileNumber}",

                                                  //"934422221",
                                                  //'2020 Honda Clive',
                                                  //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                  style: GoogleFonts.aBeeZee(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey.shade900,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.014,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Total Distance:',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
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
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.totalDistance ?? 0} Km",

                                                // "10 km.",
                                                //'2020 Honda Clive',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.aBeeZee(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Total Price :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "\u{20B9}${_driverAcceptlistController.getDriveracceptDetail?.totalPrice}",

                                                //"100",
                                                // '121234333377',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Payable Price :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "\u{20B9}${finaldriverAmounts}",

                                                //"100",
                                                // '121234333377',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          //finaldriverAmounts
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'DL Number :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.dlNumber}",

                                                // '23344eerdd',
                                                // """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                //maxLines: 2,
                                                //'ENP 2345',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Vehicle  Number :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                "${_driverAcceptlistController.getDriveracceptDetail?.vehicleNumber}",

                                                //'BR04jjk909',
                                                // """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                // maxLines: 2,
                                                //'ENP 2345',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey.shade900,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.015,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Vehicle Info :',
                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                style: GoogleFonts.actor(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.w700,
                                                    color: MyTheme.ambapp),
                                              ),
                                              SizedBox(
                                                  //width: size.width * 0.001,
                                                  ),
                                              SizedBox(
                                                height: size.height * 0.04,
                                                width: size.width * 0.62,
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: size.width * 0.01,
                                                        top: size.height *
                                                            0.002),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${_driverAcceptlistController.getDriveracceptDetail?.vehicleTypeName}",
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,

                                                        //'Maruti suzuki swift',
                                                        // """Noida near nd infotech C53 Noida YY YY YY trhtrhtdsVsdvds cdsVDS""",
                                                        //maxLines: 2,
                                                        //'ENP 2345',
                                                        //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: size.width *
                                                              0.035,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: Colors
                                                              .grey.shade900,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          //wallet
                                          Row(
                                            children: [
                                              ///payamoutnt.......wallet....
                                              /////finalamtdriver
                                              SizedBox(
                                                height: size.height * 0.05,
                                                width: size.width * 0.35,
                                                child: NeoPopButton(
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                  bottomShadowColor: ColorUtils
                                                          .getVerticalShadow(
                                                              Colors.orange
                                                                  .shade300)
                                                      .toColor(),
                                                  rightShadowColor: ColorUtils
                                                          .getHorizontalShadow(
                                                              Colors.orange
                                                                  .shade300)
                                                      .toColor(),
                                                  //animationDuration: kButtonAnimationDuration,
                                                  depth: kButtonDepth,
                                                  onTapUp: () async {
                                                    ///todo: from here  list id via share preference........................................

                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    await prefs.setString(
                                                        "ListpayId",
                                                        "${_driverAcceptlistController.getDriveracceptDetail?.id}");
                                                    await SharedPreferences
                                                        .getInstance();
                                                    prefs.setString(
                                                        "ambulanceFee",
                                                        "${_driverAcceptlistController.getDriveracceptDetail?.totalPrice?.toDouble()}");

                                                    ///

                                                    ///
                                                    final Ambulancefees =
                                                        //finaldriverAmounts
                                                        driverFee.toDouble() -
                                                            driverFeesdiscount
                                                                .toDouble();
                                                    //     _driverAcceptlistController
                                                    //             .getDriveracceptDetail
                                                    //             ?.totalPrice
                                                    //             ?.toDouble() ??
                                                    //  finaldriverAmounts
                                                    //         0;
                                                    final walletAmount =
                                                        _walletPostController
                                                                .getwalletamount
                                                                ?.walletAmount ??
                                                            0;
                                                    //driverFee
                                                    print(
                                                        "AmbulanceFEE $finalamtdriver");
                                                    // print(
                                                    //     "Ambulanceamount $walletAmount");

                                                    print(
                                                        "WALLET AMOUNT $walletAmount");
                                                    if (finalamtdriver >
                                                        walletAmount) {
                                                      Get.snackbar("Low Amount",
                                                          "Please Add Money");

                                                      Get.to(
                                                        () =>
                                                            WolletUser(), //next page class
                                                        duration: Duration(
                                                            milliseconds:
                                                                300), //duration of transitions, default 1 sec
                                                        transition:
                                                            Transition.zoom,
                                                      );

                                                      /// Not possibble from wallet go to add page
                                                    } else {
                                                      // final newWalletAmount =
                                                      //     walletAmount -
                                                      //         Ambulancefees;
                                                      final newWalletAmount =
                                                          finalamtdriver - 0;
                                                      _walletPostController
                                                          .walletPostUpdateApi(
                                                              newWalletAmount)
                                                          //abbulance fees will go with this.....
                                                          .then(
                                                              (statusCode) async {
                                                        if (statusCode == 200) {
                                                          ///post order api....
                                                          await _ambulanceOrderpaymentController
                                                              .postOrderAmbulanceonlineApi()
                                                              .then(
                                                                  (statusCode) async {
                                                            if (statusCode ==
                                                                200) {
                                                              Get.snackbar(
                                                                  "Payment Success",
                                                                  "Your booking confirmed");

                                                              ///todo: start notification.....
                                                              try {
                                                                notificationServices
                                                                    .getDeviceToken()
                                                                    .then(
                                                                        (value) async {
                                                                  var data = {
                                                                    //this the particular device id.....
                                                                    'to':
                                                                        // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                                                                        //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
                                                                        //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',

                                                                        ///todo device token......
                                                                        "${_driverAcceptlistController.getDriveracceptDetail?.deviceId}"
                                                                            .toString(),

                                                                    ///
                                                                    //
                                                                    //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                                    //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                                    //.toString(),

                                                                    ///this is same device token....
                                                                    //value
                                                                    //.toString(),
                                                                    'notification':
                                                                        {
                                                                      'title':
                                                                          'Ambrd User',
                                                                      'body':
                                                                          'Your payment done  by user',
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
                                                                          'payment_case',
                                                                      'id':
                                                                          '1233'
                                                                    }
                                                                  };

                                                                  print(
                                                                      "data3${data}");

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
                                                                            'key=AAAAp6CyXz4:APA91bEKZ_ArxpUWyMYnP8Do3oYrgXFVdNm2jQk-i1DjKcR8duPeccS64TohP-OAqxL57-840qWe0oeYDBAOO68-aOO2z9EWIcBbUIsXc-3kA5usYMviDYc_wK6qMsQecvAdM54xfZsO'
                                                                        //'AAAAbao_0RU:APA91bFNp9i75TwjvU16WgWfPltmSZS4RLdHKCXmk93D5RBLXBSmI2ArbPbd4mcSvNaN8w_A-JuERFWLHf00NkRannNN4dJBR_ok3SkDM_erMRYUUUZChujPJXJK8-MFmxtN23Vodtyv'
                                                                      }).then(
                                                                      (value) {
                                                                    if (kDebugMode) {
                                                                      print(
                                                                          "bookdriver${value.body.toString()}");
                                                                    }
                                                                  }).onError((error,
                                                                      stackTrace) {
                                                                    if (kDebugMode) {
                                                                      print(
                                                                          error);
                                                                    }
                                                                  });

                                                                  ///todo: from here custom from backend start...
                                                                  var prefs =
                                                                      GetStorage();

                                                                  ///todo: from here custom from backend start...
                                                                  // PatientRegNo =
                                                                  // prefs.read("PatientRegNo").toString();

                                                                  AdminLogin_Id = prefs
                                                                      .read(
                                                                          "AdminLogin_Id")
                                                                      .toString();
                                                                  PatientRegNo = prefs
                                                                      .read(
                                                                          "PatientRegNo")
                                                                      .toString();
                                                                  print(
                                                                      '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                                                                  var body = {
                                                                    "AdminLoginId":
                                                                        "${AdminLogin_Id}",
                                                                    "DeviceId":
                                                                        value
                                                                            .toString(),
                                                                  };
                                                                  print(
                                                                      "uqdtt${body}");
                                                                  http.Response
                                                                      r =
                                                                      await http
                                                                          .post(
                                                                    Uri.parse(
                                                                        'http://admin.ambrd.in/api/CommonApi/UpdateDeviceId'),
                                                                    body: body,
                                                                  );

                                                                  print(r.body);
                                                                  if (r.statusCode ==
                                                                      200) {
                                                                    print(
                                                                        "usesxssxedd99999${body}");
                                                                    return r;
                                                                  } else if (r
                                                                          .statusCode ==
                                                                      401) {
                                                                    Get.snackbar(
                                                                        'message',
                                                                        r.body);
                                                                  } else {
                                                                    Get.snackbar(
                                                                        'Error',
                                                                        r.body);
                                                                    return r;
                                                                  }

                                                                  ///todo end post api from backend..
                                                                  ///
                                                                  ///call message 2 screen....from book driver....21 july..

                                                                  _driverAcceptlistController
                                                                      .update();
                                                                  accountService
                                                                      .getAccountData
                                                                      .then(
                                                                          (accountData) {});
                                                                });
                                                              } catch (e, s) {
                                                                print(s);
                                                              }

                                                              ///todo: end notificattion....
                                                              ///
                                                              //

                                                              ///_navcontroller.tabindex(0);
                                                              //
                                                              //       Get.to(BottommNavBar());
                                                              await Future.delayed(
                                                                  Duration(
                                                                      milliseconds:
                                                                          700));

                                                              ///
                                                              await _driverAcceptlistController
                                                                  .driveracceptuserDetailApi();
                                                              _driverAcceptlistController
                                                                  .update();

                                                              _driverAcceptlistController
                                                                  .refresh();
                                                              accountService
                                                                  .getAccountData
                                                                  .then(
                                                                      (accountData) {
                                                                // CallLoader.loader();
                                                                // nearlistdriverApi();
                                                                Timer(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          900),
                                                                  () async {
                                                                    _navcontroller
                                                                        .tabindex(
                                                                            0);

                                                                    await Get.to(
                                                                        BottommNavBar());
                                                                  },
                                                                );
                                                                CallLoader
                                                                    .hideLoader();
                                                              });

                                                              ///todo: from here notification service........

                                                              ///This is the main thing to provide updated list history...

                                                              ///nov 14....................................
                                                              //Get.to(OrderConfirmationPage());
                                                            } else {
                                                              Get.snackbar(
                                                                  "Error123",
                                                                  "error");
                                                            }
                                                          });

                                                          ///todo:end post order apis....
                                                          print(
                                                              "WALLET AMOUNTeee $newWalletAmount");

                                                          ///nov 14....................................
                                                          //Get.to(OrderConfirmationPage());
                                                        } else if (statusCode ==
                                                            400) {
                                                          Get.to(
                                                            () =>
                                                                WolletUser(), //next page class
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500), //duration of transitions, default 1 sec
                                                            transition:
                                                                Transition.zoom,
                                                          );
                                                        } else {
                                                          Get.snackbar(
                                                              "Error12378", "");
                                                        }
                                                      });
                                                    }
                                                  },
                                                  border: Border.all(
                                                    color:
                                                        Colors.deepOrangeAccent,
                                                    width: 3,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0,
                                                        vertical: 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text("Pay Wallet",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),

                                              ///payment....via rozar pay...
                                              SizedBox(
                                                height: size.height * 0.05,
                                                width: size.width * 0.35,
                                                child: NeoPopButton(
                                                  color: Colors.indigoAccent,
                                                  bottomShadowColor: ColorUtils
                                                          .getVerticalShadow(
                                                              Colors
                                                                  .indigoAccent
                                                                  .shade200)
                                                      .toColor(),
                                                  rightShadowColor: ColorUtils
                                                          .getHorizontalShadow(
                                                              Colors.indigo
                                                                  .shade100)
                                                      .toColor(),
                                                  //animationDuration: kButtonAnimationDuration,
                                                  depth: kButtonDepth,
                                                  onTapUp: () async {
                                                    SharedPreferences p =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    // p.setString(
                                                    //   //"rrrrrrrrrr4567",
                                                    //    // "${_checkoutController.checkoutModel?.result?.totalCost.toString()
                                                    //   // }"
                                                    // );
                                                    var v = p.getString(
                                                        "rrrrrrrrrr4567");
                                                    print(
                                                        "object3####################:${v}");

                                                    ///.......online....rozarpay...
                                                    //_rozarPayAmbulanceController
                                                    //_driverAcceptlistController

                                                    SharedPreferences prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    prefs.setString(
                                                        "ambulanceFee",
                                                        "${driverFee}");

                                                    await SharedPreferences
                                                        .getInstance();
                                                    await prefs.setString(
                                                        "ListpayId",
                                                        "${_driverAcceptlistController.getDriveracceptDetail?.id}");

                                                    print(
                                                        'okokpayy${ListpayId}');

                                                    //driverFee
                                                    ///  "${finaldriverAmounts}");

                                                    //print("iikyihyih${ambulanceFee}");

                                                    // print("okook: ${fee}");
                                                    ///todo: end the fees.........
                                                    _rozarPayAmbulanceController
                                                        .openCheckout();

                                                    ///
                                                    _driverAcceptlistController
                                                        .driveracceptuserDetailApi();
                                                    _driverAcceptlistController
                                                        .update();
                                                    _driverAcceptlistController
                                                        .refresh();
                                                    // await Future.delayed(
                                                    //     Duration(
                                                    //         milliseconds: 400));

                                                    ///

                                                    ///end..0nline..
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
                                                    // print('princee notification');
                                                    // notificationServices
                                                    //     .getDeviceToken()
                                                    //     .then((value) async {
                                                    //   var data = {
                                                    //     //this the particular device id.....
                                                    //     'to':
                                                    //         //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                    //         //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                    //         //.toString(),
                                                    //
                                                    //         ///this is same device token....
                                                    //         value.toString(),
                                                    //     'notification': {
                                                    //       'title': 'Ps_Wellness',
                                                    //       'body':
                                                    //           'Your request accepted by driver',
                                                    //       //"sound": "jetsons_doorbell.mp3"
                                                    //     },
                                                    //     'android': {
                                                    //       'notification': {
                                                    //         'notification_count':
                                                    //             23,
                                                    //       },
                                                    //     },
                                                    //     'data': {
                                                    //       'type': 'msj1',
                                                    //       'id': '1234567'
                                                    //     }
                                                    //   };
                                                    //   await http.post(
                                                    //       Uri.parse(
                                                    //           'https://fcm.googleapis.com/fcm/send'),
                                                    //       body: jsonEncode(data),
                                                    //       headers: {
                                                    //         'Content-Type':
                                                    //             'application/json; charset=UTF-8',
                                                    //         'Authorization':
                                                    //             //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                    //             'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                    //       }).then((value) {
                                                    //     if (kDebugMode) {
                                                    //       print(
                                                    //           "princedriver${value.body.toString()}");
                                                    //     }
                                                    //   }).onError(
                                                    //       (error, stackTrace) {
                                                    //     if (kDebugMode) {
                                                    //       print(error);
                                                    //     }
                                                    //   });
                                                    // });
                                                  },
                                                  border: Border.all(
                                                    color: Colors.indigoAccent,
                                                    width: 3,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0,
                                                        vertical: 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Text("Pay Online",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                              SizedBox(
                                height: size.height * 0.2,
                              ),
                              //Spacer(),

                              //)
                            ],
                          ),
                        ],
                      ),
          ),
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

///todo:here google map function.......
class MapUtils {
  MapUtils._();
  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not open the map';
    }
  }
}
