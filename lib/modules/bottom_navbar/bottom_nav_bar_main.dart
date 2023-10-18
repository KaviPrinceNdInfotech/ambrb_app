// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// //import 'package:roshini/constants/app_theme/app_color.dart';
// //import 'package:roshini/modules/home_page/home_page.dart';
//
// import '../../constants/app_theme/app_color.dart';
// import '../home_page/home_page.dart';
// import 'bottom_bar_controllers.dart';
//
// class NavBar extends StatelessWidget {
//   const NavBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GetBuilder<DashboardController>(
//       builder: (controller) {
//         return Scaffold(
//           body: SafeArea(
//             child: IndexedStack(
//               index: controller.tabIndex,
//               children: [
//                 HomePage(),
//                 Container(
//                   height: size.height,
//                   width: size.width,
//                   color: Colors.blue,
//                   child: Center(
//                     child: Text('page2'),
//                   ),
//                 ),
//                 Container(
//                   height: size.height,
//                   width: size.width,
//                   color: Colors.red,
//                   child: Center(
//                     child: Text('page3'),
//                   ),
//                 ),
//                 Container(
//                   height: size.height,
//                   width: size.width,
//                   color: Colors.yellow,
//                   child: Center(
//                     child: Text('page4'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             unselectedItemColor: Colors.black,
//             selectedItemColor: MyTheme.t1Iconcolor,
//             onTap: controller.changeTabIndex,
//             currentIndex: controller.tabIndex,
//             showSelectedLabels: true,
//             showUnselectedLabels: true,
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: MyTheme.t1bacgroundcolors1,
//             elevation: 0,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.newspaper),
//                 label: 'News',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.notification_important),
//                 label: 'Alerts',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Account',
//               ),
//             ],
//           ),
//         );
//       },
//     );
//     ;
//   }
// }
