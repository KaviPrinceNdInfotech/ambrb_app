import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_theme/app_color.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.t1bacgroundcolors1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Roshini',
          style: GoogleFonts.roboto(
            fontSize: 24,
            //fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
            color: MyTheme.containercolor7,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            //height: size.height,
            width: size.width,
          ),
        ],
      ),
    );
  }
}
