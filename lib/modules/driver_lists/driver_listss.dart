import 'dart:async';
import 'dart:convert';

import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/ambulance_order_payment_controller/driver_list_new.dart';
import 'package:ambrd_appss/controllers/booking_vehicle_controller_common/user_offer_controller.dart';
import 'package:ambrd_appss/model/driver_list_by_post_book_ambulance_api_model/driver_list_by_post_model.dart';
import 'package:ambrd_appss/modules/booking_brb/booking_apbrd_map_new_controller.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/firebase_notification_servc.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/local_notifications.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/message_screen.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

String PatientRegNo = ''.toString();
String userPassword = ''.toString();
String AdminLogin_Id = ''.toString();

Set<Marker> markers = {};

//AdminLogin_Id

OfferuserController _offeruserController = Get.put(OfferuserController());

String DriverId = ''.toString();
String driverpassword = ''.toString();
var alldevicetoken = '';

class DriverListById extends StatefulWidget {
  DriverListById({Key? key, this.driverlist}) : super(key: key);
  DriverListByPostModel? driverlist;

  @override
  State<DriverListById> createState() => _DriverListByIdState();
}

class _DriverListByIdState extends State<DriverListById> {
  //NotificationServices notificationServices = NotificationServices();

  //DriverPayoutController _driverPayoutController =
  AmbulancegetsController _ambulancegetController =
      Get.put(AmbulancegetsController());

  // AmbulancegetsController
  NotificationServices notificationServices = NotificationServices();
  DriverAcceptlistController _driverAcceptlistController =
      Get.put(DriverAcceptlistController());

