import 'dart:io';

import 'package:ambrd_appss/modules/firebase_notification_service/firebase_new/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'controllers/home_controllers/home_controllers.dart';
import 'controllers/login_mobile_controller/login_mobile_controllers.dart';
import 'controllers/splash_controller/splash_controllers.dart';
import 'modules/splash_view/splash_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  ///i created new class name is firebase api kumar prince extra its not needed
  await FirebaseApi().initNotifications();
  runApp(
    GetMaterialApp(
      title: "Application",
      //initialRoute: AppPages.INITIAL,
      //getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}

// void main() async{
//   //my
//   await GetStorage.init();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       // initialBinding: StoreBinding(),
//       // initialRoute: AppPages.INITIAL,
//       // getPages: AppPages.routes,
//
//       // title: 'Flutter Demo',
//       theme: ThemeData(
//         fontFamily: 'Oswald',
//         //primarySwatch: Colors.blue,
//       ),
//       home:
//         // LoginScreen()
//       // SearchPage()
//       //SignUpPage()
//         HomePage()
//      // SplashScreen(),
//       //WelcomeScreen(),
//     );
//   }
// }

////all pages

///

// class AppPages {
//   AppPages._();
//
//   static const INITIAL = Routes.SPLASH;
//
//   static final routes = [
//     GetPage(
//       name: _Paths.HOME,
//       page: () => HomePage(),
//       binding: HomeBinding(),
//     ),
//     GetPage(
//       name: _Paths.SPLASH,
//       page: () => const SplashScreen(),
//       binding: SplashBinding(),
//     ),
//     GetPage(
//       name: _Paths.LOGIN,
//       page: () => LoginScreen(),
//       binding: LoginBinding(),
//     ),
//   ];
// }

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
}

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginMobileController>(
      () => LoginMobileController(),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
//ececcdcdcscscscsc28 dec 2023...
