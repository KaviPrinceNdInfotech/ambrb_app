// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:roshini/constants/app_theme/app_color.dart';
//
// import '../../controllers/forgot_controllers/forgot_with_pinn.dart';
//
// class ForgotpasswordPinPage extends StatelessWidget {
//   ForgotpasswordPinPage({Key? key}) : super(key: key);
//
//   // pinpasswordController _pinpasswordcontroller =
//   //     Get.put(pinpasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: MyTheme.t1navbar1,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: MyTheme.t1navbar1,
//       ),
//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.only(top: 5, left: 16, right: 16),
//           width: context.width,
//           height: context.height,
//           child: SingleChildScrollView(
//             child: Form(
//               key: _pinpasswordcontroller.pinformkey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'lib/assets/images/logo.png',scale: 30,
//                     fit: BoxFit.fitWidth,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Change your password through phone!",
//                     style: GoogleFonts.alegreyaSc(
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                         color: MyTheme.t1Iconcolor),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: size.height * 0.03,
//                   ),
//                   Directionality(
//                     textDirection: TextDirection.ltr,
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.all(0.0),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: MyTheme.t1bacgroundcolors1,
//                             hintText: 'Enter your pin',
//                             contentPadding: const EdgeInsets.only(
//                                 left: 14.0, bottom: 4.0, top: 16.0),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: new BorderSide(color: Colors.green),
//                               borderRadius: new BorderRadius.circular(10),
//                             ),
//                             enabledBorder: UnderlineInputBorder(
//                               borderSide:
//                                   new BorderSide(color: Colors.transparent),
//                               borderRadius: new BorderRadius.circular(10.0),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.red, width: 2.0),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             // labelText: "Password",
//                             prefixIcon: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: size.height * 0.012,
//                                   horizontal: size.width * 0.02),
//                               child: Image.asset(
//                                 'lib/assets/images/lock.png',
//                                 // 'lib/assets/images/profile.png',
//                                 // color: MyTheme.t1Iconcolor,
//                                 height: 10,
//                                 width: 10,
//                               ),
//                             ),
//                           ),
//                           keyboardType: TextInputType.visiblePassword,
//                           //obscureText: true,
//                           controller: _pinpasswordcontroller.passwordController,
//                           onSaved: (value) {
//                             _pinpasswordcontroller.password = value!;
//                           },
//                           validator: (value) {
//                             return _pinpasswordcontroller.validPassword(value!);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(
//                     height: size.height * 0.03,
//                   ),
//
//                   ConstrainedBox(
//                     constraints: BoxConstraints.tightFor(width: context.width),
//                     child: ElevatedButton(
//                       style: ButtonStyle(
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         backgroundColor:
//                             MaterialStateProperty.all(MyTheme.t1containercolor),
//                         padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                       ),
//                       child: Text(
//                         "SUBMIT",
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                       onPressed: () {
//                         _pinpasswordcontroller.checkLoginpasswordd();
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
