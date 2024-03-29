import 'package:ambrd_appss/controllers/get_profile_detail_controller/get_profile_details_controller.dart';
import 'package:ambrd_appss/model/comman_city_model/comman_city_model.dart';
import 'package:ambrd_appss/model/comman_state_model/state_model_commen.dart';
import 'package:ambrd_appss/model/get_profile_details.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class EditprofileController extends GetxController {
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> EditprofileFormKey = GlobalKey<FormState>();

  GetProfileController _getProfileController = Get.put(GetProfileController());

  ///this is radio button function......
  var selectedService = ''.obs;
  //image picker
  // var selectedImagePath = ''.obs;
  // var selectedImageSize = ''.obs;

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

  TextEditingController PatientName = TextEditingController();
  TextEditingController StateMaster_Id = TextEditingController();
  TextEditingController CityMaster_Id = TextEditingController();
  TextEditingController Location = TextEditingController();
  TextEditingController PinCode = TextEditingController();

  //    _lastNameController.text = User.instance.last_name;

  ///final String PatientName = _getProfileController.text;

  ///....
  var namee = '';
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

  //RxBool isLoading = true.obs;
  GetProfileDetail? getProfileDetail;
  //crusial slider banner api............

  // Future<void> editProfileApi2() async {
  //   isLoading(true);
  //   getProfileDetail = await ApiProvider.geProfileApi();
  //   if (getProfileDetail!.pinCode != null) {
  //     // onInit();
  //     print("ookoddee43434${getProfileDetail!.pinCode}");
  //
  //     isLoading(false);
  //   } else {}
  // }

  void editprofileApi() async {
    // final bytes = File(selectedImagePath.value).readAsBytesSync();
    //String img64 = base64Encode(bytes);
    // print('Controolerimage64: ${img64}');
    isLoading(false);

    //CallLoader.loader();
    http.Response r = await ApiProvider.EditUserApi(
      PatientName.text,
      selectedState.value?.id.toString() ??
          _getProfileController.getProfileDetail?.stateMasterId,
      selectedCity.value?.id.toString() ??
          _getProfileController.getProfileDetail?.cityMasterId,
      Location.text,
      PinCode.text,
    );

    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      // Get.snackbar('Success', 'Edit profile SuccessFully');
      //_loginMobileController.login();

      CallLoader.loader();
      await Future.delayed(Duration(milliseconds: 1000));
      CallLoader.hideLoader();

      await Get.offAll(() => BottommNavBar());

      isLoading(false);
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
    ///  editProfileApi2();

    ///await _loadData();

    PatientName = TextEditingController(
        text:
            "${_getProfileController.getProfileDetail?.patientName.toString() ?? 0}");
    //= TextEditingController(text: "${okok}");
    //PatientName;
    Location = TextEditingController(
        text:
            "${_getProfileController.getProfileDetail?.location.toString() ?? 0}");
    PinCode = TextEditingController(
        text: "${_getProfileController.getProfileDetail?.pinCode ?? 0}");
    StateMaster_Id;
    CityMaster_Id;
    super.onInit();

    getStateApi();
    selectedState.listen((p0) {
      if (p0 != null) {
        getCityByStateID("${p0.id}");
      }
    });
    // dateofbirth = TextEditingController();
    // dateofbirth.text = "YYY-MM-DD";
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

  String? validpin(String value) {
    if (value.length != 6) {
      return "provide valid pin";
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

  // chooseDate() async {
  //   DateTime? newpickedDate = await showDatePicker(
  //     context: Get.context!,
  //     initialDate: selectedDate.value,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2025),
  //     initialEntryMode: DatePickerEntryMode.input,
  //     initialDatePickerMode: DatePickerMode.year,
  //     helpText: 'Select DOB',
  //     cancelText: 'Close',
  //     confirmText: 'Confirm',
  //     errorFormatText: 'Enter valid date',
  //     errorInvalidText: 'Enter valid date range',
  //     fieldLabelText: 'Selected Date',
  //     //fieldHintText: 'Month/Date/Year',
  //     //selectableDayPredicate: disableDate,
  //   );
  //   if (newpickedDate != null) {
  //     selectedDate.value = newpickedDate;
  //     dateofbirth
  //       ..text = DateFormat('yyyy-MM-d').format(selectedDate.value).toString()
  //       ..selection = TextSelection.fromPosition(TextPosition(
  //           offset: dateofbirth.text.length, affinity: TextAffinity.upstream));
  //   }
  //   // if (pickedDate != null && pickedDate != selectedDate) {
  //   //   selectedDate.value = pickedDate;
  //   //   appointmentController.text =
  //   //       DateFormat('DD-MM-yyyy').format(selectedDate.value).toString();
  //   // }
  // }

  void checkeditprofileuser() {
    if (EditprofileFormKey.currentState!.validate()) {
      editprofileApi();
    }
    EditprofileFormKey.currentState!.save();
  }
}
