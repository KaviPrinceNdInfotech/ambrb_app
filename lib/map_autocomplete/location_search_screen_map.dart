import 'package:ambrd_appss/map_autocomplete/components_maps/location_list_tile.dart';
import 'package:ambrd_appss/map_autocomplete/components_maps/network_utility.dart';
import 'package:ambrd_appss/map_autocomplete/constants_map.dart';
import 'package:ambrd_appss/map_autocomplete/modelsmap/autocomplate_prediction.dart';
import 'package:ambrd_appss/map_autocomplete/modelsmap/place_auto_complate_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ///todo: autocomplete prediction...
  List<AutocompletePrediction> placePredictions = [];

  ///todo: end...
  ///todo: search auto complete function.....4 jan 2024,,,
  Future<void> placeAutocomplete(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "key": apiKey,
    });
    print(uri);

    ///todo: now prince it will make get request....start..
    String? response = await NetworkUtility.fetchUrl(uri);

    if (response != null) {
      print(response);
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (response != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }

    ///todo: now prince it will make get request....end...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: CircleAvatar(
            backgroundColor: secondaryColor10LightTheme,
            child: SvgPicture.asset(
              "lib/assets/images/location.svg",
              height: 16,
              width: 16,
              color: secondaryColor40LightTheme,
            ),
          ),
        ),
        title: const Text(
          "Set drop Location",
          style: TextStyle(color: textColorLightTheme),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: secondaryColor10LightTheme,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: Colors.black),
            ),
          ),
          const SizedBox(width: defaultPadding)
        ],
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TextFormField(
                controller: _controller,
                onChanged: (value) {
                  // PlaceApiProvider(value);
                  //for testing let's call the function
                  placeAutocomplete(value);
                },
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: "Search your location",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SvgPicture.asset(
                      "lib/assets/images/location_pin.svg",
                      color: secondaryColor40LightTheme,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 4,
            color: secondaryColor5LightTheme,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton.icon(
              onPressed: () {
                placeAutocomplete("India");
              },
              icon: SvgPicture.asset(
                "lib/assets/images/location.svg",
                height: 16,
              ),
              label: const Text("Use my Current Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: secondaryColor10LightTheme,
                foregroundColor: textColorLightTheme,
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 4,
            color: secondaryColor5LightTheme,
          ),

          //create own component for suggession
          //Time to show the results
          //Let's search
          Expanded(
            child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) => LocationListTile(
                press: () {},
                location: placePredictions[index].description!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
