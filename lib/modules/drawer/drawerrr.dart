import 'package:ambrd_appss/controllers/booking_boking_history.dart';
import 'package:ambrd_appss/controllers/edit_bank_controller/edit_bank_detail_controller.dart';
import 'package:ambrd_appss/controllers/edit_profile_controller/edit_profile_controllerr.dart';
import 'package:ambrd_appss/controllers/get_profile_detail_controller/get_profile_details_controller.dart';
import 'package:ambrd_appss/controllers/otp_correctcode_controller/otp_verification_maim_page.dart';
import 'package:ambrd_appss/controllers/periodic_function_controller.dart';
import 'package:ambrd_appss/controllers/signup_controller/signup_controler.dart';
import 'package:ambrd_appss/modules/booking_brb/map_experiments/map_exp_30dec2023.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/about_us.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/complain_patient.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/edit_bank.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/edit_profile.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/payment_history.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/payout_history.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/privecy_policy.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/profile_page.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/support_page.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/update_bank.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/walet_user/wallet_user.dart';
import 'package:ambrd_appss/modules/drawer/page_drower/website_view.dart';
import 'package:ambrd_appss/modules/login_view/login_page.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/app_theme/app_color.dart';

class MainAmbrbDrawer extends StatelessWidget {
  static String lat22 = '';

  static String lng22 = '';

  static String lat33 = '';