  ///implement firebase....27...jun..2023
  @override
  void initState() {
    super.initState();
    print("okoko33334${alldevicetoken}");
    DriverListByPostModel? driverlist;
    List<DriverListByPostModel> driverlists = [];

    ///for each loop......przactice

    List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
    driverlists?.forEach((sd) {
      print("trtrtrtrt888888${sd}");
    });
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    //notificationServices.requestNotificationPermission();
    //notificationServices.isTokenRefresh();

    ///notificationServices.firebaseInit();

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

    ///for each loop......przactice.........
    List<String> driverlist = ['weqweqeqeqqddqdq', 'dsdwdwd'];

    driverlist.forEach((driverlist) {
      print(driverlist);
    });
    return Container(
      color: MyTheme.ambapp4,
      height: size.height,
      width: size.width,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _offeruserController.Chooseambulancevehicleofferkey,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Obx(
              () => _ambulancegetController.isLoading.isFalse
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: size.height * 0.007,
                          //bottom: size.height * 0.64,
                          //left: -30,
                          left: -size.width * 0.024,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: size.height * 0.15,
                              width: size.width * 0.3,
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
                        Positioned(
                          top: size.height * 0.09,
                          //bottom: size.height * 0.64,
                          //left: -30,
                          right: size.width * 0.024,
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.3,
                            child: NeoPopButton(
                              color: Colors.blue.shade800,
                              bottomShadowColor: ColorUtils.getVerticalShadow(
                                      Colors.blue.shade300)
                                  .toColor(),
                              rightShadowColor: ColorUtils.getHorizontalShadow(
                                      Colors.blue.shade300)
                                  .toColor(),
                              //animationDuration: kButtonAnimationDuration,
                              depth: kButtonDepth,
                              onTapUp: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString("startLat5",
                                    "${widget.driverlist?.startLat}");
                                await prefs.setString("startLong5",
                                    "${widget.driverlist?.startLong}");
                                await prefs.setString(
                                    "endLat5", "${widget.driverlist?.endLat}");
                                await prefs.setString("endLong5",
                                    "${widget.driverlist?.endLong}");
                                await prefs.setString("ambulanceTypeId5",
                                    "${widget.driverlist?.ambulanceTypeId}");

                                await Future.delayed(Duration(seconds: 1));

                                //widget.driverlist?.
                                widget.driverlist?.message
                                    ?.forEach((element) async {
                                  ///....start...this is not neswssary i thik i am removing....11 dec 2023
                                  await _ambulancegetController
                                      .postRequestAllApi();

                                  ///..end.....this is not neswssary i thik i am removing....11 dec 2023
                                  print('princee notification');
                                  notificationServices
                                      .getDeviceToken()
                                      .then((value) async {
                                    var data = {
                                      //this the particular device id.....
                                      'to': "${element.deviceId}".toString(),
                                      'notification': {
                                        'title': 'Ambrd User',
                                        'body':
                                            'You have request for ambulance',
                                        //"sound": "jetsons_doorbell.mp3"
                                      },
                                      'android': {
                                        'notification': {
                                          'notification_count': 23,
                                        },
                                      },
                                      'data': {
                                        'type': 'msj',
                                        'id': '123456',
                                      }
                                    };
                                    print("data1${data}");

                                    ///todo: this is the post api for firebase.............
                                    await http.post(
                                        Uri.parse(
                                            'https://fcm.googleapis.com/fcm/send'),
                                        body: jsonEncode(data),
                                        headers: {
                                          'Content-Type':
                                              'application/json; charset=UTF-8',
                                          'Authorization':
                                              'key=AAAAp6CyXz4:APA91bEKZ_ArxpUWyMYnP8Do3oYrgXFVdNm2jQk-i1DjKcR8duPeccS64TohP-OAqxL57-840qWe0oeYDBAOO68-aOO2z9EWIcBbUIsXc-3kA5usYMviDYc_wK6qMsQecvAdM54xfZsO'
                                          //'AAAAbao_0RU:APA91bFNp9i75TwjvU16WgWfPltmSZS4RLdHKCXmk93D5RBLXBSmI2ArbPbd4mcSvNaN8w_A-JuERFWLHf00NkRannNN4dJBR_ok3SkDM_erMRYUUUZChujPJXJK8-MFmxtN23Vodtyv'
                                        }).then((value) {
                                      if (kDebugMode) {
                                        print(
                                            "bookdriver${value.body.toString()}");
                                      }
                                    }).onError((error, stackTrace) {
                                      if (kDebugMode) {
                                        print(error);
                                      }
                                    });

                                    ///todo: from here custom from backend start...
                                    var prefs = GetStorage();
                                    // PatientRegNo =
                                    // prefs.read("PatientRegNo").toString();

                                    AdminLogin_Id =
                                        prefs.read("AdminLogin_Id").toString();
                                    print(
                                        '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                                    var body = {
                                      "AdminLoginId": "${AdminLogin_Id}",
                                      "DeviceId": value.toString(),
                                    };
                                    print(
                                        "userrrtokenupdateeeddbeforetttt${body}");
                                    http.Response r = await http.post(
                                      Uri.parse(
                                          'http://admin.ambrd.in/api/CommonApi/UpdateDeviceId'),
                                      body: body,
                                    );

                                    print(r.body);
                                    if (r.statusCode == 200) {
                                      print("userrrtokenupdateeedd111${body}");
                                      return r;
                                    } else if (r.statusCode == 401) {
                                      Get.snackbar('message', r.body);
                                    } else {
                                      Get.snackbar('Error', r.body);
                                      return r;
                                    }

                                    ///todo end post api from backend...
                                  });
                                });
                              },

                              ///.....
                              border: Border.all(
                                color: Colors.black,
                                width: 3,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Request All",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        ///request all driver bhaiya.....suggession...
                        // Positioned(
                        //   top: size.height * 0.066,
                        //   //bottom: size.height * 0.64,
                        //   //left: -30,
                        //   left: size.width * 0.3,
                        //
                        //   ///todo: all booking driver...
                        //   child: Padding(
                        //     padding: EdgeInsets.all(2.0),
                        //     child: InkWell(
                        //         onTap: () async {
                        //           widget.driverlist?.message?.forEach((element) {
                        //             ///.......
                        //             print('princee notification');
                        //             notificationServices
                        //                 .getDeviceToken()
                        //                 .then((value) async {
                        //               var data = {
                        //                 //this the particular device id.....
                        //                 'to':
                        //                     // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                        //                     //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
                        //                     //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                        //
                        //                     ///todo device token......
                        //                     // "${widget.driverlist?.message?[0].deviceId}"
                        //                     "${element.deviceId}".toString(),
                        //
                        //                 ///
                        //                 //
                        //                 //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                        //                 //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                        //                 //.toString(),
                        //
                        //                 ///this is same device token....
                        //                 //value
                        //                 //.toString(),
                        //                 'notification': {
                        //                   'title': 'Ps_Wellness',
                        //                   'body':
                        //                       'You have request for ambulance',
                        //                   //"sound": "jetsons_doorbell.mp3"
                        //                 },
                        //                 'android': {
                        //                   'notification': {
                        //                     'notification_count': 23,
                        //                   },
                        //                 },
                        //                 'data': {
                        //                   'type': 'msj',
                        //                   'id': '123456',
                        //                 }
                        //               };
                        //
                        //               await http.post(
                        //                   Uri.parse(
                        //                       'https://fcm.googleapis.com/fcm/send'),
                        //                   body: jsonEncode(data),
                        //                   headers: {
                        //                     'Content-Type':
                        //                         'application/json; charset=UTF-8',
                        //                     'Authorization':
                        //                         //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                        //                         'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                        //                   }).then((value) {
                        //                 if (kDebugMode) {
                        //                   print(value.body.toString());
                        //                 }
                        //               }).onError((error, stackTrace) {
                        //                 if (kDebugMode) {
                        //                   print(error);
                        //                 }
                        //               });
                        //
                        //               ///todo: from here custom from backend start...
                        //               var prefs = GetStorage();
                        //               PatientRegNo =
                        //                   prefs.read("PatientRegNo").toString();
                        //               print(
                        //                   '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                        //               var body = {
                        //                 "UserId": "${PatientRegNo}",
                        //                 "DeviceId": value.toString(),
                        //               };
                        //               print(
                        //                   "userrrtokenupdateeeddbeforetttt${body}");
                        //               http.Response r = await http.post(
                        //                 Uri.parse(
                        //                     'http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
                        //                 body: body,
                        //               );
                        //
                        //               print(r.body);
                        //               if (r.statusCode == 200) {
                        //                 print("userrrtokenupdateeedd111${body}");
                        //                 return r;
                        //               } else if (r.statusCode == 401) {
                        //                 Get.snackbar('message', r.body);
                        //               } else {
                        //                 Get.snackbar('Error', r.body);
                        //                 return r;
                        //               }
                        //
                        //               ///todo end post api from backend...
                        //             });
                        //           });
                        //         },
                        //         child: Icon(Icons.select_all)),
                        //     // Container(
                        //     //   height: size.height * 0.20,
                        //     //   width: size.width * 0.5,
                        //     //   decoration: BoxDecoration(
                        //     //     //color: Colors.,
                        //     //       borderRadius: BorderRadius.only(
                        //     //         topRight: Radius.circular(20),
                        //     //       ),
                        //     //       image: DecorationImage(
                        //     //           image: AssetImage(
                        //     //             'lib/assets/image/psambulance.png',
                        //     //           ),
                        //     //           fit: BoxFit.cover)),
                        //     // ),
                        //   ),
                        // ),
                        ///end.....
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.03,
                                  vertical: size.height * 0.01),
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
                                        color: MyTheme.ambapp2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Text(
                                    'Available Driver\'s',
                                    style: GoogleFonts.alatsi(
                                        fontSize: size.height * 0.022,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff023382)),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: 4, right: 0),
                                      child: InkWell(
                                        onTap: () async {
                                          _driverAcceptlistController
                                              .driveracceptuserDetailApi();
                                          _driverAcceptlistController.update();
                                          accountService.getAccountData
                                              .then((accountData) {
                                            // CallLoader.loader();
                                            // nearlistdriverApi();

                                            Timer(
                                              const Duration(microseconds: 300),
                                              () {
                                                // nearlistdriverApi();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MessageScreen5(
                                                              id: "12345678",
                                                            )));
                                                // Get.to(MessageScreen(
                                                //   id: message.data['id'],
                                                // ));
                                                //Get.to((MapView));
                                                //postAmbulancerequestApi(markers);

                                                ///
                                              },
                                            );
                                            CallLoader.hideLoader();
                                          });
                                        },
                                        child: Icon(
                                          Icons.notifications_active_rounded,
                                          size: size.height * 0.04,
                                          color: MyTheme.ambapp2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.085,
                            ),

                            Expanded(
                              child: SizedBox(
                                  //height: size.height * 0.76,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          widget.driverlist?.message?.length
                                      //.driverlist?.message?.length,
                                      ,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        alldevicetoken =
                                            "${widget.driverlist?.message?[index].deviceId.toString()}";
                                        // DateTime? now =
                                        //     _driverPayoutHistoryController
                                        //         .foundpayoutdriver?[index]
                                        //         .joiningDate;
                                        // String Date = DateFormat('dd-MM-yyyy')
                                        //     .format(now!);
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.03,
                                              vertical: size.height * 0.0005),
                                          child: Container(
                                            height: size.height * 0.2,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 30 / 5),
                                            decoration: BoxDecoration(
                                              color: MyTheme.ambapp6,
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
                                                  // color: Colors.grey.shade100,

                                                  // color: darkShadow1,
                                                ),
                                                BoxShadow(
                                                  offset: Offset(0, 0),
                                                  spreadRadius: 0,
                                                  blurRadius: 0,
                                                  //color: Colors.grey.shade200,
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
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        MyTheme.ambapp13,
                                                        MyTheme.ambapp6,

                                                        //Colors.blue,
                                                        //Color(0xffF0F3F8),
                                                        // Color(0xffF0F3F8)
                                                        //darkPrimary,
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(2, 2),
                                                      spreadRadius: 1,
                                                      blurRadius: 0,
                                                      color:
                                                          Colors.grey.shade200,
                                                    ),
                                                    BoxShadow(
                                                      offset: Offset(2, 2),
                                                      spreadRadius: 1,
                                                      blurRadius: 3,
                                                      color:
                                                          Colors.grey.shade500,
                                                    ),
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height:
                                                          size.height * 0.08,
                                                      width: size.width * 0.17,
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Image.asset(
                                                        'lib/assets/images/technical-support.png',
                                                        // "lib/assets/image/icons8-hospital-64.png",
                                                      ),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          boxShadow: [
                                                            const BoxShadow(
                                                              color: Color(
                                                                  0xFFBEBEBE),
                                                              offset:
                                                                  Offset(5, 5),
                                                              blurRadius: 10,
                                                              spreadRadius: 1,
                                                            ),
                                                            const BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset: Offset(
                                                                  -5, -5),
                                                              blurRadius: 10,
                                                              spreadRadius: 1,
                                                            ),
                                                          ]),
                                                    ),
                                                    Column(
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
                                                              // "Jugal ji",
                                                              "${widget.driverlist?.message?[index].name}",
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
                                                                    .ambapp2,
                                                              ),
                                                            ),

                                                            ///rating....
                                                            // SizedBox(
                                                            //   width: size.width *
                                                            //       0.01,
                                                            // ),
                                                            // Material(
                                                            //   elevation: 3,
                                                            //   borderRadius:
                                                            //       BorderRadius
                                                            //           .circular(
                                                            //               20),
                                                            //   child: Container(
                                                            //     height:
                                                            //         size.height *
                                                            //             0.024,
                                                            //     width:
                                                            //         size.width *
                                                            //             0.11,
                                                            //     decoration:
                                                            //         BoxDecoration(
                                                            //       color: Color(
                                                            //           0xff12BFC4),
                                                            //       borderRadius:
                                                            //           BorderRadius
                                                            //               .circular(
                                                            //                   20),
                                                            //     ),
                                                            //     child: Padding(
                                                            //       padding:
                                                            //           EdgeInsets
                                                            //               .all(
                                                            //                   2.0),
                                                            //       child: Row(
                                                            //         mainAxisAlignment:
                                                            //             MainAxisAlignment
                                                            //                 .spaceAround,
                                                            //         crossAxisAlignment:
                                                            //             CrossAxisAlignment
                                                            //                 .center,
                                                            //         children: [
                                                            //           Text(
                                                            //             '4.5',
                                                            //             style:
                                                            //                 TextStyle(
                                                            //               color: Colors
                                                            //                   .white,
                                                            //               fontSize:
                                                            //                   size.width *
                                                            //                       0.029,
                                                            //               fontWeight:
                                                            //                   FontWeight.bold,
                                                            //             ),
                                                            //           ),
                                                            //           Icon(
                                                            //             Icons
                                                            //                 .star,
                                                            //             size: size
                                                            //                     .height *
                                                            //                 0.017,
                                                            //             color: Colors
                                                            //                 .yellow,
                                                            //           ),
                                                            //         ],
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: size.height *
                                                              0.02,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Driver Distance :',
                                                              // '\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                              style: GoogleFonts
                                                                  .actor(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03,
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
                                                              width:
                                                                  size.width *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              "${widget.driverlist?.message?[index].km} ",
                                                              // "128 km",
                                                              //'2020 Honda Clive',
                                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                              style: GoogleFonts
                                                                  .aBeeZee(
                                                                fontSize:
                                                                    size.width *
                                                                        0.027,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .grey
                                                                    .shade600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: size.height *
                                                              0.02,
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
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color(
                                                                    0xff12BFC4),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              //"\u{20B9} 2000",
                                                              "${widget.driverlist?.message?[index].totalPrice?.toDouble()}",
                                                              // '121234333377',
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
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: size.height *
                                                              0.02,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'DL NO :',
                                                              //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                              style: GoogleFonts
                                                                  .actor(
                                                                fontSize:
                                                                    size.width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color(
                                                                    0xff12BFC4),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  size.width *
                                                                      0.01,
                                                            ),
                                                            Text(
                                                              //"ewesa344",
                                                              "${widget.driverlist?.message?[index].dl}",
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
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: size.height *
                                                              0.015,
                                                        ),
                                                        Container(
                                                          height: size.height *
                                                              0.035,
                                                          width:
                                                              size.width * 0.17,
                                                          padding:
                                                              EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .red[100],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  offset:
                                                                      Offset(
                                                                          2, 2),
                                                                  blurRadius: 4,
                                                                  spreadRadius:
                                                                      0,
                                                                ),
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .blue,
                                                                  offset:
                                                                      Offset(-2,
                                                                          -2),
                                                                  blurRadius: 4,
                                                                  spreadRadius:
                                                                      0,
                                                                ),
                                                              ]),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        0.0),
                                                                child: Text(
                                                                  '',
                                                                  //'\u{20B9}',
                                                                  //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                                  style:
                                                                      GoogleFonts
                                                                          .actor(
                                                                    fontSize:
                                                                        size.width *
                                                                            0.034,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: Colors
                                                                        .indigo,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    size.width *
                                                                        0.002,
                                                              ),
                                                              Text(
                                                                //"200KM",
                                                                "${widget.driverlist?.message?[index].charge}/Km",

                                                                // '10/km',
                                                                //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize:
                                                                      size.width *
                                                                          0.028,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .red
                                                                      .shade900,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Container(
                                                          height: size.height *
                                                              0.04,
                                                          width:
                                                              size.width * 0.2,
                                                          child: NeoPopButton(
                                                            color: Colors.black,
                                                            bottomShadowColor:
                                                                ColorUtils.getVerticalShadow(Colors
                                                                        .green
                                                                        .shade300)
                                                                    .toColor(),
                                                            rightShadowColor:
                                                                ColorUtils.getHorizontalShadow(Colors
                                                                        .green
                                                                        .shade300)
                                                                    .toColor(),
                                                            //animationDuration: kButtonAnimationDuration,
                                                            depth: kButtonDepth,

                                                            ///.....
                                                            // onTapUp: () async {
                                                            //   SharedPreferences
                                                            //       prefs =
                                                            //       await SharedPreferences
                                                            //           .getInstance();
                                                            //   await prefs.setString(
                                                            //       "startLat5",
                                                            //       "${widget.driverlist?.startLat}");
                                                            //   await prefs.setString(
                                                            //       "startLong5",
                                                            //       "${widget.driverlist?.startLong}");
                                                            //   await prefs.setString(
                                                            //       "endLat5",
                                                            //       "${widget.driverlist?.endLat}");
                                                            //   await prefs.setString(
                                                            //       "endLong5",
                                                            //       "${widget.driverlist?.endLong}");
                                                            //   await prefs.setString(
                                                            //       "ambulanceTypeId5",
                                                            //       "${widget.driverlist?.ambulanceTypeId}");
                                                            //
                                                            //   await prefs.setString(
                                                            //       "driverId",
                                                            //       "${widget.driverlist?.message?[index].driverId}");
                                                            //
                                                            //   ///DriverId
                                                            //
                                                            //   await Future.delayed(
                                                            //       Duration(
                                                            //           seconds:
                                                            //               1));
                                                            //
                                                            //   //widget.driverlist?.
                                                            //   ///....start...this is not neswssary i thik i am removing....11 dec 2023
                                                            //   ///await _ambulancegetController
                                                            //   ///.postRequestIndividualApi();
                                                            //
                                                            //   ///todo: new.............
                                                            //   //_ambulancegetController
                                                            //   await _ambulancegetController
                                                            //       .postRequestIndividualApi();
                                                            //
                                                            //   ///accept______reject....
                                                            //   // _ambulancegetController
                                                            //   //     .update();
                                                            //   await accountService
                                                            //       .getAccountData
                                                            //       .then(
                                                            //           (accountData) {
                                                            //     // CallLoader
                                                            //     // .loader();
                                                            //     Timer(
                                                            //       const Duration(
                                                            //           milliseconds:
                                                            //               900),
                                                            //       () {
                                                            //         // nearlistdriverApi();
                                                            //         ///
                                                            //         Navigator.push(
                                                            //             context,
                                                            //             MaterialPageRoute(
                                                            //                 builder: (context) =>
                                                            //                     DriverOfferListById()));
                                                            //
                                                            //         ///
                                                            //         // Get.to(MessageScreen(
                                                            //         //   id: message.data['id'],
                                                            //         // ));
                                                            //         //Get.to((MapView));
                                                            //         //postAmbulancerequestApi(markers);
                                                            //
                                                            //         ///
                                                            //       },
                                                            //     );
                                                            //     CallLoader
                                                            //         .hideLoader();
                                                            //   });
                                                            //
                                                            //   ///
                                                            //   prefs.setString(
                                                            //       "driverlistssId",
                                                            //       "${widget.driverlist?.message?[index].driverId.toString()}");
                                                            //
                                                            //   prefs.setString(
                                                            //       "drivertotalamount",
                                                            //       "${widget.driverlist?.message?[index].totalPrice.toString()}");
                                                            //   prefs.setString(
                                                            //       "driverlistbookingId",
                                                            //       "${widget.driverlist?.message?[index].id.toString()}");
                                                            //   print(
                                                            //       "okolllllidd${widget.driverlist?.message?[index].id.toString()}");
                                                            //   prefs.setString(
                                                            //       "lng1",
                                                            //       "${widget.driverlist?.startLong.toString()}");
                                                            //   prefs.setString(
                                                            //       "lat1",
                                                            //       "${widget.driverlist?.startLat.toString()}");
                                                            //
                                                            //   prefs.setString(
                                                            //       "lng2",
                                                            //       "${widget.driverlist?.endLong.toString()}");
                                                            //   prefs.setString(
                                                            //       "lat2",
                                                            //       "${widget.driverlist?.endLat.toString()}");
                                                            //   prefs.setString(
                                                            //       "ambulance1",
                                                            //       "${widget.driverlist?.ambulanceTypeId.toString()}");
                                                            //   prefs.setString(
                                                            //       "vehicle1",
                                                            //       "${widget.driverlist?.vehicleTypeId.toString()}");
                                                            //
                                                            //   // _ambulancegetController
                                                            //   //.postAmbulancerequestApi2();
                                                            //   print(
                                                            //     "okokotokenww:${widget.driverlist?.message?[index].deviceId}"
                                                            //         .toString(),
                                                            //   );
                                                            //
                                                            //   ///.......
                                                            //   print(
                                                            //       'princee notification');
                                                            //   try {
                                                            //     notificationServices
                                                            //         .getDeviceToken()
                                                            //         .then(
                                                            //             (value) async {
                                                            //       var data = {
                                                            //         //this the particular device id.....
                                                            //         'to': "${widget.driverlist?.message?[index].deviceId}"
                                                            //             .toString(),
                                                            //         // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                                                            //         //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
                                                            //         //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                                                            //
                                                            //         ///todo device token......
                                                            //
                                                            //         //alldevicetoken
                                                            //
                                                            //         // "${widget.driverlist?.message?[index].deviceId}"
                                                            //         //     .toString(),
                                                            //
                                                            //         ///
                                                            //         //
                                                            //         //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                                            //         //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                                            //         //.toString(),
                                                            //
                                                            //         ///this is same device token....
                                                            //         //value
                                                            //         //.toString(),
                                                            //         'notification':
                                                            //             {
                                                            //           'title':
                                                            //               'Ambrd User',
                                                            //           'body':
                                                            //               'You have request for ambulance',
                                                            //           //"sound": "jetsons_doorbell.mp3"
                                                            //         },
                                                            //         'android': {
                                                            //           'notification':
                                                            //               {
                                                            //             'notification_count':
                                                            //                 23,
                                                            //           },
                                                            //         },
                                                            //         'data': {
                                                            //           'type':
                                                            //               'msj',
                                                            //           'id':
                                                            //               '123456'
                                                            //         }
                                                            //       };
                                                            //
                                                            //       await http.post(
                                                            //           Uri.parse(
                                                            //               'https://fcm.googleapis.com/fcm/send'),
                                                            //           body: jsonEncode(
                                                            //               data),
                                                            //           headers: {
                                                            //             'Content-Type':
                                                            //                 'application/json; charset=UTF-8',
                                                            //             'Authorization':
                                                            //                 'key=AAAAbao_0RU:APA91bHpyO-8c4J99Om_QhpWFt4H12OqtuPQaBYopza-hFkcsmIrBSYzUUmlLBwiBxprS1zih61UVRYarHFYjeppTBmIlwQZ6DQp54XTufeTKGyRyeVFHJMWHPWkPYoGe6ZvgrCr4YZK'
                                                            //             //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                            //             //'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
                                                            //           }).then(
                                                            //           (value) {
                                                            //         if (kDebugMode) {
                                                            //           print(
                                                            //               "bookdriver${value.body.toString()}");
                                                            //         }
                                                            //       }).onError((error,
                                                            //           stackTrace) {
                                                            //         if (kDebugMode) {
                                                            //           print(
                                                            //               error);
                                                            //         }
                                                            //       });
                                                            //
                                                            //       ///todo: from here custom from backend start...
                                                            //       var prefs =
                                                            //           GetStorage();
                                                            //       AdminLogin_Id = prefs
                                                            //           .read(
                                                            //               "AdminLogin_Id")
                                                            //           .toString();
                                                            //       print(
                                                            //           '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                                                            //       var body = {
                                                            //         "AdminLoginId":
                                                            //             "${AdminLogin_Id}",
                                                            //         "DeviceId":
                                                            //             value
                                                            //                 .toString(),
                                                            //       };
                                                            //       print(
                                                            //           "userrrtokenupdateeeddbeforetttt${body}");
                                                            //       http.Response
                                                            //           r =
                                                            //           await http
                                                            //               .post(
                                                            //         Uri.parse(
                                                            //             'http://admin.ambrd.in/api/CommonApi/UpdateDeviceId'),
                                                            //         body: body,
                                                            //       );
                                                            //
                                                            //       print(r.body);
                                                            //       if (r.statusCode ==
                                                            //           200) {
                                                            //         print(
                                                            //             "userrrtokenupdateeedd99999${body}");
                                                            //         return r;
                                                            //       } else if (r
                                                            //               .statusCode ==
                                                            //           401) {
                                                            //         // Get.snackbar(
                                                            //         //     'message',
                                                            //         //     r.body);
                                                            //       } else {
                                                            //         // Get.snackbar(
                                                            //         //     'Error',
                                                            //         //     r.body);
                                                            //         return r;
                                                            //       }
                                                            //
                                                            //       ///todo end post api from backend..
                                                            //       ///
                                                            //       ///call message 2 screen....from book driver....21 july..
                                                            //       ///todo:api....accept reject.........22 sep.......kumar prince...............
                                                            //
                                                            //       _driverAcceptlistController
                                                            //           .driveracceptuserDetailApi();
                                                            //
                                                            //       ///todo:api...end .accept reject.........22 sep.......kumar prince...............
                                                            //
                                                            //       _driverAcceptlistController
                                                            //           .update();
                                                            //       accountService
                                                            //           .getAccountData
                                                            //           .then(
                                                            //               (accountData) {
                                                            //         // CallLoader.loader();
                                                            //         // nearlistdriverApi();
                                                            //
                                                            //         // Timer(
                                                            //         //   const Duration(
                                                            //         //       seconds:
                                                            //         //           2),
                                                            //         //   () {
                                                            //         //     // nearlistdriverApi();
                                                            //         //     Navigator.push(
                                                            //         //         context,
                                                            //         //         MaterialPageRoute(
                                                            //         //             builder: (context) => MessageScreen2(
                                                            //         //                   id: "12345678",
                                                            //         //                 )));
                                                            //         //     // Get.to(MessageScreen(
                                                            //         //     //   id: message.data['id'],
                                                            //         //     // ));
                                                            //         //     //Get.to((MapView));
                                                            //         //     //postAmbulancerequestApi(markers);
                                                            //         //
                                                            //         //     ///
                                                            //         //   },
                                                            //         // );
                                                            //         // CallLoader
                                                            //         //     .hideLoader();
                                                            //       });
                                                            //     });
                                                            //   } catch (e, s) {
                                                            //     print(s);
                                                            //   }
                                                            // },
                                                            ///
                                                            onTapUp: () async {
                                                              SharedPreferences
                                                                  prefs =
                                                                  await SharedPreferences
                                                                      .getInstance();
                                                              await prefs.setString(
                                                                  "driverId",
                                                                  "${widget.driverlist?.message?[index].driverId}");
                                                              await prefs.setString(
                                                                  "startLat5",
                                                                  "${widget.driverlist?.startLat}");
                                                              await prefs.setString(
                                                                  "startLong5",
                                                                  "${widget.driverlist?.startLong}");
                                                              await prefs.setString(
                                                                  "endLat5",
                                                                  "${widget.driverlist?.endLat}");
                                                              await prefs.setString(
                                                                  "endLong5",
                                                                  "${widget.driverlist?.endLong}");
                                                              await prefs.setString(
                                                                  "ambulanceTypeId5",
                                                                  "${widget.driverlist?.ambulanceTypeId}");

                                                              await Future.delayed(
                                                                  Duration(
                                                                      seconds:
                                                                          1));

                                                              ///
                                                              await _ambulancegetController
                                                                  .postRequestIndividualApi();
                                                              // _driverAcceptlistController
                                                              //.driveracceptuserDetailApi();

                                                              ///accept______reject....
                                                              accountService
                                                                  .getAccountData
                                                                  .then(
                                                                      (accountData) {
                                                                //CallLoader
                                                                // .loader();
                                                                Timer(
                                                                  const Duration(
                                                                      milliseconds:
                                                                          900),
                                                                  () {
                                                                    // nearlistdriverApi();
                                                                    // Navigator.push(
                                                                    //     context,
                                                                    //     MaterialPageRoute(
                                                                    //         builder: (context) =>
                                                                    //             UserHomePage()));
                                                                    ///
                                                                    // Get.to(MessageScreen(
                                                                    //   id: message.data['id'],
                                                                    // ));
                                                                    //Get.to((MapView));
                                                                    //postAmbulancerequestApi(markers);
                                                                    ///
                                                                  },
                                                                );
                                                                CallLoader
                                                                    .hideLoader();
                                                              });

                                                              ///
                                                              prefs.setString(
                                                                  "driverlistssId",
                                                                  "${widget.driverlist?.message?[index].driverId.toString()}");

                                                              prefs.setString(
                                                                  "drivertotalamount",
                                                                  "${widget.driverlist?.message?[index].totalPrice.toString()}");
                                                              prefs.setString(
                                                                  "driverlistbookingId",
                                                                  "${widget.driverlist?.message?[index].id.toString()}");
                                                              print(
                                                                  "okolllllidd${widget.driverlist?.message?[index].id.toString()}");
                                                              prefs.setString(
                                                                  "lng1",
                                                                  "${widget.driverlist?.startLong.toString()}");
                                                              prefs.setString(
                                                                  "lat1",
                                                                  "${widget.driverlist?.startLat.toString()}");

                                                              prefs.setString(
                                                                  "lng2",
                                                                  "${widget.driverlist?.endLong.toString()}");
                                                              prefs.setString(
                                                                  "lat2",
                                                                  "${widget.driverlist?.endLat.toString()}");
                                                              prefs.setString(
                                                                  "ambulance1",
                                                                  "${widget.driverlist?.ambulanceTypeId.toString()}");
                                                              prefs.setString(
                                                                  "vehicle1",
                                                                  "${widget.driverlist?.vehicleTypeId.toString()}");

                                                              print(
                                                                "okokotokenwwscsd:${widget.driverlist?.message?[index].deviceId}"
                                                                    .toString(),
                                                              );

                                                              ///.......
                                                              print(
                                                                  'princee notificationplplp');
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
                                                                        "${widget.driverlist?.message?[index].deviceId}"
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
                                                                          'You have request for ambulance',
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
                                                                          'msj',
                                                                      'id':
                                                                          '123456'
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
                                                                  ///todo:api....accept reject.........22 sep.......kumar prince...............

                                                                  // _driverAcceptlistController
                                                                  //     .driveracceptuserDetailApi();
                                                                  ///todo:api...end .accept reject.........22 sep.......kumar prince...............

                                                                  _driverAcceptlistController
                                                                      .update();
                                                                  accountService
                                                                      .getAccountData
                                                                      .then(
                                                                          (accountData) {
                                                                    // CallLoader.loader();
                                                                    // nearlistdriverApi();

                                                                    // Timer(
                                                                    //   const Duration(
                                                                    //       seconds:
                                                                    //           2),
                                                                    //   () {
                                                                    //     // nearlistdriverApi();
                                                                    //     Navigator.push(
                                                                    //         context,
                                                                    //         MaterialPageRoute(
                                                                    //             builder: (context) => MessageScreen2(
                                                                    //                   id: "12345678",
                                                                    //                 )));
                                                                    //     // Get.to(MessageScreen(
                                                                    //     //   id: message.data['id'],
                                                                    //     // ));
                                                                    //     //Get.to((MapView));
                                                                    //     //postAmbulancerequestApi(markers);
                                                                    //
                                                                    //     ///
                                                                    //   },
                                                                    // );
                                                                    // CallLoader
                                                                    //     .hideLoader();
                                                                  });
                                                                });
                                                              } catch (e, s) {
                                                                print(s);
                                                              }
                                                            },
                                                            border: Border.all(
                                                              color: Colors
                                                                  .black87,
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
                                                                  Text(
                                                                      "Book Driver",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),

                                                        ///

                                                        ///
                                                        // Container(
                                                        //   height: size.height *
                                                        //       0.04,
                                                        //   width:
                                                        //       size.width * 0.22,
                                                        //   padding:
                                                        //       EdgeInsets.all(8),
                                                        //   decoration:
                                                        //       BoxDecoration(
                                                        //           // color: Colors
                                                        //           //     .orange
                                                        //           //     .shade500,
                                                        //           gradient: MyTheme
                                                        //               .gradient35,
                                                        //           borderRadius:
                                                        //               BorderRadius
                                                        //                   .circular(
                                                        //                       8),
                                                        //           boxShadow: const [
                                                        //         BoxShadow(
                                                        //           color: Color(
                                                        //               0xFFBEBEBE),
                                                        //           offset:
                                                        //               Offset(
                                                        //                   5, 5),
                                                        //           blurRadius:
                                                        //               10,
                                                        //           spreadRadius:
                                                        //               1,
                                                        //         ),
                                                        //         BoxShadow(
                                                        //           color: Colors
                                                        //               .white,
                                                        //           offset:
                                                        //               Offset(-5,
                                                        //                   -5),
                                                        //           blurRadius:
                                                        //               10,
                                                        //           spreadRadius:
                                                        //               1,
                                                        //         ),
                                                        //       ]),
                                                        //   child: Center(
                                                        //     child: Text(
                                                        //       'BOOK DRIVER',
                                                        //       //'\u{20B9}${_driverPayoutHistoryController.foundpayoutdriver?[index].paidAmount}',
                                                        //       style: GoogleFonts
                                                        //           .alatsi(
                                                        //         fontSize:
                                                        //             size.width *
                                                        //                 0.027,
                                                        //         fontWeight:
                                                        //             FontWeight
                                                        //                 .w700,
                                                        //         color: Colors
                                                        //             .black87,
                                                        //       ),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                            ),
                            //)
                          ],
                        ),

                        ///offer price...
                        Positioned(
                          bottom: size.height * 0.04,
                          left: size.height * 0.00,
                          right: size.width * 0,
                          child: Container(
                            // height: size.height * 0.23,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                            ),
                            child: Column(
                              children: [
                                ///.....todo:......................
                                Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: TextFormField(
                                    //key: _offeruserController
                                    //.Chooseambulancevehicleofferkey,
                                    controller:
                                        _offeruserController.offercontroller2,
                                    //controller.emailController,
                                    obscureText: false,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      return _offeruserController
                                          .validClinicname(value!);
                                    },
                                    decoration: InputDecoration(
                                      //border: InputBorder.none,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 14.0, bottom: 8.0, top: 13.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(15.7),
                                      ),

                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.currency_rupee,
                                          color: MyTheme.ambapp1,
                                        ),
                                        // Image.asset(
                                        //   "lib/assets/images/pnone4.png",
                                        //   color: MyTheme.ambapp1,
                                        //   height: 10,
                                        //   width: 10,
                                        // ),
                                      ),
                                      fillColor: MyTheme.ambapp12,
                                      filled: true,
                                      suffixIcon: null ?? const SizedBox(),
                                      hintText: "Offer Your Fare",
                                      hintStyle: GoogleFonts.poppins(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // contentPadding:
                                      //const EdgeInsets.only(top: 16.0),
                                    ),
                                  ),
                                ),

                                // SizedBox(
                                //   height: size.height * 0.002,
                                // ),
                                //
                                // PhysicalModel(
                                //   color: Colors.grey.shade300,
                                //   elevation: 2,
                                //   shadowColor: Colors.grey.shade900,
                                //   borderRadius: BorderRadius.circular(10),
                                //   child: Padding(
                                //     padding: EdgeInsets.all(1.0),
                                //     child: InkWell(
                                //       onTap: () {
                                //         // _ambulancegetController.update();
                                //         // _ambulancegetController.ambulancecatagaryyApi();
                                //         // CallLoader.loader();
                                //         _ambulancegetController
                                //             .googlerequestambulance(markers);
                                //
                                //         //Driver_List_LocationId
                                //         //Get.to(Driver_List_LocationId());
                                //         //BookingdriverList
                                //         //BookingdriverList
                                //         Get.to(DriverListById());
                                //
                                //         /// Get.to(Driver_List_LocationId());
                                //
                                //         ///todo: user device token saved..........
                                //
                                //         //_devicetokenController.UsertokenApi();
                                //
                                //         // _ambulancegetController
                                //         //  .googlerequestambulance(markers);
                                //       },
                                //       child: Container(
                                //         height: size.height * 0.045,
                                //         width: size.width * 0.6,
                                //         decoration: BoxDecoration(
                                //           color: Colors.indigo,
                                //           borderRadius: BorderRadius.circular(10),
                                //         ),
                                //         child: Padding(
                                //           padding: EdgeInsets.symmetric(
                                //               horizontal: size.width * 0.01),
                                //           child: Center(
                                //               child: Text(
                                //             'Send Request',
                                //             style: TextStyle(
                                //               fontSize: size.height * 0.02,
                                //               fontWeight: FontWeight.bold,
                                //               color: Colors.white,
                                //             ),
                                //           )),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                SizedBox(
                                  height: size.height * 0.002,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.15),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                        width: context.width),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                MyTheme.ambapp1),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(14)),
                                      ),
                                      child: Text(
                                        "Requested Offer",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                      onPressed: () async {
                                        widget.driverlist?.message
                                            ?.forEach((element) {
                                          ///....start...this is not neswssary i thik i am removing....11 dec 2023
                                          // _ambulancegetController
                                          // .postAmbulancerequestApi2();

                                          ///..end.....this is not neswssary i thik i am removing....11 dec 2023
                                          print('princee notification');
                                          notificationServices
                                              .getDeviceToken()
                                              .then((value) async {
                                            var data = {
                                              //this the particular device id.....
                                              'to':
                                                  // 'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',
                                                  //'caK4UmMZQ2qfntD6ojs3n-:APA91bE6hmA3i8mG2H0x4v4Sd3cyG6DyEcyL34NHj-y4L6tWzbgWqC0JvOd8H3rsGaHb7pL547UjZEQAKXG4OD1imPaUTHVFvW0zZUFG3sxYVFkrbqnJDGOF7_Zog49MpbgFdX71ukHQ',
                                                  //'dGfwUGj3SHqXCbyphoJCx5:APA91bH95Ml3sUBeWocVR2zlX1gTsnaVxcdjmfV732J6npvq_itlQKGkMiWDG-ndQfFMP4E7a-E1rWeQrFoEGGAB4Jb3fKe4Ow5VQfEnyikJNOeJY2xpQ2cxQwxVIUY_4gOj-Exja5MZ',

                                                  ///todo device token......
                                                  // "${widget.driverlist?.message?[0].deviceId}"
                                                  "${element.deviceId}"
                                                      .toString(),

                                              ///
                                              //
                                              //'mytokeneOs6od2nTlqsaFZl8-6ckc:APA91bHzcTpftAHsg7obx0CqhrgY1dyTlSwB5fxeUiBvGtAzX_us6iT6Xp-vXA8rIURK45EehE25_uKiE5wRIUKCF-8Ck-UKir96zS-PGRrpxxOkwPPUKS4M5Em2ql1GmYPY9FVOC4FC'
                                              //'emW_j62UQnGX04QHLSiufM:APA91bHu2uM9C7g9QEc3io7yTVMqdNpdQE3n6vNmFwcKN6z-wq5U9S7Nyl79xJzP_Z-Ve9kjGIzMf4nnaNwSrz94Rcel0-4em9C_r7LvtmCBOWzU-VyPclHXdqyBc3Nrq7JROBqUUge9'
                                              //.toString(),

                                              ///this is same device token....
                                              //value
                                              //.toString(),
                                              'notification': {
                                                'title': 'Ambrd User',
                                                'body':
                                                    'You have request for ambulance',
                                                //"sound": "jetsons_doorbell.mp3"
                                              },
                                              'android': {
                                                'notification': {
                                                  'notification_count': 23,
                                                },
                                              },
                                              'data': {
                                                'type': 'msj',
                                                'id': '123456',
                                              }
                                            };
                                            print("data1${data}");

                                            await http.post(
                                                Uri.parse(
                                                    'https://fcm.googleapis.com/fcm/send'),
                                                body: jsonEncode(data),
                                                headers: {
                                                  'Content-Type':
                                                      'application/json; charset=UTF-8',
                                                  'Authorization':
                                                      //AAAAbao_0RU:APA91bHpyO-8c4J99Om_QhpWFt4H12OqtuPQaBYopza-hFkcsmIrBSYzUUmlLBwiBxprS1zih61UVRYarHFYjeppTBmIlwQZ6DQp54XTufeTKGyRyeVFHJMWHPWkPYoGe6ZvgrCr4YZK
                                                      //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                                                      'key=AAAAbao_0RU:APA91bHpyO-8c4J99Om_QhpWFt4H12OqtuPQaBYopza-hFkcsmIrBSYzUUmlLBwiBxprS1zih61UVRYarHFYjeppTBmIlwQZ6DQp54XTufeTKGyRyeVFHJMWHPWkPYoGe6ZvgrCr4YZK'
                                                }).then((value) {
                                              if (kDebugMode) {
                                                print(
                                                    "bookdriver${value.body.toString()}");
                                              }
                                            }).onError((error, stackTrace) {
                                              if (kDebugMode) {
                                                print(error);
                                              }
                                            });

                                            ///todo: from here custom from backend start...
                                            var prefs = GetStorage();
                                            // PatientRegNo =
                                            // prefs.read("PatientRegNo").toString();

                                            AdminLogin_Id = prefs
                                                .read("AdminLogin_Id")
                                                .toString();
                                            print(
                                                '&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
                                            var body = {
                                              "AdminLoginId":
                                                  "${AdminLogin_Id}",
                                              "DeviceId": value.toString(),
                                            };
                                            print(
                                                "userrrtokenupdateeeddbeforetttt${body}");
                                            http.Response r = await http.post(
                                              Uri.parse(
                                                  'http://admin.ambrd.in/api/CommonApi/UpdateDeviceId'),
                                              body: body,
                                            );

                                            print(r.body);
                                            if (r.statusCode == 200) {
                                              print(
                                                  "userrrtokenupdateeedd111${body}");
                                              return r;
                                            } else if (r.statusCode == 401) {
                                              Get.snackbar('message', r.body);
                                            } else {
                                              Get.snackbar('Error', r.body);
                                              return r;
                                            }

                                            ///todo end post api from backend...
                                          });
                                        });
                                        // CallLoader.loader();
                                        // await Future.delayed(
                                        //     Duration(seconds: 1));
                                        // CallLoader.hideLoader();

                                        ///todo: from here you are calling post offer api....19 dec 2023..

                                        _offeruserController.checkofferuser();
                                        // await _getCurrentLocation();
                                        //CallLoader.loader();

                                        // _ambulancegetController
                                        //.googlerequestambulance(markers);

                                        ///todo: new...
                                        ///
                                        // CallLoader.loader();
                                        // await Future.delayed(
                                        //     Duration(seconds: 10));
                                        // CallLoader.hideLoader();

                                        /// Get.to(DriverOfferListById());

                                        ///await _getCurrentLocation();
                                        //CallLoader.loader();
                                        // _ambulancegetController
                                        //     .googlerequestambulance(markers);

                                        /// Get.to(DriverListById());
                                        ///
                                      },
                                    ),
                                  ),
                                ),

                                // Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              //),
            ),
          ),
        ),
      ),
    );
  }
//DriverListApi
//alldevicetoken
// void devicetoken() {
//   List<String> alldevicetoken = ${widget?.driverlist?.message.toString();};
//   alldevicetoken.forEach((number) {
//     print(number);
//   });
// }
}
