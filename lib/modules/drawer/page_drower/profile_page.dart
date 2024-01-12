//import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/get_profile_detail_controller/get_profile_details_controller.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfilePagess extends StatelessWidget {
  ProfilePagess({Key? key}) : super(key: key);

  GetProfileController _getProfileController = Get.put(GetProfileController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => (_getProfileController.isLoading.value)
          ? Center(child: CircularProgressIndicator())
          : _getProfileController.getProfileDetail?.pinCode == null
              ? Center(
                  child: Text('No data'),
                )
              : Scaffold(
                  body: SafeArea(
                    child: Stack(
                      //clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 300,
                          color: MyTheme.ambapp4,
                        ), //Container
                        Positioned(
                          top: 160,
                          left: size.width * 0.01,
                          right: size.width * 0.01,
                          child: Container(
                            width: size.width * 0.6,
                            height: size.height * 0.6,
                            color: MyTheme.ambapp2,
                          ),
                        ),

                        ///name
                        Positioned(
                          top: size.height * 0.16,
                          left: size.width * 0.21,
                          //right: size.width * 0.03,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.people,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.02,
                                child: Text(
                                  // 'Kumar Prince',
                                  "${_getProfileController.getProfileDetail?.patientName}",
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///email....
                        Positioned(
                          top: size.height * 0.21,
                          left: size.width * 0.21,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.02,
                                child: Text(
                                  "${_getProfileController.getProfileDetail?.emailId}",
                                  //'kumar261199@gmail.com',
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///phone....
                        Positioned(
                          top: size.height * 0.26,
                          left: size.width * 0.21,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.call,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.02,
                                child: Text(
                                  "${_getProfileController.getProfileDetail?.mobileNumber}",
                                  // '7095444555',
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///pin....
                        Positioned(
                          top: size.height * 0.31,
                          left: size.width * 0.21,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.pin,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.025,
                                child: Text(
                                  "${_getProfileController.getProfileDetail?.pinCode}",
                                  // '7095444555',
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.02,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///location....
                        Positioned(
                          top: size.height * 0.36,
                          left: size.width * 0.21,
                          child: Row(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.pin_drop_rounded,
                                  color: MyTheme.ambapp13,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                height: size.height * 0.03,
                                child: Text(
                                  "${_getProfileController.getProfileDetail?.location}",
                                  // 'Bihar Lakhisarai surajgarha 811106',
                                  style: TextStyle(
                                      color: MyTheme.ambapp4,
                                      fontSize: size.height * 0.020,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),

                        ///button.....
                        Positioned(
                          top: 540,
                          left: 90,
                          right: 90,
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            shadowColor: Colors.blue,
                            color: MyTheme.ambapp10,
                            child: InkWell(
                              onTap: () {
                                Get.to(EditProfilePage());
                              },
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: MyTheme.ambapp11,
                                  borderRadius: BorderRadius.circular(20),
                                  //shape: BoxShape.circle,
                                ),
                                child: Center(
                                    child: Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.025,
                                  ),
                                )),
                              ),
                            ),
                          ),
                        ),

                        ///Container
                        Positioned(
                          left: size.width * 0.25,
                          right: size.width * 0.25,
                          top: size.height * 0.05,
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: MyTheme.ambapp12,
                                borderRadius: BorderRadius.circular(30),
                                //shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/images/CommonLogoAmbrd.png')),
                                border: Border.all(color: Colors.blueAccent)),

                            /// child: Image.asset('assets/LOGOammbpng.png'),...
                          ),
                        ),

                        ///.............................
                        Positioned(
                          left: 6,
                          top: 3,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Center(
                                        child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'MY Profile',
                                  style: TextStyle(
                                      color: MyTheme.ambapp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),

                        ///..............................

                        Positioned(
                          left: 6,
                          top: 3,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Center(
                                        child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'MY Profile',
                                  style: TextStyle(
                                      color: MyTheme.ambapp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),

                        //Container
                      ], //<Widget>[]
                    ),
                  ),
                ),
    );
  }
}
