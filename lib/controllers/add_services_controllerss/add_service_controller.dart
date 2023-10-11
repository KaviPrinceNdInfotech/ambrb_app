import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import 'package:roshini/services/api_provider.dart';
import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class AddserviceController extends GetxController {
  final GlobalKey<FormState> addserviceformkey = GlobalKey<FormState>();
  TextEditingController services = TextEditingController();

  void calladdServicesApi() async {
    CallLoader.loader();
    http.Response r = await ApiProvider.addServicesApi(
      services.text,
    );
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Success', 'Product Add SuccessFully');
    }
  }

  @override
  void onInit() {
    super.onInit();
    services;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    services.dispose();
  }

  String? validateService(String value) {
    if (value.length < 2) {
      return "provide valid service";
    }
    return null;
  }

  void checkService() {
    final isValid = addserviceformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addserviceformkey.currentState!.save();
    calladdServicesApi();
  }
}
