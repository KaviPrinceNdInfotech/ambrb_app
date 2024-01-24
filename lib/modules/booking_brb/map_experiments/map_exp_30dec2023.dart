import 'dart:async';

import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/periodic_function_controller.dart';
import 'package:ambrd_appss/modules/booking_brb/map_experiments/map_exp_30dec_2023_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key, required id});

  var x = 0;

  // var period = const Duration(seconds: 10);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? mapController;
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  PeriodicFunctionController _periodicFunctionController =
      Get.put(PeriodicFunctionController());

  // DriverAcceptlistController _driverAcceptlistController =
  //     Get.put(DriverAcceptlistController());

  // (_periodicFunctionController.getDriveracceptDetail?.?.toDouble() ?? 00.00);
  static LatLng _pGooglePlex2 = LatLng(28.5355161, 77.3910265);
  //static const LatLng _pApplePark = LatLng(28.7040592, 77.102490199999991);
  ///todo: it will comment because 20 jan 2024..
  LatLng? _currentP = null;

  ///LatLng? _currentP = _pGooglePlex2;

  Map<PolylineId, Polyline> polylines = {};

  late BitmapDescriptor customIcon;

  ///todo:driver updated lat
  final driverUpdatelat = (28.5355161.toDouble());
  //(_periodicFunctionController.driverTrackModel?.updatedDriverLat
  //  ?.toDouble() ??
  // 00.00);

  ///todo:driver updated lang
  final driverUpdatelang = (77.3144245

      ///(_periodicFunctionController.driverTrackModel?.updatedDriverLang
      .toDouble());

  //final LatLng _pNdtechland = LatLng(driverUpdatelat.toDouble(),driverUpdatelang);

  ///todo: destination lat lng (user Position).....

  void customMarker() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(1, 1)),
      'lib/assets/images/markerlogo16.png',
    ).then((value) => {customIcon = value});
  }

  @override
  void initState() {
    //_pApplePark();
    customMarker();
    super.initState();

    // _pNdtechland();
    var period = Duration(seconds: 5);
    Timer.periodic(period, (arg) {
      customMarker();
    });
    getLocationUpdates().then(
      (_) => {
        getPolylinePoints().then((coordinates) => {
              generatePolyLineFromPoints(coordinates),
            }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // var bitmapIcon = BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(size: Size(48, 48)), 'lib/assets/images/AMB3.png');

    ///todo: start position....(driver lat lng fix)
    ///todo:driver start lat
    final driverlat =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.driverStartLat
                ?.toDouble() ??
            00.00);

    ///todo:driver start lang
    final driverlang =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.driverStartLang
                ?.toDouble() ??
            00.00);

    LatLng _pGooglePlex = LatLng(driverlat, driverlang);

    ///todo: update position.............
    ///todo:driver updated lat
    final driverUpdatelat =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.updatedDriverLat
                ?.toDouble() ??
            00.00);

    ///todo:driver updated lang
    final driverUpdatelang =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.updatedDriverLang
                ?.toDouble() ??
            00.00);

    final LatLng _pNdtechland = LatLng(driverUpdatelat, driverUpdatelang);

    ///todo: destination lat lng (user Position).....

    ///todo: destination lat
    final destinationlat =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.userlocationLat
                ?.toDouble() ??
            00.00);

    ///todo:end dastination lang
    final destinationlang =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.userlocationLang
                ?.toDouble() ??
            00.00);

    final LatLng _pApplePark = LatLng(destinationlat, destinationlang);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyTheme.ambapp,
          title: Text('See Your Driver'),
          centerTitle: true,
          elevation: 0,
        ),

        /// _currentP
        body: _pApplePark == null

            //_currentP == null
            //_pApplePark
            // body: _pApplePark == null
            ? const Center(
                child: Text("Loading..."),
              )
            : Column(
                children: [
                  Obx(
                    () => (_periodicFunctionController.isLoading.value)
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : _periodicFunctionController
                                    .driverTrackModel?.driverName ==
                                null
                            ? Center(
                                child: SizedBox(
                                    height: size.height * 0.60,
                                    width: size.width,
                                    child: Center(
                                        child: Text('No Driver Available!'))),
                              )
                            : SizedBox(
                                height: size.height * 0.63,
                                width: size.width * 0.99,
                                child: GoogleMap(
                                  //onCameraMoveStarted: ,
                                  myLocationEnabled: false,
                                  mapType: MapType.normal,
                                  zoomGesturesEnabled: true,
                                  zoomControlsEnabled: false,
                                  //_mapController.a
                                  onMapCreated: (controller) {
                                    //method called when map is created
                                    setState(() {
                                      mapController = controller;

                                      var period = Duration(seconds: 5);
                                      Timer.periodic(period, (arg) {
                                        customMarker();

                                        ///todo: 15 jan 2024..
                                        // LatLng newlatlang = LatLng(28.557020, 77.326240);
                                        mapController?.animateCamera(
                                            CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                    target: _pNdtechland,
                                                    zoom: 12)
                                                //17 is new zoom level
                                                ));
                                      });
                                    });
                                  },

                                  ///
                                  // onMapCreated:
                                  //     ((GoogleMapController controller) =>
                                  //         _mapController
                                  //             .complete(controller)),

                                  initialCameraPosition: CameraPosition(
                                    target: _pNdtechland,
                                    zoom: 12,
                                  ),
                                  //_mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(currentLocation.latitude, currentLocation.longitude), 14));

                                  /// myLocationButtonEnabled: false,
                                  //zoomControlsEnabled: false,
                                  ///todo: ambulance(updated driver).....
                                  ///

                                  markers: {
                                    Marker(
                                      markerId: MarkerId("Ambulance"),
                                      icon: customIcon,
                                      // BitmapDescriptor
                                      //     .defaultMarkerWithHue(100),
                                      position: _pNdtechland!,
                                      infoWindow: InfoWindow(
                                        title: 'Ambulance $_pNdtechland',
                                        snippet: "Ambulance",
                                      ),

                                      ///position: _currentP!,
                                      ///_pApplePark
                                    ),
                                    Marker(
                                      markerId: MarkerId("Driver"),
                                      icon:
                                          BitmapDescriptor.defaultMarkerWithHue(
                                              200.00),
                                      position: _pGooglePlex,
                                      infoWindow: InfoWindow(
                                        title: 'Driver $_pGooglePlex',
                                        snippet: "Driver",
                                      ),
                                    ),
                                    Marker(
                                      markerId: MarkerId("User"),
                                      icon: BitmapDescriptor.defaultMarker,
                                      position: _pApplePark,
                                      infoWindow: InfoWindow(
                                        title: 'User $_pApplePark',
                                        snippet: "User",
                                      ),
                                    )
                                  },
                                  polylines: Set<Polyline>.of(polylines.values),
                                ),
                              ),
                  ),
                  Spacer(),
                  Container(
                    //height: size.height * 0.21,
                    decoration: BoxDecoration(
                      color: MyTheme.ambapp12,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              Container(
                                  width: size.width * 0.3,
                                  height: size.height * 0.04,
                                  decoration:
                                      BoxDecoration(color: Colors.white70),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Driver Name:",
                                          style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                width: size.width * 0.69,
                                height: size.height * 0.04,
                                decoration:
                                    BoxDecoration(color: Colors.white70),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.035),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // _driverAcceptlistController
                                        "${_periodicFunctionController.driverTrackModel?.driverName ?? 0}",
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                            color: MyTheme.ambapp),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              Container(
                                  width: size.width * 0.3,
                                  height: size.height * 0.04,
                                  decoration:
                                      BoxDecoration(color: Colors.white70),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Mobile No:",
                                          style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                width: size.width * 0.69,
                                height: size.height * 0.04,
                                decoration:
                                    BoxDecoration(color: Colors.white70),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.035),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // _driverAcceptlistController
                                        "${_periodicFunctionController.driverTrackModel?.mobileNumber ?? 0}",
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                            color: MyTheme.ambapp),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              Container(
                                  width: size.width * 0.3,
                                  height: size.height * 0.04,
                                  decoration:
                                      BoxDecoration(color: Colors.white70),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "DL No:",
                                          style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                width: size.width * 0.69,
                                height: size.height * 0.04,
                                decoration:
                                    BoxDecoration(color: Colors.white70),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.035),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // _driverAcceptlistController
                                        "${_periodicFunctionController.driverTrackModel?.dlNumber ?? 0}",
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                            color: MyTheme.ambapp),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              Container(
                                  width: size.width * 0.3,
                                  height: size.height * 0.04,
                                  decoration:
                                      BoxDecoration(color: Colors.white70),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Vehicle No:",
                                          style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                width: size.width * 0.69,
                                height: size.height * 0.04,
                                decoration:
                                    BoxDecoration(color: Colors.white70),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.035),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // _driverAcceptlistController
                                        "${_periodicFunctionController.driverTrackModel?.vehicleNumber ?? 0}",
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                            color: MyTheme.ambapp),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              Container(
                                  width: size.width * 0.3,
                                  height: size.height * 0.04,
                                  decoration:
                                      BoxDecoration(color: Colors.white70),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Distance:",
                                          style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                width: size.width * 0.69,
                                height: size.height * 0.04,
                                decoration:
                                    BoxDecoration(color: Colors.white70),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.035),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        // _driverAcceptlistController
                                        "${_periodicFunctionController.driverTrackModel?.totalDistance ?? 0.0} Km",
                                        style: TextStyle(
                                            fontSize: size.width * 0.035,
                                            fontWeight: FontWeight.w500,
                                            color: MyTheme.ambapp),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

                        ///
                        // ElevatedButton(
                        //   onPressed: () {
                        //     var x = 0;
                        //     // var period = Duration(seconds: 15);
                        //     // Timer.periodic(period, (arg) {
                        //     //   _periodicFunctionController
                        //     //       .driveracceptuserDetailApi2();
                        //     //   _periodicFunctionController
                        //     //       .onInit();
                        //     //   _periodicFunctionController
                        //     //       .update();
                        //     //   _periodicFunctionController
                        //     //       .refresh();
                        //     //
                        //     //   ///
                        //     //   // Marker(
                        //     //   //     markerId: MarkerId("_destionationLocation"),
                        //     //   //     icon: BitmapDescriptor.defaultMarker,
                        //     //   //     position: _pApplePark);
                        //     //
                        //     //   // x = x + 1;
                        //     //   // print(x);
                        //     // });
                        //   },
                        //   child: const Text(
                        //     'Track Your Driver',
                        //     style: TextStyle(fontSize: 12),
                        //   ),
                        //   style: ButtonStyle(
                        //       padding: MaterialStateProperty.all<
                        //           EdgeInsets>(EdgeInsets.all(10)),
                        //       backgroundColor:
                        //           MaterialStateProperty.all<
                        //               Color>(Colors.red),
                        //       shadowColor: MaterialStateProperty
                        //           .all<Color>(Colors.grey),
                        //       elevation: MaterialStateProperty
                        //           .resolveWith<double>(
                        //         (Set<MaterialState> states) {
                        //           if (states.contains(
                        //               MaterialState.pressed))
                        //             return 15;
                        //           return 5; // default elevation
                        //         },
                        //       ),
                        //       shape: MaterialStateProperty.all<
                        //           RoundedRectangleBorder>(
                        //         RoundedRectangleBorder(
                        //           borderRadius:
                        //               BorderRadius.circular(15),
                        //         ),
                        //       ),
                        //       animationDuration:
                        //           Duration(milliseconds: 300)),
                        // )
                        ///
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
      ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 10,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    ///todo: start position....(driver lat lng fix)
    ///todo:driver start lat
    final driverlat =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.driverStartLat
                ?.toDouble() ??
            00.00);

    ///todo:driver start lang
    final driverlang =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.driverStartLang
                ?.toDouble() ??
            00.00);

    LatLng _pGooglePlex = LatLng(driverlat, driverlang);

    ///todo: update position.............
    ///todo:driver updated lat
    final driverUpdatelat =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.updatedDriverLat
                ?.toDouble() ??
            00.00);

    ///todo:driver updated lang
    final driverUpdatelang =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.updatedDriverLang
                ?.toDouble() ??
            00.00);

    LatLng _pNdtechland = LatLng(driverUpdatelat, driverUpdatelang);

    ///todo: destination lat lng (user Position).....

    ///todo: destination lat
    final destinationlat =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.userlocationLat
                ?.toDouble() ??
            00.00);

    ///todo:end dastination lang
    final destinationlang =
        //(28.5355161.toDouble());
        (_periodicFunctionController.driverTrackModel?.userlocationLang
                ?.toDouble() ??
            00.00);

    final LatLng _pApplePark = LatLng(destinationlat, destinationlang);

    ///todo:driver start lat driver fix......

    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_pApplePark.latitude, _pApplePark.longitude),
      PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: MyTheme.ambapp,
        points: polylineCoordinates,
        width: 5);
    setState(() {
      polylines[id] = polyline;
    });
  }
}
