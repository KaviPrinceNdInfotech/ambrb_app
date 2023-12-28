import 'dart:convert';

import 'package:ambrd_appss/controllers/booking_vehicle_controller_common/vehicle_controller_new_comman.dart';
import 'package:ambrd_appss/controllers/booking_vehicle_controller_common/vehicle_detail_common_controller.dart';
import 'package:ambrd_appss/model/all_services_model.dart';
import 'package:ambrd_appss/model/ambulance_catagary_service_model.dart';
import 'package:ambrd_appss/model/banner_model.dart';
import 'package:ambrd_appss/model/comman_city_model/comman_city_model.dart';
import 'package:ambrd_appss/model/comman_state_model/state_model_commen.dart';
import 'package:ambrd_appss/model/driver_acceptlist_model/driver_acceptlist_model.dart';
import 'package:ambrd_appss/model/gallary_model.dart';
import 'package:ambrd_appss/model/get_profile_details.dart';
import 'package:ambrd_appss/model/get_wallet_model.dart';
import 'package:ambrd_appss/model/payment_history_model.dart';
import 'package:ambrd_appss/model/service_dertail_model.dart';
import 'package:ambrd_appss/model/user_list_model_indriver/user_list_model_indriverrr.dart';
import 'package:ambrd_appss/modules/firebase_notification_service/firebase_notification_servc.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/complaint_list_model.dart';
import '../model/profile_model.dart';
import '../model/registration_list_model.dart';
import '../model/slider_banner_model.dart';
import '../modules/home_page/home_page.dart';

var prefs = GetStorage();
NotificationServices notificationServices = NotificationServices();

class ApiProvider {
  //static var baseUrl = 'https://ambrdapi.ndinfotech.com/api/';

  static var baseUrl = 'http://admin.ambrd.in/api/';

  final img = 'http://admin.ambrd.in/Images/';

  // static String token = '';
//  static String Id = ''.toString();

  static String userId = ''.toString();
  static String ambulanceId = ''.toString();

  static String AdminLogin_Id = ''.toString();

  //AdminLogin_Id

  static String ServiceId = '';

  static String ambulancetypeid = '';

  static String lat = '';

  static String lng = '';

  static String lat2 = '';

  static String lng2 = '';

  static String vehicletypeid = '';

  static String PatientRegNo = '';

  static String DriverId = '';

  //  static String DriverId = '';
  //  static String DriverId = '';

  ///PatientRegNo
  //lat
  //lng
  //lat2
  //lng
  ///

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

  // static verifyOTP(var Otp, var MobileNo) async {
  //   var url = "https://jkroshini.com/api/Registration/OtpVerify";
  //   http.Response r = await http.post(
  //     Uri.parse(url),
  //     body: jsonEncode({"Otp": "$Otp", "MobileNo": "$MobileNo"}),
  //     headers: {
  //       "content-type": "application/json",
  //       "accept": "application/json",
  //     },
  //   );
  //   print("OtpVerify${r.body}");
  //   if (r.statusCode == 200) {
  //     return r;
  //   } else if (r.statusCode == 401) {
  //     Get.snackbar('message', r.body);
  //   } else {
  //     Get.snackbar('Error', r.body);
  //     return r;
  //   }
  // }.....

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

      //saved id....admin id......
      prefs.write("AdminLogin_Id".toString(),
          json.decode(r.body)['data']['AdminLogin_Id']);
      AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&user:${AdminLogin_Id}');

      prefs.write("userId".toString(), json.decode(r.body)['data']['UserId']);
      userId = prefs.read("userId").toString();
      print('&&&&&&&&&&&&&&&&&&&&&&user:${userId}');
      //saved id..........
      // prefs.write("Id".toString(), json.decode(r.body)['Id']);
      // Id = prefs.read("Id").toString();
      // print('&&&&&&&&&&&&&&&&&&&&&&:${Id}');

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

  ///todo: edit profile user...ambrb....8

