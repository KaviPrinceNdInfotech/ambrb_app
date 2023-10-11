// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:roshini/constants/app_theme/app_color.dart';
// import 'package:roshini/controllers/login_password_controller/login_password_controller.dart';
// import 'package:roshini/modules/forgot_section/forgot_with_phonee.dart';
// import 'package:roshini/modules/home_page/home_page.dart';
// import 'package:roshini/modules/login_view/login_page.dart';
//
// class LoginPasswordPage extends StatelessWidget {
//   LoginPasswordPage({Key? key}) : super(key: key);
//
//   LoginpasswordController _loginpasswordController =
//       Get.put(LoginpasswordController());
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
//               key: _loginpasswordController.loginpasswordformkey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'lib/assets/images/logo.png',scale: 30, fit: BoxFit.fitWidth,
//                   ),
//                   SizedBox(
//                     height: 00,
//                   ),
//                   Text(
//                     "Login With Us!",
//                     style: GoogleFonts.alegreyaSc(
//                         fontSize: 20,
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
//                             //focusedBorder: InputBorder.none,
//                             //enabledBorder: InputBorder.none,
//                             // errorBorder: InputBorder.none,
//                             // border: InputBorder.none,
//
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
//                                 'lib/assets/images/smartphone.png',
//                                 // 'lib/assets/images/profile.png',
//                                 // color: MyTheme.t1Iconcolor,
//                                 height: 10,
//                                 width: 10,
//                               ),
//                             ),
//                           ),
//                           keyboardType: TextInputType.visiblePassword,
//                           //obscureText: true,
//                           controller: _loginpasswordController.mobileController,
//                           onSaved: (value) {
//                             _loginpasswordController.mobile = value!;
//                           },
//                           validator: (value) {
//                             return _loginpasswordController.validPhone(value!);
//                           },
//                         ),
//                       ),
//                     ),
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
//
//                             fillColor: MyTheme.t1bacgroundcolors1,
//                             hintText: 'Password',
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
//                                 'lib/assets/images/lock.png',
//                                 //color: MyTheme.t1Iconcolor,
//                                 height: 10,
//                                 width: 10,
//                               ),
//                             ),
//                           ),
//                           keyboardType: TextInputType.phone,
//                           controller:
//                               _loginpasswordController.passwordController,
//                           onSaved: (value) {
//                             _loginpasswordController.password = value!;
//                           },
//                           validator: (value) {
//                             return _loginpasswordController
//                                 .validPassword(value!);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.005,
//                   ),
//                   Align(
//                       alignment: Alignment.centerRight,
//                       child: InkWell(
//                         onTap: () {
//                           Get.to(() => ForgotpasswordphonePage());
//                           print('click');
//                         },
//                         child: Text(
//                           'Forget password?',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: size.width * 0.035,
//                               color: MyTheme.t1Iconcolor),
//                         ),
//                       )),
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
//                       child: const Text(
//                         "SUBMIT",
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                       onPressed: () {
//                         _loginpasswordController.checkLoginpassword();
//                        // Get.to(HomePage());
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                    Text.rich(
//                     textAlign: TextAlign.center,
//                     TextSpan(
//                       children: [
//                         const TextSpan(text: 'Don\'t have account? ',
//                         style: TextStyle(fontSize: 12)),
//                         TextSpan(
//                           text: 'Create new account.',
//                           style: TextStyle(color: MyTheme.t1Iconcolor,fontSize: 14,fontWeight: FontWeight.bold),
//                           recognizer: TapGestureRecognizer()..onTap = () {
//                             Get.to( LoginScreen(),);
//                           },
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
