import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/constants/color_constant.dart';
import 'package:ambrd_appss/modules/botttom_nav_bar/bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../../../constants/constants/constants.dart';
//import '../../../home_page_user_view/user_home_page.dart';
//import 'package:ps_welness/constants/constants/constants.dart';

NavController _navcontroller = Get.put(NavController(), permanent: true);

class WolletHeadText extends StatelessWidget {
  const WolletHeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.035),
          Container(
              height: size.height * 0.04,
              width: size.width * 0.09,
              decoration: BoxDecoration(
                color: Colors.white70,
                shape: BoxShape.circle,
              ),
              child: Center(
                  child: InkWell(
                onTap: () {
                  _navcontroller.tabindex(0);
                  // Get.to(UserHomePage());
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: size.width * 0.04,
                ),
              ))),
          SizedBox(height: size.height * 0.01),

          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Select',
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    //color: Color(0xff023382)
                  ),
                ),
                TextSpan(
                  text: ' Money',
                  style: GoogleFonts.alatsi(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: MyTheme.ambapp13,
                    //color: Color(0xff023382)
                  ),
                ),
              ],
            ),
          ),
          // Text(
          //   'Sign Up',
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.w600,
          //     //color: Color(0xff023382)
          //   ),
          // ),
          Text(
            'WALLET!',
            style: GoogleFonts.alatsi(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: MyTheme.ambapp3,
            ),
          ),
        ],
      ),
    );
  }
}