  static String lng33 = '';
  @override
  Widget build(BuildContext context) {
    NavController _navcontroller = Get.put(NavController(), permanent: true);
    SignUpController _signUpController = Get.put(SignUpController());

    EditbankdetailController _editbankdetailController =
        Get.put(EditbankdetailController());

    GetProfileController _getProfileController =
        Get.put(GetProfileController());
    // await _getProfileController.getProfileApi();
    DriverBookingHistoryController _driverPaymentHistoryController =
        Get.put(DriverBookingHistoryController());

    EditprofileController _editprofile = Get.put(EditprofileController());

    OtpVerifyController _otpVerifyController = Get.put(OtpVerifyController());

    PeriodicFunctionController _periodicFunctionController =
        Get.put(PeriodicFunctionController());

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      top: false,
      child: Drawer(
        backgroundColor: MyTheme.ambapp6,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                              'lib/assets/images/ambrduserplaystore.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: MyTheme.ambapp12,
              ),
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.home,
                color: Colors.black,
                size: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                'Track Driver',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              // tileColor: Get.currentRoute == '/AllProducts'
              //     ? Colors.grey[300]
              //     : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                // Get.back();
                await _periodicFunctionController.driveracceptuserDetailApi2();
                await _periodicFunctionController.TrackDriverssApi();

                _periodicFunctionController.onInit();
                _periodicFunctionController.update();

                var prefs = GetStorage();
                //saved id....admin id......
                lat22 = prefs.read("lat22").toString();
                print('lat22888834:${lat22}');
                CallLoader.loader();
                await Future.delayed(Duration(seconds: 1));
                CallLoader.hideLoader();
                //SearchLocationScreen

                /// transModel: this._translatorModel
                await Get.to(MapPage(
                  id: 12334,
                ));

                ///
                ///await Get.to(GoogleSearchPlacesApi());
                //await
                //Get.to(MapPracticeExperiment(
                //title: 'map list',
                // ));
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.car_crash_rounded,
                color: Colors.black,
                size: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text(
                'Book Ambulance',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              // tileColor: Get.currentRoute == '/AllProducts'
              //     ? Colors.grey[300]
              //     : Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                // Get.back();
                //await Get.to(GoogleSearchPlacesApi());

                //Get.to(SearchLocationScreen());
                _navcontroller.tabindex(1);

                ///
                //await Get.to(GoogleSearchPlacesApi());

                ///SearchLocationScreen

                // Get.to(() => BookingAmb());
                //Get.to(() => AllProducts());
                //Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.person,
                color: Colors.black,
                size: 14,
              ),

              ///........................................
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  // Get.currentRoute == '/NavBar'
                  //     ? Colors.grey[300]
                  //     :
                  Colors.transparent,
              onTap: () async {
                print(Get.currentRoute);
                //Get.back();
                await _getProfileController.getProfileApi();
                _getProfileController.update();
                await Get.to(ProfilePagess());

                ///......................................
                // _navController.tabindex(3);
                /// Get.to(() => NavBar());
                //Get.to(() => BestDeal());
                // Get.offNamed('/NavBar');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.edit,
                color: Colors.black,
                size: 16,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Update Profile',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/EditProfilePage'
                  ? Colors.grey[300]
                  : null,
              onTap: () async {
                print(Get.currentRoute);

                //Get.back();
                //await _editprofile.getStateApi();
                //_editprofile.update();
                //await _signUpController
                //.getCityByStateID(stateID);
                //_signUpController.update();
                // _editprofile.refresh();

                await _getProfileController.getProfileApi();
                _getProfileController.update();
                _getProfileController.onInit();

                ///todo: edit profile.......

                // await _editprofile.editProfileApi2();
                _editprofile.onInit();

                //await Get.to(() => SignUpPage());
                await Get.to(() => EditProfilePage());
                //Get.offNamed('/GiftBox');
              },
            ),

            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.food_bank,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Add your bank',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/AddbankPage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => AddbankPage());
                //Get.offNamed('/GiftBox');
              },
            ),

            ///EditbankPage
            ///.......///........///...........
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.edit_note,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              // visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Edit your bank',
                //'Gift Boxes',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/AddbankPage' ? Colors.grey[300] : null,
              onTap: () async {
                //print(Get.currentRoute);

                await _editbankdetailController.getBankProfileApi();
                _editbankdetailController.onInit();
                _editbankdetailController.update();
                Get.back();
                await Get.to(() => EditbankPage());
                //Get.offNamed('/GiftBox');
              },
            ),

            /// wallet
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.wallet,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Wallet',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/Wallet' ? Colors.grey[300] : null,
              onTap: () async {
                await _getProfileController.getProfileApi();
                _getProfileController.update();
                _getProfileController.onInit();
                print(Get.currentRoute);
                await Get.to(() => WolletUser());
                Get.offNamed('/Wallet');

                ///.................................................28feb....................new
                //_walletController.walletListssApi();
                //  _walletController.update();
                ///......................................................................................................
                // tileColor: Get.currentRoute == '/OrderConfirmationPage'
                //     ? Colors.grey[300]
                //     : null,
                // onTap: () {
                //   print(Get.currentRoute);
                //   Get.to(() => OrderConfirmationPage());
                //   Get.offNamed('/OrderConfirmationPage');
              },
            ),

            ///
            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.history_edu_outlined,
                color: Colors.black,
                size: 11,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Payment History',
                //'Our Story',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/DriverPaymentHistory'
                  ? Colors.grey[300]
                  : null,
              onTap: () async {
                await _driverPaymentHistoryController.userBookingHistoryApi();
                _driverPaymentHistoryController.onInit();

                ///....///.......///.....///.......///.........///.........
                _driverPaymentHistoryController.update();
                print(Get.currentRoute);
                Get.back();
                await Get.to(() => UserPaymentHistory());
                //Get.offNamed('/OurStory');
              },
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_box_outlined,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Booking History',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/DriverPayoutHistory'
                  ? Colors.grey[300]
                  : null,
              onTap: () async {
                await _driverPaymentHistoryController.userBookingHistoryApi();
                _driverPaymentHistoryController.onInit();
                _driverPaymentHistoryController.update();
                print(Get.currentRoute);
                Get.back();

                ///.....///..........///.....///........todo:6 jan 2023.................
                ///.....///......///.......///......payout now booking website.........
                await Get.to(() => UserBookingHistory());
                Get.offNamed('/DriverPayoutHistory');
              },
              //
            ),
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.web,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Website',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/WhatsAppTrackOrder'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();
                Get.to(() => WebViewPswebsite());
                // Get.offNamed('/WhatsAppTrackOrder');
              },
            ),

            ///ComplainPage
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.message,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Complain',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/ComplainPage' ? Colors.grey[300] : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                Get.to(() => ComplainPage());
                Get.offNamed('/ComplainPage');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Support',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PersonalProfile'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                Get.to(() => SupportViewAmbrdComman());
                Get.offNamed('/PersonalProfile');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.business,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'About Us',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/UserAboutUsView'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///.................................................28feb....................new
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///........................................................................................

                Get.to(() => UserAboutUsView());
                Get.offNamed('/UserAboutUsView');
              },
            ),

            ///here from profileeee...............................
            ListTile(
              //horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.policy,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Privecy Policy',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor: Get.currentRoute == '/PersonalProfile'
                  ? Colors.grey[300]
                  : null,
              onTap: () {
                print(Get.currentRoute);
                Get.back();

                ///................................................................
                //  _getProfileController.addressidApi();
                // _getProfileController.update();
                ///...........................................................
                Get.to(() => privecy_policy());
                Get.offNamed('/PersonalProfile');
              },
            ),

            ListTile(
              leading: Icon(
                Icons.delete_forever_outlined,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black,
                size: 11,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -2),
              title: Text(
                'Delete Account',

                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                //fontWeight: FontWeight.w600,
                //color: Colors.black,
                // ),
              ),
              onTap: () {
                Get.defaultDialog(
                  title: "Welcome To Ambrd",
                  middleText: "You content goes here...",
                  content: getContent(),
                  barrierDismissible: true,
                  radius: 20.0,
                  confirm: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: confirmBtn(),
                  ),
                  cancel: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: cancelBtn(),
                  ),
                );

                //Get.to(() => CupponsPage());
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Wollet()));
              }, //PersonalDetails
            ),

            ListTile(
              // horizontalTitleGap: 2.h,
              leading: Icon(
                Icons.login,
                color: Colors.black,
                size: 14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                size: 11,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              dense: true,
              //visualDensity: VisualDensity(horizontal: 0, vertical: -1),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
              tileColor:
                  Get.currentRoute == '/LoginPage' ? Colors.grey[300] : null,
              onTap: () async {
                print(Get.currentRoute);

                ///GetStorage prefs = GetStorage();
                ///prefs.erase();

                _otpVerifyController.onInit();
                CallLoader.loader();
                await Future.delayed(Duration(seconds: 2));
                CallLoader.hideLoader();
                await SharedPreferences.getInstance()
                    .then((value) => value.clear());
                //Get.back();
                await Get.offAll(() => LoginScreen());
                //prefs.remove('email');

                //Get.to(() => LoginPage());
                /// Get.offNamed('/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget confirmBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Confirm"));
  }

  Widget cancelBtn() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        child: Text("Cancel"));
  }

  Widget getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "If Yow want to remove your account,",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Then you please click confirm button",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "Your data will erase if you press confirm.",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        Text(
          "If you don't want to delete press cancel",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
      ],
    );
  }
}
