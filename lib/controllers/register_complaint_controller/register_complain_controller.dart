import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterComplainController extends GetxController {
  final GlobalKey<FormState> ComplainFormKey = GlobalKey<FormState>();

  // var selectedDrowpdown = ''.obs;
  // List dropdownText = ['Amc', 'Exchange', 'warranty'];
  //
  // // for dropdown selection
  // void setSelected(String value){
  //   selectedDrowpdown.value = value;
  // }
  var selectedServicee = ''.obs;
  var selectedplan = ''.obs;

  onChangeServicee(String servicee) {
    selectedServicee.value = servicee;
  }

  var selectedService = ''.obs;

  onChangePlan(String plan) {
    selectedService.value = plan;
  }

  @override
  void onInit() {
    super.onInit();
    // NameController;
    // MobileController;
    // AddressController;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  String? validateName(String value) {
    if (value.length < 2) {
      return "Name should must be 2 characters";
    }
    return null;
  }

  String? validatemobile(String value) {
    if (value.length < 10) {
      return "Provide valid Phone";
    }
    return null;
  }

  String? validateShopname(String value) {
    if (value.length < 3) {
      return "Provide valid ShopName";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 3) {
      return "provide valid address";
    }
    return null;
  }

  String? validateaadharcard(String value) {
    if (value.length < 12) {
      return "Provide valid aadhar";
    }
    return null;
  }

  String? validatepassword(String value) {
    if (value.length < 5) {
      return "Provide valid password";
    }
    return null;
  }

  void checkComplain() {
    final isValid = ComplainFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    ComplainFormKey.currentState!.save();
    // registerComplainApi();
  }
}
