import 'dart:async';

import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/driver_lists/driver_listss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

import '../../constants/app_theme/app_color.dart';
import '../../controllers/map_controller/map_controllers.dart';
import '../../controllers/testt.dart';

class BookingAmb extends StatefulWidget {
  BookingAmb({Key? key}) : super(key: key);

  @override
  State<BookingAmb> createState() => _BookingAmbState();
}

NavController _navcontroller = Get.put(NavController(), permanent: true);

class _BookingAmbState extends State<BookingAmb> {
  String googleApikey = "AIzaSyBrbWFXlOYpaq51wteSyFS2UjdMPOWBlQw";
  GoogleMapController? mapController;
  GoogleMapController? mapController2; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Search Start Location";
  String location2 = "Search End Location";

  ///...
  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  ///...
  tilecolorx _tilecolorr = Get.put(tilecolorx());

  //MapViewController _controller = Get.put(MapViewController());

  NavController _navController = Get.put(NavController());

  final List<String> productname = [
    'Invoice',
    'Add Technician',
    'Profile',
    'Complaint List',
    'Customer Support',
    'Add Services',
  ];

  final List<String> _itemsss = ['First', 'Second', 'Third', 'Fourth', 'Fifth'];

  final List<String> _itemsssimage = [
    'lib/assets/images/AMB1.png',
    'lib/assets/images/AMB4.png',
    'lib/assets/images/AMB3.png',
    'lib/assets/images/AMB4.png',
    'lib/assets/images/AMB3.png'
  ];

  ///.........

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    //tilecolorx tcx = get.put(tilecolorx());

