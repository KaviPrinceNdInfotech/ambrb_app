import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_theme/app_color.dart';
import '../../constants/widgets/button_custom.dart';
import '../../controllers/login_mobile_controller/login_mobile_controllers.dart';
import '../otp/otp_page.dart';
import '../sign_up_page/sign_up_pagee.dart';

class LoginScreen extends GetView<LoginMobileController> {
  //const LoginScreen({Key? key}) : super(key: key);

  LoginMobileController _loginMobileController =
      Get.put(LoginMobileController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(LoginMobileController());
    return Scaffold(
      backgroundColor: MyTheme.t1navbar1,
      body: Obx(
        () => _loginMobileController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _loginMobileController.MobileLoginFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SafeArea(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.05),
                          Lottie.asset(
                              'lib/assets/images/animation_lnk7o8on.zip',
                              height: height * 0.3),

                          // Image.asset(
                          //   'lib/assets/images/111424-phone-verification-otp-animation.gif',
                          //   height: height * 0.2,
                          // ),
                          SizedBox(height: height * 0.05),
                          Text(
                            "Please Verify Your Phone!",
                            style: GoogleFonts.alegreyaSc(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: MyTheme.t1Iconcolor),
                          ),
                          SizedBox(height: height * 0.06),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _loginMobileController.MobileOrEmail,
                              //controller.emailController,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                return _loginMobileController
                                    .validatePhone(value!);
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 8.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15.7),
                                ),

                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "lib/assets/images/pnone4.png",
                                    color: MyTheme.ambapp1,
                                    height: 10,
                                    width: 10,
                                  ),
                                ),
                                fillColor: MyTheme.ambapp3,
                                filled: true,
                                suffixIcon: null ?? const SizedBox(),
                                hintText: "Enter Your Mobile",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                // contentPadding:
                                //const EdgeInsets.only(top: 16.0),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "You Not Register?",
                                  style: GoogleFonts.alegreyaSc(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: MyTheme.t1Iconcolor),
                                ),
                                SizedBox(height: height * 0.05),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => SignUpPage());
                                  },
                                  child: Text(
                                    "SIGNUP",
                                    style: GoogleFonts.alegreyaSc(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.ambapp1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          CustomButton(
                            onTap: () {
                              //SignUpPage
                              _loginMobileController.checkMobileLogin();
                              Get.to(() => OTPPhone());
                              // Get.to(() => AddBanner());
                              // Get.to(() => HomePage());
                            },
                            btnText: 'Verify',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
