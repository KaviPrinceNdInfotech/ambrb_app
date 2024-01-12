import 'dart:async';
import 'dart:math';

import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/all_token_controllers/device_token_controller.dart';
import 'package:ambrd_appss/controllers/testt.dart';
import 'package:ambrd_appss/modules/booking_brb/booking_apbrd_map_new_controller.dart';
import 'package:ambrd_appss/modules/booking_brb/secret_key.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

var items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];

tilecolorx _tilecolorr = Get.put(tilecolorx());

final List<String> _itemsss = ['Swift', 'Aura', 'Scorpio', 'Bolero', 'Nexon'];

final List<String> _itemsssimage = [
  'lib/assets/images/AMB1.png',
  'lib/assets/images/AMB4.png',
  'lib/assets/images/AMB3.png',
  'lib/assets/images/AMB4.png',
  'lib/assets/images/AMB3.png'
];

class _MapViewState extends State<MapView> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();
  AmbulancegetsController _ambulancegetController =
      Get.put(AmbulancegetsController());

  DevicetokenController _devicetokenController =
      Get.put(DevicetokenController());

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String? _placeDistance;

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  //late GoogleMapController mapController = Get.put(GoogleMapController());
  //final MapController _mapControllers = Get.put(MapController());

  late GoogleMapController mapController;

  //Get.lazyPut(() => GoogleMapController());
  //late GoogleMapController mapController;

  late Position _currentPosition;
  String _currentAddress = '';

  Widget _textField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required double width,
    required Icon prefixIcon,
    Widget? suffixIcon,
    required Function(String) locationCallback,
  }) {
    //Size size = MediaQuery.of(context).size;
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: MyTheme.ambapp12,

          ///  fillColor: Colors.white,...............
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.blue.shade300,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  //TODO: handle permission.....from device location....start...

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  //TODO: handle permission.....from device location....end..

  // Method for retrieving the current location
  _getCurrentLocation() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      // _getAddressFromLatLng(_currentPosition!);

      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places

  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(_startAddress);
      List<Location> destinationPlacemark =
          await locationFromAddress(_destinationAddress);

      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      //
      double startLatitude = _startAddress == _currentAddress
          ? _currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = _startAddress == _currentAddress
          ? _currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: _startAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );
      // Calculating the distance between the start and the end positions
      // with a straight path, without considering any route
      // double distanceInMeters = await Geolocator.bearingBetween(
      //   startLatitude,
      //   startLongitude,
      //   destinationLatitude,
      //   destinationLongitude,
      // );
      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        _placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $_placeDistance km');

        ///todo: user token......
        _devicetokenController.UsertokenApi();
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places

  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    //_devicetokenController.UsertokenApi();

    super.initState();
  }

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  double mapbottompadding = 0;

  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  late Position currentpositon;
  var geolocator = Geolocator();

  void locatepostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentpositon = position; // this is line 26, it is point before await

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  static final CameraPosition googlepostion =
      CameraPosition(target: LatLng(37.4249, -122.0657));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Form(
      key: _ambulancegetController.Chooseambulancevehicletypekey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: SizedBox(
            height: height,
            width: width,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: MyTheme.ambapp,
                centerTitle: true,
                title: Text('Places'),
                leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios_outlined)),
              ),
              key: _scaffoldKey,
              body: Stack(
                children: <Widget>[
                  // Map View
                  GoogleMap(
                    markers: Set<Marker>.from(markers),
                    initialCameraPosition: _initialLocation,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    polylines: Set<Polyline>.of(polylines.values),

                    ///todo: here async await in this function.............18dec 2023...
                    onMapCreated: (GoogleMapController controller) async {
                      mapController = controller;
                      newGoogleMapController = controller;
                      // CallLoader.loader();
                      await Future.delayed(Duration(milliseconds: 200));
                      //CallLoader.hideLoader();

                      ///todo:..........................

                      await _getCurrentLocation();

                      ///todo:..........................
                    },
                  ),
                  // Positioned(
                  //   top: size.height*0.03,
                  //   left:size.width*0.05,
                  //   child: InkWell(
                  //     onTap: () {
                  //       //Get.back();
                  //     },
                  //     child: Container(
                  //       height: size.height*0.035,
                  //       width: size.width*0.065,
                  //       decoration: BoxDecoration(
                  //         color: Colors.grey.shade300,
                  //         shape: BoxShape.circle,
                  //       ),
                  //         child: InkWell(
                  //           onTap: () {
                  //             Navigator.pop(context);
                  //           },
                  //             child: Icon(Icons.arrow_back_ios_new_outlined))),
                  //   ),
                  // ),
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
                          ///.......selected....ambulance catagary....
                          // Padding(
                          //   padding: const EdgeInsets.all(3.0),
                          //   child: Container(
                          //     height: size.height * 0.05,
                          //     width: size.width,
                          //     decoration: BoxDecoration(
                          //       color: MyTheme.ambapp12,
                          //       borderRadius: BorderRadius.circular(15),
                          //     ),
                          //     child: Padding(
                          //       padding: EdgeInsets.symmetric(
                          //           horizontal: size.width * 0.00),
                          //       child: Obx(
                          //         () => DropdownButtonFormField<Vehicle>(
                          //             value: _ambulancegetController
                          //                 .selectedambCatagary.value,
                          //             decoration: InputDecoration(
                          //               prefixIcon: Icon(
                          //                 Icons.bus_alert,
                          //                 color: MyTheme.ambapp1,
                          //               ),
                          //               enabledBorder: InputBorder.none,
                          //               border: InputBorder.none,
                          //             ),
                          //             hint: Text('Ambulance Catagary'),
                          //             items: _ambulancegetController
                          //                 .ambulancvecatagarys
                          //                 .map((Vehicle ambulancvecatagarys) {
                          //               return DropdownMenuItem(
                          //                 value: ambulancvecatagarys,
                          //                 child: Text(
                          //                   ambulancvecatagarys.categoryName
                          //                       .toString(),
                          //                   style: TextStyle(
                          //                     fontWeight: FontWeight.w600,
                          //                     fontSize: size.height * 0.012,
                          //                   ),
                          //                 ),
                          //               );
                          //             }).toList(),
                          //             onChanged: (Vehicle? newValue) {
                          //               _ambulancegetController
                          //                   .selectedambCatagary.value = newValue!;
                          //               _ambulancegetController
                          //                   .selectedvhicleCatagary.value = null;
                          //               // _hospital_2_controller.states.value =
                          //               //     newValue! as List<String>;
                          //               // _hospital_2_controller.selectedCity.value = null;
                          //               // _hospital_2_controller.cities.clear();
                          //               // _hospital_2_controller.cities
                          //               //     .addAll(stateCityMap[newvalue]!);
                          //             }),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          //
                          ///.........selected vhicle..by catagary id.....
                          // Padding(
                          //   padding: const EdgeInsets.all(3.0),
                          //   child: Container(
                          //     height: size.height * 0.05,
                          //     width: size.width,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(15),
                          //       color: MyTheme.ambapp12,
                          //     ),
                          //     child: Padding(
                          //       padding: EdgeInsets.symmetric(
                          //           horizontal: size.width * 0.0),
                          //       child: Obx(
                          //         () => DropdownButtonFormField<VehicleDetaile>(
                          //             //icon: Icon(Icons.location_city),
                          //             value: _ambulancegetController
                          //                 .selectedvhicleCatagary.value,
                          //             decoration: InputDecoration(
                          //               prefixIcon: Icon(
                          //                 Icons.car_crash_sharp,
                          //                 color: MyTheme.ambapp1,
                          //               ),
                          //               enabledBorder: InputBorder.none,
                          //               border: InputBorder.none,
                          //             ),
                          //             hint: Text('Vehicle Type'),
                          //             items: _ambulancegetController.vhicletypes
                          //                 .map((VehicleDetaile vhiclee) {
                          //               return DropdownMenuItem(
                          //                 value: vhiclee,
                          //                 child: SizedBox(
                          //                   width: size.width * 0.8,
                          //                   child: Text(
                          //                     vhiclee.vehicleTypeName.toString(),
                          //                     style: TextStyle(
                          //                       fontWeight: FontWeight.w600,
                          //                       fontSize: size.height * 0.012,
                          //                     ),
                          //                   ),
                          //                 ),
                          //               );
                          //             }).toList(),
                          //             onTap: () {
                          //               _ambulancegetController.refresh();
                          //             },
                          //             onChanged: (VehicleDetaile? newValue) {
                          //               _ambulancegetController
                          //                   .selectedvhicleCatagary.value = newValue!;
                          //               // _hospital_2_controller.states.value =
                          //               //     newValue! as List<String>;
                          //               // _hospital_2_controller.selectedCity.value = null;
                          //               // _hospital_2_controller.cities.clear();
                          //               // _hospital_2_controller.cities
                          //               //     .addAll(stateCityMap[newvalue]!);
                          //             }),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          ///
                          Container(
                            height: size.height * 0.115,
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
                                    itemCount:
                                        //4,
                                        _itemsss.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                                              borderRadius:
                                                  BorderRadius.circular(10),

                                              elevation: 5,
                                              child: Container(
                                                height: size.height * 0.04,
                                                width: size.width * 0.19,
                                                decoration: BoxDecoration(
                                                    color: _tilecolorr
                                                                .selectedindex
                                                                .value ==
                                                            index
                                                        ? MyTheme.ambapp5
                                                        : MyTheme.ambapp1,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: _tilecolorr
                                                                    .selectedindex
                                                                    .value ==
                                                                index
                                                            ? MyTheme
                                                                .ThemeColors
                                                            : MyTheme.ambapp1,
                                                        width: 1)),

                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height:
                                                          size.height * 0.065,
                                                      decoration: BoxDecoration(
                                                          color: _tilecolorr
                                                                      .selectedindex
                                                                      .value ==
                                                                  index
                                                              ? MyTheme.ambapp1
                                                              : MyTheme
                                                                  .ambapp11,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                _itemsssimage[
                                                                    index]),
                                                          )),
                                                    ),

                                                    ///Spacer(),
                                                    Text('${_itemsss[index]}',
                                                        style: TextStyle(
                                                            color: _tilecolorr
                                                                        .selectedindex
                                                                        .value ==
                                                                    index
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontSize:
                                                                size.height *
                                                                    0.015,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    //Spacer(),
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
                                SizedBox(
                                  height: 2,
                                ),
                              ],
                            ),
                          ),

                          ///.....todo:..your offer......................
                          // Padding(
                          //   padding: EdgeInsets.all(3.0),
                          //   child: TextFormField(
                          //     controller: _ambulancegetController.offercontroller,
                          //     //controller.emailController,
                          //     obscureText: false,
                          //     keyboardType: TextInputType.number,
                          //     // validator: (value) {
                          //     //   return _loginMobileController
                          //     //       .validatePhone(value!);
                          //     // },
                          //     decoration: InputDecoration(
                          //       //border: InputBorder.none,
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(15.0),
                          //         borderSide: BorderSide(color: Colors.red, width: 1),
                          //       ),
                          //       contentPadding: const EdgeInsets.only(
                          //           left: 14.0, bottom: 8.0, top: 13.0),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //           color: Colors.red,
                          //         ),
                          //         borderRadius: BorderRadius.circular(15.7),
                          //       ),
                          //       enabledBorder: UnderlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.transparent),
                          //         borderRadius: BorderRadius.circular(15.7),
                          //       ),
                          //
                          //       prefixIcon: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Icon(
                          //           Icons.currency_rupee,
                          //           color: MyTheme.ambapp1,
                          //         ),
                          //         // Image.asset(
                          //         //   "lib/assets/images/pnone4.png",
                          //         //   color: MyTheme.ambapp1,
                          //         //   height: 10,
                          //         //   width: 10,
                          //         // ),
                          //       ),
                          //       fillColor: MyTheme.ambapp12,
                          //       filled: true,
                          //       suffixIcon: null ?? const SizedBox(),
                          //       hintText: "Offer Your Fare",
                          //       hintStyle: GoogleFonts.poppins(
                          //         fontSize: 14.0,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //       // contentPadding:
                          //       //const EdgeInsets.only(top: 16.0),
                          //     ),
                          //   ),
                          // ),
                          ///no od passangers....
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: TextFormField(
                              controller: _ambulancegetController
                                  .noofpassengercontroller,
                              //controller.emailController,
                              obscureText: false,

                              keyboardType: TextInputType.number,

                              validator: (value) {
                                return _ambulancegetController
                                    .validptient(value!);
                              },
                              decoration: InputDecoration(
                                //border: InputBorder.none,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 2),
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
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.15),
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
                                  backgroundColor: MaterialStateProperty.all(
                                      MyTheme.ambapp1),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.all(14)),
                                ),
                                child: Text(
                                  "Find Ride",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                onPressed: () async {
                                  ///todo: new...
                                  await Timer(const Duration(milliseconds: 100),
                                      () {
                                    _ambulancegetController
                                        .googlerequestambulance(markers);
                                  });

                                  ///await _getCurrentLocation();

                                  // CallLoader.loader();
                                  await Future.delayed(
                                      Duration(milliseconds: 500));
                                  //CallLoader.hideLoader();

                                  ///todo: here you can clear your text field controllers.......11 jan 2024...
                                  await Timer(const Duration(seconds: 5), () {
                                    _ambulancegetController
                                        .noofpassengercontroller
                                        .clear();
                                  });

                                  // _ambulancegetController
                                  //     .noofpassengercontroller
                                  //     .clear();

                                  ///await _getCurrentLocation();
                                  //_ambulancegetController
                                  //.googlerequestambulance(markers);

                                  /// Get.to(DriverListById());
                                },
                              ),
                            ),
                          ),

                          // Spacer(),
                        ],
                      ),
                    ),
                  ),
                  // Show zoom buttons
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipOval(
                            child: Material(
                              color: Colors.blue.shade100, // button color
                              child: InkWell(
                                splashColor: Colors.red, // inkwell color
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(Icons.add),
                                ),
                                onTap: () {
                                  mapController.animateCamera(
                                    CameraUpdate.zoomIn(),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ClipOval(
                            child: Material(
                              color: Colors.blue.shade100, // button color
                              child: InkWell(
                                splashColor: Colors.red, // inkwell color
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Icon(Icons.remove),
                                ),
                                onTap: () {
                                  mapController.animateCamera(
                                    CameraUpdate.zoomOut(),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Show the place input fields & button for
                  // showing the route
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          width: width,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 0.0, bottom: 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                // Text(
                                //   'Places',
                                //   style: TextStyle(fontSize: 20.0),
                                // ),
                                // SizedBox(height: 10),
                                _textField(
                                    label: 'Start',
                                    hint: 'Choose starting point',
                                    prefixIcon: Icon(Icons.looks_one),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.my_location),
                                      onPressed: () async {
                                        //CallLoader.loader();
                                        await Future.delayed(
                                            Duration(seconds: 1));
                                        CallLoader.hideLoader();
                                        await _getCurrentLocation();
                                        //await _getCurrentLocation();
                                        startAddressController.text =
                                            _currentAddress;
                                        _startAddress = _currentAddress;
                                      },
                                    ),
                                    controller: startAddressController,
                                    focusNode: startAddressFocusNode,
                                    width: width,
                                    locationCallback: (String value) {
                                      setState(() async {
                                        await _getCurrentLocation();
                                        _startAddress = value;
                                      });
                                    }),

                                ///........................................prince..........suggession
                                SizedBox(height: 10),
                                _textField(
                                    label: 'Destination',
                                    hint: 'Choose destination',
                                    prefixIcon: Icon(Icons.looks_two),
                                    controller: destinationAddressController,
                                    focusNode: desrinationAddressFocusNode,
                                    width: width,
                                    locationCallback: (String value) {
                                      setState(() {
                                        _destinationAddress = value;
                                      });
                                    }),
                                SizedBox(height: 7),
                                Visibility(
                                  visible:
                                      _placeDistance == null ? false : true,
                                  child: Text(
                                    'DISTANCE: $_placeDistance km',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                ElevatedButton(
                                  onPressed: (_startAddress != '' &&
                                          _destinationAddress != '')
                                      ? () async {
                                          CallLoader.loader();
                                          await Future.delayed(
                                              Duration(seconds: 2));
                                          CallLoader.hideLoader();
                                          startAddressFocusNode.unfocus();
                                          desrinationAddressFocusNode.unfocus();
                                          setState(() {
                                            if (markers.isNotEmpty)
                                              markers.clear();
                                            if (polylines.isNotEmpty)
                                              polylines.clear();
                                            if (polylineCoordinates.isNotEmpty)
                                              polylineCoordinates.clear();
                                            _placeDistance = null;
                                            // CallLoader.hideLoader();
                                          });

                                          _calculateDistance()
                                              .then((isCalculated) {
                                            if (isCalculated) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Distance Calculated Sucessfully'),
                                                ),
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      'Error Calculating Distance'),
                                                ),
                                              );
                                            }
                                          });
                                        }
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Show Route'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red.shade400,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///Todo: Show current location button
                  SafeArea(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0.7, bottom: 0.9),
                        child: ClipOval(
                          child: Material(
                            color: Colors.orange.shade100, // button color
                            child: InkWell(
                              splashColor: Colors.orange, // inkwell color
                              child: SizedBox(
                                width: 36,
                                height: 36,
                                child: Icon(Icons.my_location),
                              ),
                              onTap: () {
                                mapController.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                      target: LatLng(
                                        _currentPosition.latitude,
                                        _currentPosition.longitude,
                                      ),
                                      zoom: 18.0,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
