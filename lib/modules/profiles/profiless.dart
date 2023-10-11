import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_theme/app_color.dart';
import '../../controllers/profile_controller/profile_controller.dart';

class Profoile extends StatelessWidget {
  //const Profoile({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final List<String> profileinfo = [
      'Prince',
      'Nd Techlaqnd',
      '9088990044',
      'Noida sector 2',
      '1234 5666 5666',
      'premium',
      'Car company'
    ];
    final List<String> profileinfo1 = [
      'Name:',
      'Company name:',
      'Mobile:',
      'Address:',
      'Aadhaar: ',
      'Plan:',
      'company:'
    ];
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.t1navbar1,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyTheme.t1navbar1,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: size.height * 0.022,
            color: MyTheme.t1Iconcolor,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: MyTheme.t1Iconcolor,
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhysicalModel(
              color: MyTheme.t1bacgroundcolors1,
              shadowColor: Colors.blueGrey,
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: size.height * 0.7,
                  width: size.width * 0.85,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFFF),
                        Color(0xFFFF),
                      ],
                      begin: FractionalOffset(0.0, 0.0),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'lib/assets/images/logo.png',
                        fit: BoxFit.cover,
                        scale: 32,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                            child: Obx(() => profileController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        leading: Text(
                                          "Name: ",
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          profileController
                                              .ProfileModel!.result!.name
                                              .toString(),
                                          style: GoogleFonts.anaheim(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Company Name: ",
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          profileController
                                              .ProfileModel!.result!.companyname
                                              .toString(),
                                          style: GoogleFonts.anaheim(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Mobile No: ",
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          profileController
                                              .ProfileModel!.result!.mobileNo
                                              .toString(),
                                          style: GoogleFonts.anaheim(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Address: ",
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          profileController
                                              .ProfileModel!.result!.address
                                              .toString(),
                                          style: GoogleFonts.anaheim(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Aadhar: ",
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          profileController
                                              .ProfileModel!.result!.aadhar
                                              .toString(),
                                          style: GoogleFonts.anaheim(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Membership Plan: ",
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          profileController.ProfileModel!
                                              .result!.membershipplan
                                              .toString(),
                                          style: GoogleFonts.anaheim(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Type Of Company: ",
                                          style: GoogleFonts.anekBangla(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                        title: Text(
                                          profileController.ProfileModel!
                                              .result!.typeOfCompany
                                              .toString(),
                                          style: GoogleFonts.anaheim(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ],
                                  ))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
