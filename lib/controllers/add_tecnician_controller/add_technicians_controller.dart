import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:roshini/services/api_provider.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class AddtechnicianController extends GetxController {
  final GlobalKey<FormState> addtechnicianformkey = GlobalKey<FormState>();

  TextEditingController Name = TextEditingController();
  TextEditingController Mobile_No = TextEditingController();
  TextEditingController Email_Id = TextEditingController();
  void callAddTechnicianApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.addTechnicianApi(
      Name.text,
      Mobile_No.text,
      Email_Id.text,
    );
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Success', 'Technician Add SuccessFully');
      //Get.to(() => LoginPage());
    }
  }

  @override
  void onInit() {
    super.onInit();
    Name;
    Mobile_No;
    Email_Id;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    Name.dispose();
    Mobile_No.dispose();
    Email_Id.dispose();
  }

  String? validateName(String value) {
    if (value.length < 2) {
      return "provide valid name";
    }
    return null;
  }

  String? validPhone(String value) {
    if (value.length < 10) {
      return "provide valid phone";
    }
    return null;
  }

  String? validAddress(String value) {
    if (value.length < 2) {
      return "Provide valid address";
    }
    return null;
  }

  void checkTechnician() {
    final isValid = addtechnicianformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addtechnicianformkey.currentState!.save();
    callAddTechnicianApi();
  }
}
