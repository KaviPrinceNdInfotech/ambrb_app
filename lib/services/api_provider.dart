import 'dart:convert';

import 'package:ambrd_appss/model/banner_model.dart';
import 'package:ambrd_appss/model/comman_city_model/comman_city_model.dart';
import 'package:ambrd_appss/model/comman_state_model/state_model_commen.dart';
import 'package:ambrd_appss/model/gallary_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/complaint_list_model.dart';
import '../model/profile_model.dart';
import '../model/registration_list_model.dart';
import '../model/slider_banner_model.dart';
import '../modules/home_page/home_page.dart';

class ApiProvider {
  static var baseUrl = 'https://ambrdapi.ndinfotech.com/api/';
  // static String token = '';
//  static String Id = ''.toString();

  static String Id = ''.toString();

  ///todo: state api....ambed ...1
  static Future<List<StateModel>> getSatesApi() async {
    var url = '${baseUrl}CommonApi/GetAllStates';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var statesData = statesModelFromJson(r.body);
        return statesData.states;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: apbrb get_cities_api...........2
  static Future<List<City>> getCitiesApi(String stateID) async {
    var url = '${baseUrl}CommonApi/GetCitiesByState?stateId=$stateID';
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var citiesData = cityModelFromJson(r.body);
        return citiesData.cities;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: gallary apis.....ambrb................3
  static galarryGetApi() async {
    var url = '${baseUrl}CommonApi/GetGallery';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        GallaryModel gallaryModel = gallaryModelFromJson(r.body);
        return gallaryModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: banner apis.....ambrb................4
  static getbannerGetApi() async {
    var url = '${baseUrl}CommonApi/GetBanner';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        BannerModel bannerModel = bannerModelFromJson(r.body);
        return bannerModel;
      }
    } catch (error) {
      print('FrenchiesBannerRRRError: ${error}');
      return;
    }
  }

  ///todo: user registration...ambrb....4

  static UserRegistrationApi(
    var PatientName,
    var MobileNumber,
    var EmailId,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var PinCode,
    var Gender,
    var DOB,
  ) async {
    var url = '${baseUrl}SignupApi/PatientRegistration';
    var body = {
      "PatientName": "$PatientName",
      "MobileNumber": "$MobileNumber",
      "EmailId": "$EmailId",
      "StateMaster_Id": "$StateMaster_Id",
      "CityMaster_Id": "$CityMaster_Id",
      "Location": "$Location",
      "PinCode": "$PinCode",
      "Gender": "$Gender",
      "DOB": "$DOB",
    };
    print("ok1:${body}");
    http.Response r = await http.post(
      Uri.parse(url),
      body: body,
    );
    print("okup:${r.body}");
    if (r.statusCode == 200) {
      print(r.body);
      Get.snackbar(
        'Success',
        r.body,
        duration: const Duration(seconds: 2),
      );
      print(r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar(
        'Message',
        r.body,
        duration: Duration(seconds: 2),
      );
    } else {
      Get.snackbar('Error', r.body, duration: Duration(seconds: 2));
      return r;
    }
  }

  ///todo: ambrb banner api.........................................5

  static OtpApi(var Otp, var MobileNo) async {
    var url = "https://jkroshini.com/api/Registration/OtpVerify";
    http.Response r = await http.post(
      Uri.parse(url),
      body: jsonEncode({"Otp": "$Otp", "MobileNo": "$MobileNo"}),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    print("OtpVerify${r.body}");
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: login with phone api.....6

  static PhoneLoginApi(
    var MobileNumber,
  ) async {
    var url = '${baseUrl}CommonApi/LoginWithMobile';
    var body = {
      "MobileNumber": MobileNumber,
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      // var prefs = GetStorage();
      // //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      // prefs.write("token".toString(), json.decode(r.body)['token']);
      // token = prefs.read("token").toString();
      // print(token);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///TODO: otp verify section......................7.....

  static verifyOTP(var MobileNumber, var OTP) async {
    var url = '${baseUrl}CommonApi/MobileOtpVerify';
    var body = {
      'MobileNumber': "$MobileNumber",
      'OTP': "$OTP",
    };
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print(r.body);
    if (r.statusCode == 200) {
      var prefs = GetStorage();
      //saved id..........
      prefs.write("Id".toString(), json.decode(r.body)['Id']);
      Id = prefs.read("Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

      //saved token.........
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
    // http.Response r = await http.post(Uri.parse(url), body: body);
    // print(r.body);
    // if (r.statusCode == 200) {
    //   var data = json.decode(r.body)['message'];
    //   var prefs = GetStorage();
    //   prefs.write("token", json.decode(r.body)['token']);
    //   token = prefs.read("token");
    //   return r;
    // } else {
    //   Get.snackbar('Error', 'Wrong Otp');
    //   return null;
    // }
  }

  ///end.... ambrd user app.............

  ///old....... from here verify otp.........................................

  static PhoneEmailApi(var MobileNo) async {
    final String url = "https://jkroshini.com/api/registration/MobileOtp";
    http.Response r = await http.post(
      Uri.parse(
        url,
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: jsonEncode({"MobileNo": MobileNo}),
    );
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  static verifyOTP2(var MobileNo, var Otp) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    var url = "https://jkroshini.com/api/Registration/OtpVerify";
    http.Response r = await http.post(Uri.parse(url),
        headers: headers,
        /*{
          "content-type" : "application/json",
          "accept" : "application/json",
        },*/
        body: jsonEncode({
          'MobileNo': "MobileNo",
          'Otp': "Otp",
        }));
    print(r.body);
    if (r.statusCode == 200) {
      return r;
    } else {
      Get.to(() => HomePage());
      // Get.snackbar('Error', 'Wrong Otp');
      return null;
    }
  }

  //add  technician........................................................
  static addTechnicianApi(var Name, var Mobile, var Address) async {
    try {
      var url = 'https://jkroshini.com/api/Technician/AddTechnician';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "Name": Name,
          "Mobile": Mobile,
          "Address": Address,
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //add services
  static addServicesApi(
    String Name,
  ) async {
    try {
      var url = 'https://jkroshini.com/api/Product/AddProduct';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "Name": Name,
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  //Complaint List Open
  static complaintListOpenApi() async {
    var url =
        'https://jkroshini.com/api/RegistrationComplain/GetComplainListOpen';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        ComplaintListOpenModel complainListOpenModel =
            complaintListOpenModelFromJson(r.body);
        return complainListOpenModel;
      }
    } catch (error) {
      return;
    }
  }

  //Complaint List Close
  static complaintListCloseApi() async {
    var url =
        'https://jkroshini.com/api/RegistrationComplain/GetComplainListClose';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        ComplaintListCloseModel complainListCloseModel =
            complaintListCloseModelFromJson(r.body);
        return complainListCloseModel;
      }
    } catch (error) {
      return;
    }
  }

  //ComplaintList Pending
  static complaintListPendingApi() async {
    var url = 'https://jkroshini.com/api/RegistrationComplain/GetComplainList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        ComplaintListPendingModel complainListModel =
            complaintListPendingFromJson(r.body);
        return complainListModel;
      }
    } catch (error) {
      return;
    }
  }

  // Complain Register
  static ComplainRegister(
    var Name,
    var Mobile,
    var Address,
    var dropdownValue,
    var ProductId,
  ) async {
    Map map = {
      "Name": Name,
      "Mobile": Mobile,
      "Address": Address,
      "TypeOfServices": dropdownValue,
      "ProductId": ProductId,
    };
    final String url =
        "https://jkroshini.com/api/RegistrationComplain/AddComplain";
    http.Response r = await http.post(
      Uri.parse(
        url,
      ),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(map),
    );
    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
      print('response2: ${r.body.toString()}');
    } else {
      Get.snackbar('Error', r.body);
      print('response3: ${r.body.toString()}');
      return r;
    }
  }

  // Profile
  static profileApi() async {
    var url =
        'https://jkroshini.com/api/Registration/GetProfile/sdafadsfdsaf3452345243';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        Profile profile = profileFromJson(r.body);
        return profile;
      }
    } catch (error) {
      return;
    }
  }

  // signup register
  static registerApi(var Name, var Number, var ShopName, var Address,
      var AadharName, Servicetype, var Password, img) async {
    print('ApiimagePath: ${img.toString()}');
    try {
      var url = 'https://jkroshini.com/api/Registration/Registration';
      http.Response r = await http.post(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode({
          "Name": Name,
          "Number": Number,
          "ShopName": ShopName,
          "Address": Address,
          "AadharName": AadharName,
          "Servicetype": Servicetype,
          "Password": Password,
          "Image": img
        }),
      );
      print(r.body);
      if (r.statusCode == 200) {
        return r;
      } else {
        Get.snackbar('Error', 'SignUp Fail');
        return r;
      }
    } catch (e) {
      print('Error');
      print(e.toString());
    }
  }

  // banner Api
  static SliderBannerApi() async {
    var url =
        'https://jkroshini.com/api/Registration/GetBanner/1'; //baseUrl + 'api/AdminApi/BannerImage';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        SliderListModel sliderbanerlist = sliderListModelFromJson(r.body);
        print(
            'sliderBannerApi: ${sliderbanerlist.result?[0].image.toString()}');
        return sliderbanerlist;
      }
    } catch (error) {
      return;
    }
  }

  // Registration List
  static RegistrationListApi() async {
    var url = 'https://jkroshini.com/api/Registration/GetRegistrationList';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        RegistrationListModel registrationListModel =
            registrationListFromJson(r.body);
        print(
            'registrationListModel: ${registrationListModel.result?[0].name}');
        return registrationListModel;
      }
    } catch (error) {
      print('RegistrationListError : ${error}');
    }
  }
}
