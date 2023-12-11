import 'dart:async';

import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/vehicle_service_catagary_list_controller/vehicle_cat_list_controller.dart';
import 'package:ambrd_appss/modules/booking_brb/booking_ambrd_new_gmap.dart';
import 'package:ambrd_appss/services/acount_service_for_autologin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceVehicleAppcat extends StatelessWidget {
  ServiceVehicleAppcat({Key? key}) : super(key: key);

  VehicleServicecatController _vehicleservicecatController =
      Get.put(VehicleServicecatController());
  final img = 'http://admin.ambrd.in/Images/';

  // final List<String> images = [
  //   "https://images.unsplash.com/photo-1606046604972-77cc76aee944?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aG90ZWxzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
  //   "https://images.unsplash.com/photo-1596436889106-be35e843f974?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGhvdGVsc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60",
  //   "https://images.unsplash.com/photo-1590447158019-883d8d5f8bc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80",
  //   "https://images.unsplash.com/photo-1495365200479-c4ed1d35e1aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  //   "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80",
  //   "https://images.unsplash.com/photo-1445019980597-93fa8acb246c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1748&q=80",
  //   "https://images.unsplash.com/photo-1487017159836-4e23ece2e4cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80",
  // ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _keyuser = GlobalKey();

    Size size = MediaQuery.of(context).size;

    var imgpath = 'http://admin.ambrd.in/Images/';
    //https://new.signatureresorts.in/Images/5f694ead-6b8a-4fbc-90d1-7389f84abb65.jpg

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Ambulance Category',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Obx(
        () => (_vehicleservicecatController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : _vehicleservicecatController
                        .servicecatserviceModel?.vehicles![0].id ==
                    null
                ? Center(
                    child: Text('No Data'),
                  )
                : SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _vehicleservicecatController
                                  .servicecatserviceModel?.vehicles!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final items = _vehicleservicecatController
                                    .servicecatserviceModel?.vehicles!;
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: InkWell(
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setString(
                                          "AmbulancecatserviceId",
                                          "${_vehicleservicecatController.servicecatserviceModel?.vehicles![index].id.toString()}");
                                      //var AmbulancecatserviceId = preferences.getString("AmbulancecatserviceId");
                                      // print("AmbulancecatserviceId: ${AmbulancecatserviceId}");
                                      _vehicleservicecatController.update();
                                      // await accountService.getAccountData
                                      //     .then((accountData) {
                                      //   // CallLoader.loader();
                                      //   // Timer(
                                      //   //   const Duration(seconds: 3),
                                      //   //   () {
                                      //   //     //Get.to(MapView());
                                      //   //     // CallLoader
                                      //   //     //     .hideLoader();
                                      //   //     //_ambulancegetController.selectedvhicleCatagary();
                                      //   //     //_ambulancegetController.ambulancecatagaryyApi();
                                      //   //     //Get.to((MapView));
                                      //   //
                                      //   //     ///
                                      //   //   },
                                      //   // );
                                      //   //CallLoader.hideLoader();
                                      // });
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 1000,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          color: Colors.purple,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '$imgpath${items?[index].vehicleImage}' ??
                                                      ''),
                                              fit: BoxFit.cover,
                                              onError: (error, stackTrace) {
                                                Text("No Image Found");
                                                // .log(error, stackTrace);
                                              })),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: Container(
                                                height: size.height * 0.06,
                                                width: size.width * 0.9,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  border: Border.all(
                                                      color: Colors.red,
                                                      width: 3),
                                                  color: MyTheme.ambapp3,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      '${items?[index].vehicleTypeName.toString()}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              size.height *
                                                                  0.027),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () async {
                                                  SharedPreferences prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  await prefs.setString(
                                                      "AmbulancecatserviceId",
                                                      "${_vehicleservicecatController.servicecatserviceModel?.vehicles![index].id.toString()}");
                                                  //var AmbulancecatserviceId = preferences.getString("AmbulancecatserviceId");
                                                  // print("AmbulancecatserviceId: ${AmbulancecatserviceId}");
                                                  _vehicleservicecatController
                                                      .update();
                                                  await accountService
                                                      .getAccountData
                                                      .then((accountData) {
                                                    // CallLoader.loader();
                                                    Timer(
                                                      const Duration(
                                                          seconds: 3),
                                                      () {
                                                        Get.to(MapView());
                                                        // CallLoader
                                                        //     .hideLoader();
                                                        //_ambulancegetController.selectedvhicleCatagary();
                                                        //_ambulancegetController.ambulancecatagaryyApi();
                                                        //Get.to((MapView));

                                                        ///
                                                      },
                                                    );
                                                    //CallLoader.hideLoader();
                                                  });
                                                },
                                                child: Container(
                                                  width: size.width * 0.35,
                                                  height: size.height * 0.1,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Book Now',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