  static EditUserApi(
    var PatientName,
    var StateMaster_Id,
    var CityMaster_Id,
    var Location,
    var PinCode,
  ) async {
    var url = '${baseUrl}PatientApi/EditProfile';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuser:${userId}');
    var body = {
      "Id": userId,
      "PatientName": "$PatientName",
      "StateMaster_Id": "14",
      "CityMaster_Id": "2",
      "Location": "$Location",
      "PinCode": "$PinCode",
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

  ///todo: banner apis.....ambrb................9
  static geProfileApi() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuserprofile:${userId}');
    var url = '${baseUrl}PatientApi/GetProfileDetail?Id=$userId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        GetProfileDetail getprofileModel = getProfileDetailFromJson(r.body);
        return getprofileModel;
      }
    } catch (error) {
      print('Errorprofile: ${error}');
      return;
    }
  }

  ///todo: bank detail...ambrb....10

  static AddBankDetailApi(
    var AccountNumber,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    var MobileNumber,
  ) async {
    var url = '${baseUrl}CommonApi/AddBankDetail';
    var prefs = GetStorage();
    AdminLogin_Id = prefs.read("AdminLogin_Id").toString();
    print('&&&&&&&&&&&&bankadmin:${AdminLogin_Id}');
    userId = prefs.read("userId").toString();
    print('&readuserbank:${userId}');
    var body = {
      "Login_Id": AdminLogin_Id,
      "AccountNumber": "$AccountNumber",
      "IFSCCode": "$IFSCCode",
      "BranchName": "$BranchName",
      "BranchAddress": "$BranchAddress",
      "HolderName": "$HolderName",
      "MobileNumber": "$MobileNumber"
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

  ///todo: edit bank detail...ambrb....111

  static EditBankDetailApi(
    var AccountNumber,
    var IFSCCode,
    var BranchName,
    var BranchAddress,
    var HolderName,
    //var MobileNumber,
  ) async {
    var url = '${baseUrl}CommonApi/UpdateBankDetail';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuserbank:${userId}');
    var body = {
      "Login_Id": AdminLogin_Id,
      "AccountNumber": "$AccountNumber",
      "IFSCCode": "$IFSCCode",
      "BranchName": "$BranchName",
      "BranchAddress": "$BranchAddress",
      "HolderName": "$HolderName",
      // "MobileNumber": "$MobileNumber"
    };
    print("ok1edit:${body}");
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

  ///todo: banner apis.....ambrb................11
  static allServicesApi() async {
    var url = '${baseUrl}CommonApi/GetAllService';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        AllServicesUser allservicesModel = allServicesUserFromJson(r.body);
        return allservicesModel;
      }
    } catch (error) {
      print('Errorprofile: ${error}');
      return;
    }
  }

  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // var AmbulancelistssId = preferences.getString("AmbulancelistssId");
  // print("AmbulancelistssId: ${AmbulancelistssId}");

  ///todo: banner apis.....ambrb................12
  static detailServicesbApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ServiceId = preferences.getString("ServiceId");
    print("ServiceId: ${ServiceId}");
    var url = '${baseUrl}CommonApi/GetIndividualService?Id=$ServiceId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        ServiceDetailModel detailservicesModel =
            serviceDetailModelFromJson(r.body);
        return detailservicesModel;
      }
    } catch (error) {
      print('Errorprofiledskd: ${error}');
      return;
    }
  }

  ///todo: complain..api...ambrb....13

  static ComplainPatientApi(
    var Complaints,
    var Subjects,
    var Others,
  ) async {
    var url = '${baseUrl}PatientApi/PatientComplaints';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuserbankuse:${userId}');
    var body = {
      "Login_Id": userId,
      "Complaints": "$Complaints",
      "Subjects": "$Subjects",
      "Others": "$Others",
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

  ///todo: get wallet api .....ambrb................14
  static getwalletAmountApi() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuserbankusxce:${userId}');
    var url = '${baseUrl}WalletApi/GetWalletAmount?id=$userId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        WalletAmountModel walletmoneyModel = walletAmountModelFromJson(r.body);
        return walletmoneyModel;
      }
    } catch (error) {
      print('FrenchiesBannerRRRErsdss: ${error}');
      return;
    }
  }

  ///todo:

  ///todo:wallet post api..........................................wallet......section.....15
  static WalletPostApi(var UserId, var walletAmount) async {
    var url = "${baseUrl}WalletApi/AddWalletAmount";
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuserbankusxce:${userId}');
    var body = {
      // "UserId": UserId,
      "UserId": userId,
      "walletAmount": walletAmount,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      print('kjkjkljjkx x l:${userId}');

      return r;
    } else if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo:wallet post update api.............................16
  static WalletPostUpdateApi(var UserId, var walletAmount) async {
    var url = "${baseUrl}WalletApi/UpdateWalletAmount";
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&readuserbankusxce:${userId}');

    var body = {
      // "UserId": UserId,
      "UserId": userId,
      "walletAmount": walletAmount,
    };
    // final headers = {"Authorization": "Bearer $token"};

    print(body);
    http.Response r = await http.post(Uri.parse(url), body: body);
    print(url);
    print(r.body);
    print(r.statusCode);

    if (r.statusCode == 200) {
      return r;
    } else if (r.statusCode == 200) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error', r.body);
      return r;
    }
  }

  ///todo: ambulance type api ........................17
  static Future<List<Vehicle>?> getambulancecatagaryApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancelistssId = preferences.getString("AmbulancelistssId");
    print("AmbulancelistssId: ${AmbulancelistssId}");
    var url = "http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=1";

    ///"http://test.pswellness.in/api/VehicleTypeApi/Vehicle?id=$AmbulancelistssId";
    //"1";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("AmbulancelistssIdsuccess: ${AmbulancelistssId}");
        print("AmbulancelistssIdurl: ${url}");

        var ambulanceData = ambulancecatagarybyIdFromJson(r.body);
        return ambulanceData.vehicle;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///get_vehicle_type_api..................todo...18

  static
      //Future<List<VehicleDetaile>?>
      getvechilebyidApi(String ambulancecatagaryID) async {
    var url =
        "http://test.pswellness.in/api/VehicleTypeApi/VehicleType?id=$ambulancecatagaryID";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        var vehiceData = vehicletypebycatagaryIdFromJson(r.body);
        return vehiceData.vehicleDetailes;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }

  ///todo: google post ambulance api on ........,,,,,,.....................19

  static GooglebookambulanceApi(
    var start_Lat,
    var start_Long,
    var end_Long,
    var end_Lat,
    var NoOfPassengers,
    var offer,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancecatserviceId = preferences.getString("AmbulancecatserviceId");
    print("AmbulancecatserviceId: ${AmbulancecatserviceId}");
    //todo:...............
    var url = '${baseUrl}DriverApi/GetNearDriverByVehicleTypeId';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');

    var body = {
      "start_Lat": start_Lat.toString(),
      "start_Long": start_Long.toString(),
      "end_Long": end_Lat.toString(),
      //end_Lat.toString()
      "end_Lat": end_Long.toString(),
      "Patient_Id": userId,
      "VehicleType_id": "${AmbulancecatserviceId}",
      "NoOfPassengers": NoOfPassengers,
      "offer": offer
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      ///
      print("bbbbbody${body}");
      print("rbody${r.body}");
      //saved id..........
      var prefs = GetStorage();
      prefs.write("ambulancetypeid".toString(),
          json.decode(r.body)['AmbulanceType_id']);
      ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      print('&userdriambulance:${ambulancetypeid}');

      ///lat
      prefs.write("lat".toString(), json.decode(r.body)['start_Lat']);
      lat = prefs.read("start_Lat").toString();
      print('&userdriverlat:${start_Lat}');

      ///lng
      prefs.write("lng".toString(), json.decode(r.body)['start_Long']);
      lng = prefs.read("start_Long").toString();
      print('&user33lng33:${start_Long}');

      ///lat2
      prefs.write("lat2".toString(), json.decode(r.body)['end_Lat']);
      lat2 = prefs.read("end_Lat").toString();
      print('&userdriverlat21:${end_Lat}');

      ///lng2
      prefs.write("lng2".toString(), json.decode(r.body)['end_Long']);
      lng2 = prefs.read("end_Long").toString();
      print('&user33lng:${end_Long}');

      ///vehicle
      prefs.write(
          "vehicletypeid".toString(), json.decode(r.body)['VehicleType_id']);
      vehicletypeid = prefs.read("VehicleType_id").toString();
      print('&user33vehicleid:${vehicletypeid}');

      ///driverid
      ///userdriverid
      // prefs.write("userdriverid".toString(),
      //     json.decode(r.body)['Message'][1]);
      // userdriverid = prefs.read("DriverId");
      // print('&user33vehicleid667eee:${VehicleType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Send Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: google post ambulance api on ....offer post driver by user.....,,,,,......200..

  static OfferBypatientApi(
    var OfferPrice,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancecatserviceId = preferences.getString("AmbulancecatserviceId");
    print("AmbulancecatserviceId: ${AmbulancecatserviceId}");
    //todo:...............
    //http://admin.ambrd.in/api/PatientApi/RequestOffer
    var url = '${baseUrl}PatientApi/RequestOffer';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');
    var body = {
      "VehicleType_id": "$AmbulancecatserviceId",
      "Patient_Id": "$userId",
      "OfferPrice": "$OfferPrice"
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print("bvehicletypwee${AmbulancecatserviceId}");
    print("uid33${userId}");
    print("OfferPrice33: ${OfferPrice}");

    print(r.body);
    if (r.statusCode == 200) {
      Get.snackbar('Successful', r.body);

      ///ambulance..
      ///
      print("bbbbbodyza${body}");
      print("rbodyaz${r.body}");
      //saved id..........
      var prefs = GetStorage();
      prefs.write("ambulancetypeid".toString(),
          json.decode(r.body)['AmbulanceType_id']);
      ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      print('&userdriambulance:${ambulancetypeid}');

      ///vehicle
      prefs.write(
          "vehicletypeid".toString(), json.decode(r.body)['VehicleType_id']);
      vehicletypeid = prefs.read("VehicleType_id").toString();
      print('&user33vehicleid:${vehicletypeid}');

      ///driverid
      ///userdriverid
      // prefs.write("userdriverid".toString(),
      //     json.decode(r.body)['Message'][1]);
      // userdriverid = prefs.read("DriverId");
      // print('&user33vehicleid667eee:${VehicleType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Send Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: here from post request all post api......201...19dec..2023..
  static AcceptallPostApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancecatserviceId = preferences.getString("AmbulancecatserviceId");
    print("AmbulancecatserviceId: ${AmbulancecatserviceId}");
    var prefs = GetStorage();
    print('&userdriambulance:${ambulancetypeid}');
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    var startLat5 = preferences.getString("startLat5");
    print("driverlistssId88899: ${startLat5}");
    //lat1
    var startLong5 = preferences.getString("startLong5");
    print("driverlistssId88899: ${startLong5}");
    //lat1
    var endLat5 = preferences.getString("endLat5");
    print("lat133: ${endLat5}");
    //lat1
    var endLong5 = preferences.getString("endLong5");
    print("lng244: ${endLong5}");
    //lat1

    var url = '${baseUrl}PatientApi/RequestToAll';

    var body = {
      //"start_Lat": "$startLat5",
      // "start_Long": "$startLong5",
      // "end_Long": "$endLong5",
      // "end_Lat": "$endLat5",
      "Patient_Id": userId,
      //"VehicleType_id": "${AmbulancecatserviceId}",
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", r.body);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: here from post request individual post api......201...19dec..2023..
  static AcceptIndividualPostApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var AmbulancecatserviceId = preferences.getString("AmbulancecatserviceId");
    print("AmbulancecatserviceId: ${AmbulancecatserviceId}");

    var driverId = preferences.getString("driverId");
    print("driverId: ${driverId}");
    //driverId
    var prefs = GetStorage();
    print('&userdriambulance:${ambulancetypeid}');
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    var startLat5 = preferences.getString("startLat5");
    print("driverlistssId88899: ${startLat5}");
    //lat1
    var startLong5 = preferences.getString("startLong5");
    print("driverlistssId88899: ${startLong5}");
    //lat1
    var endLat5 = preferences.getString("endLat5");
    print("lat133: ${endLat5}");
    //lat1
    var endLong5 = preferences.getString("endLong5");
    print("lng244: ${endLong5}");
    //lat1

    var url = '${baseUrl}PatientApi/BookDriver';

    var body = {
      "Driver_Id": "$driverId",
      "Patient_Id": userId,
      // "end_Long": "$endLong5",
      // "end_Lat": "$endLat5",
      // "Patient_Id": userId,
      // "VehicleType_id": "${AmbulancecatserviceId}",
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    print("bodyyy123: ${r.body}");
    //print(r.body);
    if (r.statusCode == 200) {
      print("bodyyy1234: ${r.body}");

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", r.body);
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: online payment ....................20
  static AmbulancepaynowOnlineApi() async {
    //var url = '${baseUrl}PatientApi/DriverPayNow';
    var url = 'http://admin.ambrd.in/api/PatientApi/DriverPayNow';
    //http://admin.ambrd.in/api/PatientApi/DriverPayNow
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');

    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistssId = preferences.getString("driverlistssId");
    print("driverlistssId: ${driverlistssId}");
    //doctor fees.....
    var drivertotalamount = preferences.getString("drivertotalamount");
    print("drivertotalamount: ${drivertotalamount}");
    var ambulanceFee = preferences.getString("ambulanceFee");
    print("ambulanceFee: ${drivertotalamount}");

    var ListpayId = preferences.getString("ListpayId");
    print("ListpayId: ${drivertotalamount}");
    // ambulanceFee

    //Labfeess......
    //    "Id":"147",
    ///list id 147
    ///ListpayId
    //     "PatientId": "7",
    //     "DriverId": "1",
    //     "Amount": "1000"

    var body = {
      "Id": "$ListpayId",
      "PatientId": userId,
      "DriverId": "$driverlistssId",
      "Amount": "$ambulanceFee",
    };
    print("ambulanceonline444:${body}");

    // print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    // print(r.body);
    if (r.statusCode == 200) {
//adminId
      print("ambulanceonline:${body}");
      Get.snackbar('Success', r.body);

      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Error1088', r.body);
      return r;
    }
  }

  ///todo: accepted driver list  ambrd message screen...user api..21 ........21 dec 2023....
  static AcceptDriverDetailUserApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistbookingId = preferences.getString("driverlistbookingId");
    print("driverlistbookingId: ${driverlistbookingId}");
    //driverlistbookingId
    //http://admin.ambrd.in/api/PatientApi/GetAcceptedReqDriverDetail?Id=1
    var url =
        '${baseUrl}PatientApi/GetAcceptedReqDriverDetail?Id=$driverlistbookingId';
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        print("ambulanceonlinerrreeeww:${r.body}");
        print("ambulanceonlinerrreeeww:${url}");

        DriveracceptModeluser driveracceptuserDetail =
            driveracceptModeluserFromJson(r.body);
        return driveracceptuserDetail;
      }
    } catch (error) {
      return;
    }
  }

  ///todo:driver list of accept reject list 2.............22
  static UserListUserrApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var nurseLocationId = preferences.getString("nurseLocationId");
    print("nurseLocationId: ${nurseLocationId}");
    var url =
        "http://test.pswellness.in/api/DriverApi/UserListForBookingAmbulance";
    try {
      http.Response r = await http.get(Uri.parse(url));
      print(r.body.toString());
      if (r.statusCode == 200) {
        print("userlistIdUrl77: ${url}");
        print("userlistIdUrl774343: ${r.body}");
        UserListModeldriver? userListModeldriver =
            userListModeldriverFromJson(r.body);
        return userListModeldriver;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: payment history......

  /// todo driverPaymentHistory...................
  static UserPaymentHistory() async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');
    var url = '${baseUrl}PatientApi/DriverBookingHistory?PatientId=$userId';
    //176
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        //DriverAppoinmentDetailModel driverAppoinmentDetail =
        //             driverAppoinmentDetailModelFromJson(r.body);
        DriverPaymentHistoryModel driverPaymentHistoryModel =
            driverPaymentHistoryModelFromJson(r.body);
        return driverPaymentHistoryModel;
      }
    } catch (error) {
      return;
    }
  }

  ///todo: reject driver list july 2023....user api......24

  static RejectrequestdriverApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driacceptrejectlistid = preferences.getString("driacceptrejectlistid");
    print("driacceptrejectlistid: ${driacceptrejectlistid}");
    //http://test.pswellness.in/api/DriverApi/AmbulanceReject
    var url = '${baseUrl}api/DriverApi/AmbulanceReject';
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');

    var body = {
      "Id": "${driacceptrejectlistid}",
      "DriverId": userId,
      //"StatusId": "${0}",
    };
    //
    print("rejectt:${body}");
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      // var prefs = GetStorage();
      // prefs.write("ambulancetypeid".toString(),
      //     json.decode(r.body)['AmbulanceType_id']);
      // ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      // print('&userdriambulance:${AmbulanceType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Reject Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: accept ambulance api on of user.......14 july 2023.......25,,,,,,.....................

  static AcceptrequestdriverApi() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driacceptrejectlistid = preferences.getString("driacceptrejectlistid");
    print("driacceptrejectlistid: ${driacceptrejectlistid}");
    var url = '${baseUrl}api/DriverApi/BookingAmbulanceAcceptReject';
    // http://test.pswellness.in/api/DriverApi/BookingAmbulanceAcceptReject
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');

    var body = {
      "Id": "${driacceptrejectlistid}",
      "DriverId": userId,
      "StatusId": "${1}",

      ///for testing perpose i am....up...0
      ///

      ///this is the main actual down..1
      //"StatusId": "${1}",
    };
    //
    print("acceptttt:${body}");
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      ///ambulance..
      //saved id..........
      // var prefs = GetStorage();
      // prefs.write("ambulancetypeid".toString(),
      //     json.decode(r.body)['AmbulanceType_id']);
      // ambulancetypeid = prefs.read("AmbulanceType_id").toString();
      // print('&userdriambulance:${AmbulanceType_id}');

      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Accept Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo: from here we have to book app2......26
  static Googlebookambulance2Api(
      //var start_Lat,
      // var start_Long,
      // var end_Long,
      // var end_Lat,
      // var Patient_Id,
      // var Driver_Id,
      // var AmbulanceType_id,
      // var VehicleType_id,
      ) async {
    var prefs = GetStorage();
    userId = prefs.read("userId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usergoogle:${userId}');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var driverlistssId = preferences.getString("driverlistssId");
    print("driverlistssId88899: ${driverlistssId}");
    //lat1
    var lng1 = preferences.getString("lng1");
    print("driverlistssId88899: ${lng1}");
    //lat1
    var lat1 = preferences.getString("lat1");
    print("lat133: ${lat1}");
    //lat1
    var lng2 = preferences.getString("lng2");
    print("lng244: ${lng2}");
    //lat1
    var lat2 = preferences.getString("lat2");
    print("lat2221: ${lat2}");
    //lat1
    var ambulance1 = preferences.getString("ambulance1");
    print("ambulance1211: ${ambulance1}");
    //lat1
    var vehicle1 = preferences.getString("vehicle1");
    print("vehicle122: ${vehicle1}");

    var url = '${baseUrl}api/DriverApi/BookDriver';

    var body = {
      "start_Lat": "$lat1",
      "start_Long": "$lng1",
      "end_Long": "$lng2",
      "end_Lat": "$lat2",
      "Patient_Id": userId,
      "Driver_Id": "$driverlistssId",
      "AmbulanceType_id": "$ambulance1",
      //AmbulanceType_id,
      "VehicleType_id": "$vehicle1",
    };
    //
    print(body);
    http.Response r = await http.post(
      Uri.parse(url), body: body,
      //headers: headers
    );
    //print(r.body);
    if (r.statusCode == 200) {
      print(r.body);
      print(r.statusCode);
      Get.snackbar("Booking Status", 'Request Send Successfully');
      return r;
    } else if (r.statusCode == 401) {
      Get.snackbar('message', r.body);
    } else {
      Get.snackbar('Errorgoogle', r.body);
      return r;
    }
  }

  ///todo:vechile catagary service api.............27
  static servicecatagaryvehicleApi() async {
    var url = "${baseUrl}CommonApi/GetVehicleType";
    try {
      http.Response r = await http.get(Uri.parse(url));
      if (r.statusCode == 200) {
        AmbulanceCatServiceModel? ambulancecatserviceModel =
            ambulanceCatServiceModelFromJson(r.body);

        ///print("terms: ${ambulancecatserviceModel.vehicles?[0].id}");
        return ambulancecatserviceModel;
      }
    } catch (error) {
      print('galary: $error');
    }
  }

  ///todo: device token api....
  ///todo: device  user token for user........

  static UserdevicetokenApi() async {
    var url = '${baseUrl}api/DriverApi/UpadateDiviceId';

    var prefs = GetStorage();
    PatientRegNo = prefs.read("PatientRegNo").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${PatientRegNo}');
    //var prefs = GetStorage();
    DriverId = prefs.read("DriverId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${DriverId}');
    notificationServices.getDeviceToken().then((value) async {
      var data = {
        //this the particular device id.....
        'to':
            //this is dummy token...
            "ugug6t878",

        ///this is same device token....
      };

      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
          }).then((value) {
        if (kDebugMode) {
          print(value.body.toString());
        }
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error);
        }
      });
      //DriverId
      var body = {
        "UserId": "${PatientRegNo}",
        "DeviceId": "${value.toString()}",
      };
      print("userrrtokenupdateuser${body}");
      http.Response r = await http.post(
        Uri.parse('http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
        body: body,
      );

      print(r.body);
      if (r.statusCode == 200) {
        print("userrrtokenupdatdricvfe3333${body}");
        return r;
      } else if (r.statusCode == 401) {
        Get.snackbar('message', r.body);
      } else {
        Get.snackbar('Error', r.body);
        return r;
      }

      ///todo end post api from backend...
    });

    ///
//user password........
//     userPassword = prefs.read("Password").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${userPassword}');
//
//     var body = {
//       "UserId": "$PatientRegNo",
//       "DeviceId": "fefewfefewf21331",
//     };
//     print("userrrtokenupdateeeddbefore${body}");
//
//     //print(body);
//     http.Response r = await http.post(
//       Uri.parse(url), body: body,
//       //headers: headers
//     );
//     print(r.body);
//     if (r.statusCode == 200) {
//       print("userrrtokenupdateeedd${body}");
//       Get.snackbar('message', "${r.body}",
//           duration: (Duration(milliseconds: 900)));
//
//       return r;
//     } else if (r.statusCode == 401) {
//       Get.snackbar('message', r.body);
//     } else {
//       Get.snackbar('Error', r.body);
//       return r;
//     }
  }

  ///todo: driver token............

  static DriverdevicetokenApi() async {
    var prefs = GetStorage();
    DriverId = prefs.read("DriverId").toString();
    print('&&&&&&&&&&&&&&&&&&&&&&usecredentialspassword:${DriverId}');
    notificationServices.getDeviceToken().then((value) async {
      var data = {
        //this the particular device id.....
        'to':
            //this is dummy token...
            "ugug6t878",

        ///this is same device token....
      };

      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                //'key=d6JbNnFARI-J8D6eV4Akgs:APA91bF0C8EdU9riyRpt6LKPmRUyVFJZOICCRe7yvY2z6FntBvtG2Zrsa3MEklktvQmU7iTKy3we9r_oVHS4mRnhJBq_aNe9Rg8st2M-gDMR39xZV2IEgiFW9DsnDp4xw-h6aLVOvtkC'
                'key=AAAASDFsCOM:APA91bGLHziX-gzIM6srTPyXPbXfg8I1TTj4qcbP3gaUxuY9blzHBvT8qpeB4DYjaj6G6ql3wiLmqd4UKHyEiDL1aJXTQKfoPH8oG5kmEfsMs3Uj5053I8fl69qylMMB-qikCH0warBc'
          }).then((value) {
        if (kDebugMode) {
          print(value.body.toString());
        }
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error);
        }
      });
      //DriverId
      var body = {
        "UserId": "${DriverId}",
        "DeviceId": value.toString(),
      };
      print("userrrtokenupdateuser${body}");
      http.Response r = await http.post(
        Uri.parse('http://test.pswellness.in/api/DriverApi/UpadateDiviceId'),
        body: body,
      );

      print(r.body);
      if (r.statusCode == 200) {
        print("userrrtokenupdatdricvfe3333${body}");
        return r;
      } else if (r.statusCode == 401) {
        Get.snackbar('message', r.body);
      } else {
        Get.snackbar('Error', r.body);
        return r;
      }
    });

//     var url = '${baseUrl}api/DriverApi/UpadateDiviceId';
//
//     var prefs = GetStorage();
//     DriverId = prefs.read("DriverId").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&usecredentials:${DriverId}');
// //user password........
//     driverpassword = prefs.read("driverpassword").toString();
//     print('&&&&&&&&&&&&&&&&&&&&&&drivecredentialspassword:${driverpassword}');
//
//     var body = {
//       "UserId": "$DriverId".toString(),
//       "DeviceId": "fefewfefewf21331werwqrwqr".toString(),
//     };
//     print(body);
//     http.Response r = await http.post(
//       Uri.parse(url), body: body,
//       //headers: headers
//     );
//     print(r.body);
//     if (r.statusCode == 200) {
//       return r;
//     } else if (r.statusCode == 401) {
//       Get.snackbar('message', r.body);
//     } else {
//       Get.snackbar('Error', r.body);
//       return r;
//     }
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
