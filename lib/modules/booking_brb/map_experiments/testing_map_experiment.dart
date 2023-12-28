//MapPracticeExperiment
import 'package:ambrd_appss/modules/booking_brb/map_experiments/address_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapPracticeExperiment extends StatefulWidget {
  MapPracticeExperiment({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MapPracticeExperimentState createState() => _MapPracticeExperimentState();
}

class _MapPracticeExperimentState extends State<MapPracticeExperiment> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onTap: () async {
              // should show search screen here
              showSearch(
                context: context,
                // we haven't created AddressSearch class
                // this should be extending SearchDelegate
                delegate: AddressSearch(),
              );
            },
            decoration: InputDecoration(
              icon: Container(
                margin: EdgeInsets.only(left: 20),
                width: 10,
                height: 10,
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              hintText: "Enter your shipping address",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
