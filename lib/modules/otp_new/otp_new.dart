import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/login_mobile_controller/login_mobile_controllers.dart';
import '../../controllers/otp_new_verify_controller/otp_new_verify_controller.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);

  LoginMobileController loginMobileController = Get.find();
  OtpVerifyController _otpVerifyController = Get.put(OtpVerifyController());
  bool firstbox = false;
  get otp => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: 60,
        width: 700,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: OtpTextField(
            keyboardType: TextInputType.text,
            fillColor: Colors.white,
            filled: true,
            fieldWidth: 50,
            numberOfFields: 4,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              _otpVerifyController.callOtpApi(verificationCode);
            }, // end onSubmit
          ),
        ),
      ),
    ));
  }
}
