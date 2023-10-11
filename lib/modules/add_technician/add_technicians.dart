import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:roshini/constants/app_theme/app_color.dart';

import '../../constants/app_theme/app_color.dart';
import '../../controllers/add_tecnician_controller/add_technicians_controller.dart';

class AddTechnician extends StatelessWidget {
  AddTechnician({Key? key}) : super(key: key);

  AddtechnicianController _addtechnicianController =
      Get.put(AddtechnicianController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _addtechnicianController.addtechnicianformkey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Scaffold(
        backgroundColor: MyTheme.t1navbar1,
        appBar: AppBar(
          backgroundColor: MyTheme.t1navbar1,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04, vertical: size.height * 0.02),
              child: Column(
                children: [
                  Image.asset(
                    'lib/assets/images/logo.png',
                    fit: BoxFit.cover,
                    scale: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Register Your Complain!",
                    style: GoogleFonts.alegreyaSc(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.t1Iconcolor),
                  ),
                  SizedBox(
                    height: 10,
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

                            fillColor: MyTheme.t1bacgroundcolors1,
                            hintText: 'Name',
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
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.012,
                                  horizontal: size.width * 0.02),
                              child: Image.asset(
                                'lib/assets/images/profile.png',
                                color: MyTheme.t1Iconcolor,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          //obscureText: true,
                          controller: _addtechnicianController.Name,
                          // onSaved: (value) {
                          //   _addtechnicianController.Name = value;
                          // },
                          validator: (value) {
                            return _addtechnicianController
                                .validateName(value!);
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
                            fillColor: MyTheme.t1bacgroundcolors1,
                            hintText: 'Phone',
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
                            prefixIcon: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.012,
                                  horizontal: size.width * 0.02),
                              child: Image.asset(
                                'lib/assets/images/smartphone.png',
                                //color: MyTheme.t1Iconcolor,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          controller: _addtechnicianController.Mobile_No,
                          // onSaved: (value) {
                          //   _addtechnicianController.Mobile_No = value!;
                          // },
                          validator: (value) {
                            return _addtechnicianController.validPhone(value!);
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

                          fillColor: MyTheme.t1bacgroundcolors1,
                          hintText: 'Address',
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
                          //focusedBorder: InputBorder.none,
                          //enabledBorder: InputBorder.none,
                          // errorBorder: InputBorder.none,
                          // border: InputBorder.none,

                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // labelText: "Password",
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.012,
                                horizontal: size.width * 0.02),
                            child: Image.asset(
                              'lib/assets/images/home.png',
                              color: MyTheme.t1Iconcolor,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        //obscureText: true,
                        controller: _addtechnicianController.Email_Id,
                        // onSaved: (value) {
                        //   _addtechnicianController.address = value!;
                        // },
                        validator: (value) {
                          return _addtechnicianController.validAddress(value!);
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
                        "Add Technician",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        _addtechnicianController.checkTechnician();
                        //Get.to(()=>NavBar());
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           //NavBar()
                        //           HomePage()),
                        // );
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
}
