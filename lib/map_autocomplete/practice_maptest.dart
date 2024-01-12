import 'dart:convert';

import 'package:ambrd_appss/modules/booking_brb/map_experiments/search_deligate_screens.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class GoogleSearchPlacesApi extends StatefulWidget {
  @override
  _GoogleSearchPlacesApiState createState() => _GoogleSearchPlacesApiState();
}

class _GoogleSearchPlacesApiState extends State<GoogleSearchPlacesApi> {
  String stAddress = '', stAdd = '';
  var _controller = TextEditingController(text: "Type Here");
  var uuid = new Uuid();
  String _sessionToken = '1234567890';
  List<dynamic> _placeList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _onChanged();
    });
  }

  _onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyBrbWFXlOYpaq51wteSyFS2UjdMPOWBlQw";
    String type = '(India)';

    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      print('mydata');
      print(data);
      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      // toastMessage('success');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Google Map Search places Api',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: TextFormField(
              controller: _controller,
              onTap: () async {
                // should show search screen here
                // showSearch(
                //   context: context,
                //   // we haven't created AddressSearch class
                //   // this should be extending SearchDelegate
                //   delegate: AddressSearch(),
                // );
              },
              onChanged: (text) async {
                Future.delayed(const Duration(seconds: 5), () async {
                  print('One second has passed.');
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  var description = preferences.getString("description");
                  print("descriptionrrr: ${description}");
                  _controller.text =
                      description.toString(); // Prints after 1 second.
                });
              },
              decoration: InputDecoration(
                hintText: "Seek your location here",
                focusColor: Colors.white,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: Icon(Icons.map),
                suffixIcon: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () async {
                    final result = await showSearch<String>(
                      context: context,
                      delegate: NameSearch2(names),
                    );
                    print(result);
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),

          ///.........///........///......///.........///............
          ///.............///.................///...........///................///.....
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _placeList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {},
                  child: ListTile(
                    ///todo: this is from lagt lang and it is from geocoding function and start # Kumar prince 5 jan 2024....start
                    onTap: () async {
                      List<Location> location = await locationFromAddress(
                          _placeList[index]["description"]);
                      print("langoooo${location.last.longitude}");
                      print("latttttoo${location.last.latitude}");
                      print("latttttion${location.toString()}");

                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString(
                          "langoooo", "${location.last.longitude}");
                      await prefs.setString(
                          "latttttoo", "${location.last.longitude}");

                      await prefs.setString(
                          "description", "${_placeList[index]["description"]}");
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

                    ///todo: this is from lagt lang and it is from geocoding function and start # Kumar prince 5 jan 2024.....end

                    title: Text(_placeList[index]["description"]),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

const names = [
  "Camila	Chapman",
  "Belinda	Cameron",
  "Amelia	Harris",
  "Aldus	Howard",
  "Mike	Ryan",
  "Adelaide	Perry",
  "Derek	Hall",
  "Cherry	Ryan",
  "Derek	Owens",
  "John	Walker",
  "Belinda	Ferguson",
  "Vanessa	Barrett",
  "Julian	Foster",
  "Jasmine	Evans",
  "Sabrina	Hunt",
  "Deanna	Carroll",
  "Hailey	Murray",
  "Maximilian	Crawford",
  "Grace	Wright",
  "Garry	Murphy",
  "Catherine	Ferguson",
  "Amelia	Watson",
  "Alisa	Baker",
  "Maria	Miller",
  "Daisy	Harper",
  "Michelle	West",
  "Caroline	Taylor",
  "Heather	West",
  "Justin	Lloyd",
  "Lydia	Cameron",
  "Daryl	Harris",
  "Tara	Robinson",
  "Haris	Wells",
  "Emily	Scott",
  "Catherine	Wells",
  "Ned	Murphy",
  "Blake	Casey",
  "Chelsea	Mitchell",
  "Stuart	Reed",
  "Ellia	Jones",
  "Florrie	Lloyd",
  "Blake	Barnes",
  "Jack	Cole",
  "Adele	Henderson",
  "Jessica	Rogers",
  "Florrie	Barrett",
  "Ryan	Owens",
  "Briony	Dixon",
  "Alexander	Cole",
  "Jessica	Casey",
  "Ryan	Grant",
  "Emily	Fowler",
  "Edith	Turner",
  "Max	Payne",
  "Melanie	Davis",
  "Lucas	Mitchell",
  "Aldus	Warren",
  "Ashton	Kelley",
  "Frederick	Armstrong",
  "Chester	Smith",
  "Alissa	Riley",
  "Bruce	Rogers",
  "Edgar	Armstrong",
  "Cadie	Cooper",
  "Ryan	Scott",
  "Rebecca	Campbell",
  "Rebecca	Parker",
  "Grace	Bennett",
  "Alen	Cunningham",
  "Lucia	Douglas",
  "Sydney	Allen",
  "Roland	Cole",
  "Eddy	Lloyd",
  "Haris	Murphy",
  "Fiona	Farrell",
  "Honey	Jones",
  "Edward	Watson",
  "Ada	Harris",
  "Jordan	Owens",
  "Carlos	Stevens",
  "Alissa	Howard",
  "Madaline	Smith",
  "Luke	Carroll",
  "Paul	Campbell",
  "Adrian	Murray",
  "Ashton	Brown",
  "Ned	Harris",
  "Michelle	Thomas",
  "Ted	Evans",
  "Adelaide	Hawkins",
  "Sydney	Hall",
  "Arnold	Ross",
  "Clark	Stewart",
  "Carl	Smith",
  "Vivian	Watson",
  "Sam	Wells",
  "Arnold	Stevens",
  "Vivian	Miller",
  "John	Hawkins",
  "Edgar	Payne",
];
