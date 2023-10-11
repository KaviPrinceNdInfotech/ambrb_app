import 'package:flutter/material.dart';

import '../../constants/app_theme/app_color.dart';
//import 'package:roshini/constants/app_theme/app_color.dart';

class SearchPageDetail extends StatelessWidget {
  SearchPageDetail({Key? key, required this.name}) : super(key: key);
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "User Detail",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: MyTheme.t1navbar1,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 22,
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      color: Colors.grey, height: 300, width: double.infinity),
                  ListTile(
                    dense: true,
                    leading: Text("Name:", style: TextStyle(fontSize: 16)),
                    title: Text(name, style: TextStyle(fontSize: 16)),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text("Mobile:", style: TextStyle(fontSize: 16)),
                    title: Text('99999999999', style: TextStyle(fontSize: 16)),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text("Address:", style: TextStyle(fontSize: 16)),
                    title: Text("New Delhi", style: TextStyle(fontSize: 16)),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text("Product / Service:",
                        style: TextStyle(fontSize: 16)),
                    title: Text("Motor", style: TextStyle(fontSize: 16)),
                  ),
                  ListTile(
                    dense: true,
                    leading:
                        Text("Service type:", style: TextStyle(fontSize: 16)),
                    title: Text("Repair", style: TextStyle(fontSize: 16)),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text("Status:", style: TextStyle(fontSize: 16)),
                    title: Text('Open', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
