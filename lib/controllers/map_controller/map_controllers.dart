import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewController extends GetxController {
  var isLoading = false.obs;
  //var realtimeList = <ModelRealtime>[].obs;
  List<Marker> allMarkers = <Marker>[].obs; // Inside Map View Controller

  @override
  void onInit() {
    //fetchRealtimeData();
    super.onInit();
  }

  // void fetchRealtimeData() async {
  //   try {
  //     isLoading(true);
  //     var realtime = await CommonApiProvider.realTimeData();
  //     if (realtime != null) {
  //       realtimeList.value = realtime;
  //     }
  //   } catch (e) {
  //     isLoading(false);
  //     // ignore: avoid_print
  //     print(e);
  //     rethrow;
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  loadMapStyle() async {
    String style = await rootBundle.loadString("assets/map_style.json");
    return style;
  }
}
