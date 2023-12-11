import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class ComplainPatientController extends GetxController {
  final GlobalKey<FormState> ComplainPatientFormKey = GlobalKey<FormState>();

  TextEditingController Complaints = TextEditingController();
  TextEditingController Subjects = TextEditingController();
  TextEditingController Others = TextEditingController();

  ///....
  var complaints = '';
  var subjects = '';
  //var password = '';
  var others = '';

  void complainpatienrApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.ComplainPatientApi(
      Complaints.text,
      Subjects.text,
      Others.text,
    );
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Success', 'Post Complain SuccessFully');
      //_loginMobileController.login();

      Get.to(() => BottommNavBar());
    }
  }

  @override
  void onInit() {
    super.onInit();
    Complaints;
    Subjects;
    Others;
    // dateofbirth = TextEditingController();
    // dateofbirth.text = "YYY-MM-DD";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  String? validateaccount(String value) {
    if (value.length < 2) {
      return "Provide data";
    }
    return null;
  }

  String? validateholder(String value) {
    if (value.length < 2) {
      return "provide data";
    }
    return null;
  }

  String? validaddress(String value) {
    if (value.length < 1) {
      return "provide data";
    }
    return null;
  }

  void checkcomplainuser() {
    if (ComplainPatientFormKey.currentState!.validate()) {
      complainpatienrApi();
    }
    ComplainPatientFormKey.currentState!.save();
  }
}
