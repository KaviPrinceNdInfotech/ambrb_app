//import 'package:ambrd_driver_app/constantsss/app_theme/app_color.dart';
import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:ambrd_appss/controllers/complain_patient_controller/complain_controller.dart';
import 'package:ambrd_appss/widget/circular_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../../../controllers/signup_driver_controller/signup_controler.dart';

//class SignUpPage extends GetView<SignUpController> {

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String gender = "male";

class ComplainPage extends StatelessWidget {
  ComplainPage({Key? key}) : super(key: key);
  // SignUpController _signUpController = Get.put(SignUpController());
  String dropdownValue = list.first;

  ComplainPatientController _complainController =
      Get.put(ComplainPatientController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.ambapp3,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },

          ///.................
          child: Icon(
            Icons.arrow_back_ios,
            color: MyTheme.ambapp,
          ),
        ),
        backgroundColor: MyTheme.ambapp3,
        elevation: 0,
      ),
      body: Form(
        key: _complainController.ComplainPatientFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 16, right: 16),
            width: context.width,
            height: context.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.131,
                    width: size.width * 0.4,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'lib/assets/images/CommonLogoAmbrd.png'),
                            fit: BoxFit.fitWidth)),
                  ),
                  SizedBox(
                    height: 00,
                  ),
                  Text(
                    "Add Your Complain",
                    style: GoogleFonts.alegreyaSc(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.ambapp1),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          maxLines: 4,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,
                            //fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Enter Complain',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 16.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.transparent),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // labelText: "Password",
                            // prefixIcon: Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: size.height * 0.012,
                            //       horizontal: size.width * 0.02),
                            //   child: Icon(Icons.person),
                            //   // Image.asset(
                            //   //   'assets/profile.png',
                            //   //   //color: MyTheme.t1Iconcolor,
                            //   //   height: 10,
                            //   //   width: 10,
                            //   // ),
                            // ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller: _complainController.Complaints,
                          validator: (value) {
                            return _complainController.validateholder(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyTheme.ambapp12,

                            // fillColor: MyTheme.t1Iconcolor,
                            hintText: 'Enter subject',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 4.0, top: 1.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.green),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.transparent),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // prefixIcon: Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: size.height * 0.012,
                            //       horizontal: size.width * 0.02),
                            //   child: Icon(Icons.food_bank),
                            //   // Image.asset(
                            //   //   'assets/email.png',
                            //   //   //color: MyTheme.t1Iconcolor,
                            //   //   height: 10,
                            //   //   width: 10,
                            //   // ),
                            // ),
                          ),
                          keyboardType: TextInputType.name,
                          controller: _complainController.Subjects,
                          validator: (value) {
                            return _complainController.validaddress(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextFormField(
                        //maxLines: 5,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyTheme.ambapp12,
                          //fillColor: MyTheme.t1Iconcolor,
                          hintText: 'Others',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 4.0, top: 1.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.green),
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.transparent),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // prefixIcon: Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: size.height * 0.012,
                          //       horizontal: size.width * 0.02),
                          //   child: Icon(Icons.pin_drop_outlined),
                          //   // Image.asset(
                          //   //   'assets/home.png',
                          //   //   // color: MyTheme.t1Iconcolor,
                          //   //   height: 10,
                          //   //   width: 10,
                          //   // ),
                          // ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        //obscureText: true,
                        controller: _complainController.Others,
                        validator: (value) {
                          return _complainController.validateaccount(value!);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.t1containercolor),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: Text(
                        "Add Complain",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        CallLoader.loader();
                        //_user_1_controller.checkUser1();
                        _complainController.checkcomplainuser();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _modelBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.camera_alt_sharp),
                title: const Text('Camera'),
                onTap: () {
                  //  _signUpController.getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: new Icon(Icons.image_outlined),
                title: new Text('Gallery'),
                onTap: () {
                  //  _signUpController.getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
