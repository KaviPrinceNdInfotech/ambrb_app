// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:roshini/constants/app_theme/app_color.dart';
// import 'package:roshini/controllers/forgot_controllers/forgot_with_phone.dart';
//
// class ForgotpasswordphonePage extends StatelessWidget {
//   ForgotpasswordphonePage({Key? key}) : super(key: key);
//
//   ForgotWithPhoneController _forgotWithPhoneController =
//       Get.put(ForgotWithPhoneController());
//
//   // LoginpasswordController _loginpasswordController =
//   // Get.put(LoginpasswordController());
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
//           margin: EdgeInsets.only(top: 5, left: 16, right: 16),
//           width: context.width,
//           height: context.height,
//           child: SingleChildScrollView(
//             child: Form(
//               key: _forgotWithPhoneController.forgotphoneformkey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'lib/assets/images/logo.png',
//                     scale: 30, fit: BoxFit.fitWidth,
//                   ),
//                   SizedBox(
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
//
//                   // TextFormField(
//                   //   decoration: InputDecoration(
//                   //     border: OutlineInputBorder(
//                   //       borderRadius: BorderRadius.circular(10),
//                   //     ),
//                   //     labelText: "Email",
//                   //     prefixIcon: Icon(Icons.email),
//                   //   ),
//                   //   keyboardType: TextInputType.emailAddress,
//                   //   controller: controller.emailController,
//                   //   onSaved: (value) {
//                   //     controller.email = value!;
//                   //   },
//                   //   validator: (value) {
//                   //     return controller.validateEmail(value!);
//                   //   },
//                   // ),
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
//
//                             fillColor: MyTheme.t1bacgroundcolors1,
//                             hintText: 'Phone',
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
//                             prefixIcon: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: size.height * 0.012,
//                                   horizontal: size.width * 0.02),
//                               child: Image.asset(
//                                 'lib/assets/images/smartphone.png',
//                                 height: 10,
//                                 width: 10,
//                               ),
//                             ),
//                           ),
//                           keyboardType: TextInputType.visiblePassword,
//                           //obscureText: true,
//                           controller:
//                               _forgotWithPhoneController.mobileeController,
//                           onSaved: (value) {
//                             _forgotWithPhoneController.mobile = value!;
//                           },
//                           validator: (value) {
//                             return _forgotWithPhoneController
//                                 .validPhone(value!);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.03,
//                   ),
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
//                         _forgotWithPhoneController.checkMobile();
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
