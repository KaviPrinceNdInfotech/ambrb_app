import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  _ConvertLatLangToAddressState createState() =>
      _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {
  String stAddress = '', stAdd = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(stAddress),
                Text(stAdd),

                GestureDetector(
                  onTap: () async {
                    List<Location> location = await locationFromAddress(
                        "Gronausestraat 710, Enschce");
                    List<Placemark> placemarkers =
                        await placemarkFromCoordinates(52.2165157, 6.9437815);
                    setState(() {
                      stAddress = location.last.longitude.toString() +
                          " " +
                          location.last.latitude.toString();
                      stAdd = placemarkers.reversed.last.country.toString() +
                          "" +
                          placemarkers.reversed.last.country.toString();
                    });
                  },
                )

                //  Text('latitude: 37.597576, longitude: 55.771899'),
                //   Text(address),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: <Widget>[
                Text(stAddress),
                Text(stAdd),

                //const Text('address: Москва, 4-я Тверская-Ямская улица, 7'),
                //Text(latLong),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // From coordinates
      //     final coordinates = new Coordinates(33.6992, 72.9744);
      //     final addresses =
      //         await Geocoder.local.findAddressesFromCoordinates(coordinates);
      //     final first = addresses.first;
      //     print("${first.featureName} : ${first.addressLine}");
      //
      //     // From a query
      //     final query = "1600 Amphiteatre Parkway, Mountain View";
      //     var add = await Geocoder.local.findAddressesFromQuery(query);
      //     var second = add.first;
      //     print("${second.featureName} : ${second.coordinates}");
      //     // setState(() {});
      //   },
      //   child: const Icon(Icons.search),
      // ),
    );
  }
}
