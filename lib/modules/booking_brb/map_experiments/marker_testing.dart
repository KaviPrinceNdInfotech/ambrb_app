import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenMarker extends StatefulWidget {
  const MapScreenMarker({super.key});

  @override
  State<MapScreenMarker> createState() => _MapScreenMarkerState();
}

class _MapScreenMarkerState extends State<MapScreenMarker> {
  LatLng initialLocation = const LatLng(28.5827208, 77.314423);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "lib/assets/images/AMB4.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialLocation,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("marker1"),
            position: const LatLng(28.5827208, 77.314423),
            draggable: true,
            onDragEnd: (value) {
              // value is the new position
            },
            icon: markerIcon,
          ),
          Marker(
            markerId: const MarkerId("marker2"),
            position: const LatLng(28.7040592, 77.102490199999991),
          ),
        },
      ),
    );
  }
}
