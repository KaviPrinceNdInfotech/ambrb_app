import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/wallet_controllers/wallet_controllers.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import '../../../../../constants/constants/constants.dart';
//import '../../../../../constants/my_theme.dart';
import 'credential_user_wallet.dart';
import 'head_text_walet.dart';

NavController _navcontroller = Get.put(NavController(), permanent: true);

Wallet_2_Controller _wallet_2_controller = Get.put(Wallet_2_Controller());

class WolletUser extends StatelessWidget {
  const WolletUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool shouldPop = true;

    return WillPopScope(
      onWillPop: () async {
        _navcontroller.tabindex(0);

        /// Get.to(UserHomePage());
        return shouldPop;
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo,

          ///.........................
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //   lightPrimary,
          //   darkPrimary,
          // ]
          // )
        ),
        child: Scaffold(
          backgroundColor: MyTheme.ambapp,
          body: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size.height * 0.0,
                  //bottom: size.height * 0.64,
                  //left: -30,
                  left: size.width * 0.53,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: size.height * 0.216,
                      width: size.width * 0.40,
                      decoration: BoxDecoration(
                          //color: Colors.,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                'lib/assets/images/wallet.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WolletHeadText(),

                    WalletCredentials(),
                    //DoctorAddressCredentials(),
                    //HospitalSocial(),
                    //Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
