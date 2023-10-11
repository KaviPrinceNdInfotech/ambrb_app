import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/app_theme/app_color.dart';

///import 'package:roshini/constants/app_theme/app_color.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        backgroundColor: MyTheme.t1navbar1,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.70),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: size.width * 0.17,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(size.height * 0.01),
                        child: Image.asset(
                            'lib/assets/images/roshini_logo_dummy.png'),
                      )),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: MyTheme.t1containercolor,
              ),
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.question,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.025,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Service 1',
                style: TextStyle(
                    fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/AboutUs'
                  ? Colors.grey[300]
                  : Colors.transparent,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => AboutUs());
                Get.offNamed('/AboutUs');
              },
            ),
            ListTile(
              //horizontalTitleGap: 10,
              leading: Icon(
                Icons.person_rounded,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.025,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Service 2',
                style: TextStyle(
                    fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/ProfilePage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => ProfilePage());
                Get.offNamed('/ProfilePage');
              },
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.umbrellaBeach,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.025,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Service 3',
                style: TextStyle(
                    fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/MyHolidayPage'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => MyHolidayPage());
                Get.offNamed('/MyHolidayPage');
              },
            ),
            ListTile(
              // horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.hotel,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.025,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Service 4',
                style: TextStyle(
                    fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/AssociatePage'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                // Get.to(() => AssociatePage());
                Get.offNamed('/AssociatePage');
              },
            ),
            ListTile(
              //horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.photoFilm,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.025,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Service 5',
                style: TextStyle(
                    fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/Gallerys' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                //Get.to(() => Gallerys());
                Get.offNamed('/Gallerys');
              },
            ),
            ListTile(
              //horizontalTitleGap: 10,
              leading: Icon(
                FontAwesomeIcons.clockRotateLeft,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.025,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Service 6',
                style: TextStyle(
                    fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PaymentHistory'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                //Get.to(() => PaymentHistory());
                Get.offNamed('/PaymentHistory');
              },
            ),
            ListTile(
              //horizontalTitleGap: 15,
              leading: Icon(
                FontAwesomeIcons.circleQuestion,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.025,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: MyTheme.t1Iconcolor,
                size: size.height * 0.02,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'service 7',
                style: TextStyle(
                    fontSize: size.height * 0.017, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/AmcPage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                //Get.to(() => AmcPage());
                Get.offNamed('/AmcPage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
