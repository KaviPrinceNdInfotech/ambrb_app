// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// //import 'package:roshini/constants/app_theme/app_color.dart';
//
// import '../../constants/app_theme/app_color.dart';
// import '../../controllers/add_services_controllerss/add_service_controller.dart';
//
// class ServicesPage extends StatelessWidget {
//   ServicesPage({Key? key}) : super(key: key);
//   AddserviceController _addserviceController = Get.put(AddserviceController());
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
//               key: _addserviceController.addserviceformkey,
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               child: Column(
//                 children: [
//                   Image.asset(
//                     'lib/assets/images/logo.png',
//                     fit: BoxFit.cover, scale: 24,
//                     // 'lib/assets/images/JK_ROSHINI_png.png',
//                     //  height: size.height * 0.2,
//                     //  width: size.width * 0.3,
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     "Add Your Services!",
//                     style: GoogleFonts.alegreyaSc(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: MyTheme.t1Iconcolor),
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
//                             hintText: 'Add Service',
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
//                                 'lib/assets/images/profile.png',
//                                 color: MyTheme.t1Iconcolor,
//                                 height: 10,
//                                 width: 10,
//                               ),
//                             ),
//                           ),
//                           controller: _addserviceController.services,
//                           validator: (value) {
//                             return _addserviceController
//                                 .validateService(value!);
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.06,
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
//                         "ADD SERVICE",
//                         style: TextStyle(fontSize: 14, color: Colors.white),
//                       ),
//                       onPressed: () {
//                         _addserviceController.checkService();
//                       },
//                     ),
//                   ),
//                   const SizedBox(
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