    return
        // Scaffold(
        // backgroundColor: MyTheme.ambapp3,
        // body:
        // GoogleMap(
        //   mapType: MapType.hybrid,
        //   initialCameraPosition: _kGooglePlex,
        //   onMapCreated: (GoogleMapController controller) {
        //     _controller.complete(controller);
        //   },
        // ),
        ///..........
        SafeArea(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map......
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
                mapController2 = controller;
              });
            },
          ),
          Positioned(
            bottom: -20,
            left: 0,
            right: 0,
            child:
                // Column(
                //   children: [
                //Spacer(),
                Container(
              height: size.height * 0.33,
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              // width: size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.11,
                    child: ListView.builder(
                      itemCount: _itemsss.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            //..............................
                            _tilecolorr.toggle(index);

                            ///...............................

                            //................................
                          },
                          child: Obx(
                            () => Padding(
                              padding: EdgeInsets.all(8.0),
                              child: PhysicalModel(
                                //color: Colors.white,
                                shadowColor: Colors.red,
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),

                                elevation: 5,
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.19,
                                  decoration: BoxDecoration(
                                      color: _tilecolorr.selectedindex.value ==
                                              index
                                          ? MyTheme.ambapp5
                                          : MyTheme.ambapp1,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color:
                                              _tilecolorr.selectedindex.value ==
                                                      index
                                                  ? MyTheme.ThemeColors
                                                  : MyTheme.ambapp1,
                                          width: 1)),

                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: size.height * 0.065,
                                        decoration: BoxDecoration(
                                            color: _tilecolorr
                                                        .selectedindex.value ==
                                                    index
                                                ? MyTheme.ambapp1
                                                : MyTheme.ambapp11,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  _itemsssimage[index]),
                                            )),
                                      ),
                                      //Spacer(),
                                      Text('${_itemsss[index]}',
                                          style: TextStyle(
                                              color: _tilecolorr.selectedindex
                                                          .value ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: size.height * 0.015,
                                              fontWeight: FontWeight.w600)),
                                      Spacer(),
                                    ],
                                  ),
                                  // ListTile(
                                  //   title: Obx(() => Text('${_itemsss[index]} item',
                                  //       style: TextStyle(
                                  //           color: _tilecolorr.selectedindex.value == index
                                  //               ? Colors.white
                                  //               : Colors.black))),
                                  //   onTap: () => _tilecolorr.toggle(index),
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      // itemBuilder: (BuildContext context, int index) {
                      //
                      // },
                    ),
                  ),
                  //SizedBox(height: height * 0.06),
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: TextFormField(
                      //controller: _loginMobileController.MobileOrEmail,
                      //controller.emailController,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   return _loginMobileController
                      //       .validatePhone(value!);
                      // },
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 13.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(15.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.7),
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
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextFormField(
                      //controller: _loginMobileController.MobileOrEmail,
                      //controller.emailController,
                      obscureText: false,
                      //keyboardType: TextInputType.number,
                      // validator: (value) {
                      //   return _loginMobileController
                      //       .validatePhone(value!);
                      // },
                      decoration: InputDecoration(
                        //border: InputBorder.none,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: Colors.red, width: 1),
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 14.0, bottom: 8.0, top: 13.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(15.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.7),
                        ),

                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.message,
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
                        hintText: "No of passengers",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        // contentPadding:
                        //const EdgeInsets.only(top: 16.0),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.002,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.15),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: context.width),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.ambapp1),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(14)),
                        ),
                        child: Text(
                          "Find Ride",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        onPressed: () {
                          Get.to(DriverListById(
                                  //driverlist: driverListApiFromJson(r.body)
                                  )
                              //BookingdriverList()
                              );
                          // print(
                          // "RadioButton:${_signUpController.selectedService}");
                          //_signUpController.checkLogin();
                          // Get.to(() => LoginPasswordPage());
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
            //   ],
            // ),
          ),
          Positioned(
            top: 25,
            left: 10,
            child: Padding(
              padding: EdgeInsets.only(left: 12, top: 02),
              child: InkWell(
                  onTap: () {
                    // Get.to(BottommNavBar());
                    /// Get.back();
                    _navcontroller.tabindex(0);

                    ///............................
                    //_navController.tabindex(1);

                    ///
                    ///

                    //Get.back();

                    ///todo............................................
                    //
                  },
                  child: Icon(Icons.arrow_back_ios)),
            ),
          ),
          //search autoconplete input
          Positioned(
              //search input bar
              top: 40,
              child: InkWell(
                  onTap: () async {
                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApikey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [Component(Component.country, 'en_IN')],
                        //google_map_webservice package
                        onError: (err) {
                          print(err);
                        });

                    if (place != null) {
                      setState(() {
                        location = place.description.toString();
                      });

                      //form google_maps_webservice package
                      final plist = GoogleMapsPlaces(
                        apiKey: googleApikey,
                        apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                      );
                      String placeid = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeid);
                      final geometry = detail.result.geometry!;
                      final lat = geometry.location.lat;
                      final lang = geometry.location.lng;
                      var newlatlang = LatLng(lat, lang);

                      //move map camera to selected place with animation
                      mapController?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: newlatlang, zoom: 17)));
                      mapController2?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: newlatlang, zoom: 17)));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            title: Text(
                              location,
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Icon(Icons.search),
                            dense: true,
                          )),
                    ),
                  ))),
          Positioned(
              //search input bar
              top: 100,
              child: InkWell(
                  onTap: () async {
                    var place = await PlacesAutocomplete.show(
                        context: context,
                        apiKey: googleApikey,
                        mode: Mode.overlay,
                        types: [],
                        strictbounds: false,
                        components: [Component(Component.country, 'en_IN')],
                        //google_map_webservice package
                        onError: (err) {
                          print(err);
                        });

                    if (place != null) {
                      setState(() {
                        location = place.description.toString();
                      });

                      //form google_maps_webservice package
                      final plist = GoogleMapsPlaces(
                        apiKey: googleApikey,
                        apiHeaders: await GoogleApiHeaders().getHeaders(),
                        //from google_api_headers package
                      );
                      String placeid2 = place.placeId ?? "0";
                      final detail = await plist.getDetailsByPlaceId(placeid2);
                      final geometry2 = detail.result.geometry!;
                      final lat2 = geometry2.location.lat;
                      final lang2 = geometry2.location.lng;
                      var newlatlang = LatLng(lat2, lang2);
                      //move map camera to selected place with animation
                      mapController2?.animateCamera(
                          CameraUpdate.newCameraPosition(
                              CameraPosition(target: newlatlang, zoom: 17)));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListTile(
                            title: Text(
                              location2,
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: Icon(Icons.search),
                            dense: true,
                          )),
                    ),
                  ))),
        ],
      ),
    );

    // Column(
    //   children: [
    //     Spacer(),
    //     SizedBox(
    //       height: size.height * 0.17,
    //       // width: size.width,
    //       child: ListView.builder(
    //         itemCount: _itemsss.length,
    //         scrollDirection: Axis.horizontal,
    //         itemBuilder: (BuildContext context, int index) {
    //           return InkWell(
    //             onTap: () {
    //               _tilecolorr.toggle(index);
    //             },
    //             child: Obx(
    //               () => Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: PhysicalModel(
    //                   //color: Colors.white,
    //                   shadowColor: Colors.red,
    //                   color: Colors.black,
    //                   borderRadius: BorderRadius.circular(10),
    //
    //                   elevation: 80,
    //                   child: Container(
    //                     height: size.height * 0.05,
    //                     width: size.width * 0.295,
    //                     decoration: BoxDecoration(
    //                         color: _tilecolorr.selectedindex.value == index
    //                             ? MyTheme.ambapp5
    //                             : MyTheme.ambapp1,
    //                         borderRadius: BorderRadius.circular(10),
    //                         border: Border.all(
    //                             color:
    //                                 _tilecolorr.selectedindex.value == index
    //                                     ? MyTheme.ThemeColors
    //                                     : MyTheme.ambapp1,
    //                             width: 1)),
    //
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Container(
    //                           height: size.height * 0.12,
    //                           decoration: BoxDecoration(
    //                               color: _tilecolorr.selectedindex.value ==
    //                                       index
    //                                   ? MyTheme.ambapp1
    //                                   : MyTheme.ambapp11,
    //                               borderRadius: BorderRadius.circular(10),
    //                               image: DecorationImage(
    //                                 image: AssetImage(_itemsssimage[index]),
    //                               )),
    //                         ),
    //                         Spacer(),
    //                         Text('${_itemsss[index]}',
    //                             style: TextStyle(
    //                                 color:
    //                                     _tilecolorr.selectedindex.value ==
    //                                             index
    //                                         ? Colors.white
    //                                         : Colors.black,
    //                                 fontSize: size.height * 0.015,
    //                                 fontWeight: FontWeight.w600)),
    //                         Spacer(),
    //                       ],
    //                     ),
    //                     // ListTile(
    //                     //   title: Obx(() => Text('${_itemsss[index]} item',
    //                     //       style: TextStyle(
    //                     //           color: _tilecolorr.selectedindex.value == index
    //                     //               ? Colors.white
    //                     //               : Colors.black))),
    //                     //   onTap: () => _tilecolorr.toggle(index),
    //                     // ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         },
    //         // itemBuilder: (BuildContext context, int index) {
    //         //
    //         // },
    //       ),
    //     ),
    //   ],
    // ),
    ///
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           getUserCurrentLocation().then((value) async {
//             print(value.latitude.toString() + " " + value.longitude.toString());
//
//             // marker added for current users location
//             _markers.add(Marker(
//               markerId: MarkerId("2"),
//               position: LatLng(value.latitude, value.longitude),
//               infoWindow: InfoWindow(
//                 title: 'My Current Location',
//               ),
//             ));
//
//             // specified current users location
//             CameraPosition cameraPosition = new CameraPosition(
//               target: LatLng(value.latitude, value.longitude),
//               zoom: 14,
//             );
//
//             final GoogleMapController controller = await _controller.future;
//             controller
//                 .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//             setState(() {});
//           });
//         },
//         child: Icon(Icons.local_activity),
//       ),
    ///
    // );
  }

  getMarkers() {
    // Add this line. Create map view controller object
    final MapViewController _controller = Get.find(); // <======= Add
    //get markers from controller
    // var realdata = mapcontroller.realtimeList;

    // realdata.asMap().forEach((key, value) {
    //   var _marker = Marker(
    //       consumeTapEvents: true,
    //       markerId: MarkerId(key.toString()),
    //       position: LatLng(
    //           double.parse(value.latitude), double.parse(value.longitude)),
    //       onTap: () {
    //         //do something here
    //       });
    //
    //   _controller.allMarkers.add(_marker); // <===== Update
    //   _controller.update() // <=== Add, because you are using GetBuilder
    // });
  }
}
