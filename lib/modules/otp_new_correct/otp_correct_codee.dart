import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/home_controllers/home_controllers.dart';
import 'package:ambrd_appss/controllers/otp_correctcode_controller/otp_verification_maim_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'otp_verify_controller.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);
  // LoginMobileController _loginMobileController = Get.find();

  //LoginMobileController loginMobileController = Get.find();
  OtpVerifyController _otpVerifyController = Get.put(OtpVerifyController());
  bool firstbox = false;
  //get otp => null;

  HomeController _homePageController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height * 0.96,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1642438114426-bad6b9ce05da?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                        //'https://unsplash.com/photos/a-couple-of-people-sitting-next-to-each-other-in-a-room-C53CnEp-hsU'
                        //'https://images.unsplash.com/photo-1587985399301-ec1cfb049c9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                        // 'https://images.unsplash.com/photo-1555516474-f30ac966572f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80'
                        // 'https://images.unsplash.com/photo-1543544171-1d597a130cca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                        //'https://images.unsplash.com/photo-1568041002045-27791242a745?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1820&q=80'
                        ),
                    fit: BoxFit.fill)),

            ///color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: size.height * 0.03,
                        height: size.width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_back_ios_outlined),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'lib/assets/images/CommonLogoAmbrd.png',
                  ),
                ),
                Spacer(),
                Text(
                  'OTP VERIFICATION',
                  style: GoogleFonts.roboto(
                    fontSize: size.height * 0.034,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                // Container(
                //   height: 30.h,
                //   child: Lottie.asset(
                //     'lib/assets/asset/4430-phone-number-verification.json',
                //     height: 400.0,
                //
                //     ///repeat: true,
                //     // reverse: true,
                //     //animate: true,
                //   ),
                // ),
                // SizedBox(
                //   height: 60,
                // ),
                Spacer(),
                Container(
                  height: size.width * 0.8,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: MyTheme.ambapp7,
                    //color: Colors.cyan,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Verification',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'Enter OTP sent to your registered mobile number',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 110,
                          width: 900,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: OtpTextField(
                              keyboardType: TextInputType.number,
                              fillColor: MyTheme.ambapp12,
                              filled: true,
                              fieldWidth: 70,

                              numberOfFields: 4,
                              borderColor: MyTheme.ambapp3,
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                _otpVerifyController
                                    .callOtpApi(verificationCode);
                                _homePageController.sliderBannerApi();
                                _homePageController.AllServicesApi();
                                _homePageController.onInit();
                                //await _homePageController.AllServicesApi();
                                // await _homePageController.sliderBannerApi();
                                // _homePageController.onInit();

                                /* showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        title: Text("Verification Code"),
                                        content: Text('Code entered is $verificationCode'),
                                      );
                                    }
                                );*/
                              }, // end onSubmit
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                            //_otpVerifyController.callOtpApi(verificationCode);
                          },
                          child: Container(
                            height: 45,
                            width: 270,
                            decoration: BoxDecoration(
                              color: MyTheme.ambapp,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.15, 0))
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Resend',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                              //"Continue".text.bold.center.size(14).make()
                            ),
                          ),
                        ),
                        //     .onTap(() {
                        //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsProfile()));
                        // }
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
