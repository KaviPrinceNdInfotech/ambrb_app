import 'package:ambrd_appss/model/comman_city_model/comman_city_model.dart';
import 'package:ambrd_appss/model/comman_state_model/state_model_commen.dart';
import 'package:ambrd_appss/modules/login_view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> SignupFormKey = GlobalKey<FormState>();

  ///todo: gender......
  final selectedgender = "".obs;

  ///todo:date of birth..................
  var selectedDate = DateTime.now().obs;

  onChangeGender(String servicee) {
    selectedgender.value = servicee;
  }

  ///this is radio button function......
  var selectedService = ''.obs;

  ///this is for State....................................
  Rx<City?> selectedCity = (null as City?).obs;
  RxList<City> cities = <City>[].obs;

  //this is for City.................................
  Rx<StateModel?> selectedState = (null as StateModel?).obs;

  ///.....
  List<StateModel> states = <StateModel>[];

  onChangeService(String service) {
    selectedService.value = service;
  }

  TextEditingController Name = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController EmailId = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController PinCode = TextEditingController();
  //TextEditingController Gender = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();

  ///....
  var name = '';
  var email = '';
  //var password = '';
  var mobile = '';
  // var state = '';
  // var city = '';
  var address = '';
  var pin = '';
  //var dateofbirth = "";

  ///todo:state api...
  Future<void> getStateApi() async {
    states = await ApiProvider.getSatesApi();
    print('Prince state  list');
    print(states);
  }

  ///todo: city api......

  Future<void> getCityByStateID(String stateID) async {
    cities.clear();
    final localList = await ApiProvider.getCitiesApi(stateID);
    cities.addAll(localList);
    print("Prince cities of $stateID");
    print(cities);
  }

  void signupApi() async {
    // final bytes = File(selectedImagePath.value).readAsBytesSync();
    //String img64 = base64Encode(bytes);
    // print('Controolerimage64: ${img64}');

    CallLoader.loader();
    http.Response r = await ApiProvider.UserRegistrationApi(
      Name.text,
      Phone.text,
      EmailId.text,
      selectedState.value?.id.toString(),
      selectedCity.value?.id.toString(),
      Address.text,
      PinCode.text,
      selectedgender.value,
      dateofbirth.text,
    );
    if (r.statusCode == 200) {
      // CallLoader.hideLoader();
      Get.snackbar(
        'Success',
        'Registration SuccessFully Done',
        duration: const Duration(seconds: 2),
      );
      //  _loginMobileController.login();

      CallLoader.loader();
      await Future.delayed(Duration(seconds: 1));
      CallLoader.hideLoader();

      await Get.offAll(() => LoginScreen());
    }
  }

  ///....

  // image picker
  // void getImage(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().getImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagePath.value = pickedFile.path;
  //     selectedImageSize.value =
  //         ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
  //                 .toStringAsFixed(2) +
  //             " Mb";
  //   } else {
  //     Get.snackbar('Error', 'No Image Selected',
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white);
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    Name;
    Phone;
    EmailId;
    Address;
    PinCode;
    dateofbirth;
    state;
    city;
    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    dateofbirth = TextEditingController();
    dateofbirth.text = "YYY-MM-DD";
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
      return "Provide valid Email";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.length < 3) {
      return "Provide valid Email";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 3) {
      return "provide valid address";
    }
    return null;
  }

  String? validateState(String value) {
    if (value.length < 1) {
      return "provide valid address";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.length < 1) {
      return "provide valid address";
    }
    return null;
  }

  String? validatePin(String value) {
    if (value.length != 6) {
      return "provide valid pin";
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

  ///todo: here from this the main thing to choose...

  chooseDate() async {
    DateTime? newpickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.input,
      initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'Selected Date',
      //fieldHintText: 'Month/Date/Year',
      //selectableDayPredicate: disableDate,
    );
    if (newpickedDate != null) {
      selectedDate.value = newpickedDate;
      dateofbirth
        ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dateofbirth.text.length, affinity: TextAffinity.upstream));
    }
    // if (pickedDate != null && pickedDate != selectedDate) {
    //   selectedDate.value = pickedDate;
    //   appointmentController.text =
    //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
    // }
  }

  void checkSignupuser() {
    if (SignupFormKey.currentState!.validate()) {
      signupApi();
    }
    SignupFormKey.currentState!.save();
  }
}
