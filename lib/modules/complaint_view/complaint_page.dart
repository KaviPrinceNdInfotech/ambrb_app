import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../constants/app_theme/app_color.dart';
import '../../controllers/register_complaint_controller/register_complain_controller.dart';
import '../../services/api_provider.dart';
import '../../widget/circular_loader.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({Key? key}) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  RegisterComplainController _registerComplainController =
      Get.put(RegisterComplainController());
  TextEditingController NameController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  //
  String dropdownValue = '';
  // select Product
  String? _mySelection;

  List data = []; //edited line
  Future<String> getProductData() async {
    final String url = "https://jkroshini.com/api/Product/ProductList";
    var res =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);
    setState(() {
      data = resBody;
    });
    print(resBody);
    return "Sucess";
  }

  void registerComplainApi() async {
    var Product = int.parse(_mySelection!);
    CallLoader.loader();
    http.Response r = await ApiProvider.ComplainRegister(
        NameController.text,
        MobileController.text,
        AddressController.text,
        dropdownValue.toString(),
        Product //_mySelection,
        );
    if (r.statusCode == 200) {
      CallLoader.hideLoader();
      Get.snackbar('Success', 'Complain Registered SuccessFully');
      // print('response:${r}');
    }
  }

  @override
  void initState() {
    super.initState();
    getProductData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.t1navbar1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyTheme.t1navbar1,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 5, left: 16, right: 16),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: _registerComplainController.ComplainFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Image.asset(
                    'lib/assets/images/logo.png',
                    fit: BoxFit.cover,
                    scale: 30,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Register Your Complain!",
                    style: GoogleFonts.alegreyaSc(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyTheme.t1Iconcolor),
                  ),
                  const SizedBox(
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
                              borderSide: const BorderSide(color: Colors.green),
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
                          controller: NameController,
                          // validator: (value) {
                          //   return _registerComplainController
                          //       .validateName(value!);
                          // },
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
                          maxLength: 10,
                          decoration: InputDecoration(
                            counterText: '',
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
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          controller: MobileController,
                          // onSaved: (value) {
                          //   _registerComplainController.mobile = value!;
                          // },
                          validator: (value) {
                            if (value!.length < 10) {
                              return "Provide valid Phone number";
                            }
                            // _registerComplainController
                            //   .validatemobile(value!);
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
                              'lib/assets/images/home.png',
                              color: MyTheme.t1Iconcolor,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.streetAddress,
                        controller: AddressController,
                        // onSaved: (value) {
                        //   _registerComplainController.address = value!;
                        // },
                        // validator: (value) {
                        //   return _registerComplainController
                        //       .validateAddress(value!);
                        // },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyTheme.t1bacgroundcolors1,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10.0),
                      child: DropdownButton<String>(
                        underline: Container(),
                        isExpanded: true,
                        icon: null,
                        value: dropdownValue == ""
                            ? null
                            : dropdownValue, //dropdownValue,
                        hint: const Text(
                          'Select type',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        items: <String>[
                          'Amc',
                          'Chargable',
                          'Warranty',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  // Obx(() =>
                  //     Container(
                  //       height: 48,
                  //       width: double.infinity,
                  //       decoration: BoxDecoration(
                  //         color: MyTheme.t1bacgroundcolors1,
                  //         borderRadius: BorderRadius.circular(8.0),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 15, right: 10.0),
                  //         child:
                  //         DropdownButton(
                  //           underline: Container(),
                  //           isExpanded: true,
                  //           icon: (null),
                  //           hint: const Text(
                  //             'Select type',
                  //           ),
                  //           onChanged: (newValue) {
                  //             _registerComplainController.setSelected(
                  //                 newValue.toString());
                  //           },
                  //           value: _registerComplainController.selectedDrowpdown
                  //               .value == ""
                  //               ? null
                  //               : _registerComplainController.selectedDrowpdown
                  //               .value,
                  //           items: [
                  //             for (var data in _registerComplainController
                  //                 .dropdownText)
                  //               DropdownMenuItem(
                  //                 value: data,
                  //                 child: Text(data,),
                  //               )
                  //           ].toList(),
                  //         ),
                  //       ),
                  //     )
                  // ),
                  // dynamic dropdown
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyTheme.t1bacgroundcolors1,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 10.0),
                      child: DropdownButton(
                        underline: Container(),
                        hint: const Text(
                          "Select Product/Services",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        dropdownColor: Colors.white,
                        icon: (null),
                        isExpanded: true,
                        items: data.map((item) {
                          return DropdownMenuItem(
                            value: item['id'].toString(),
                            child: Text(
                              item['name'] ?? "",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _mySelection = newVal.toString();
                          });
                        },
                        value: _mySelection,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
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
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      onPressed: () {
                        // registerComplainApi();
                        if (NameController.text == '' ||
                            MobileController.text == '' ||
                            AddressController.text == "" ||
                            dropdownValue == "" ||
                            _mySelection == null) {
                          Get.snackbar('Failed',
                              'Text Field is empty, Please Fill All Data');
                        } else {
                          registerComplainApi();
                        }
                      },
                    ),
                  ),
                  const SizedBox(
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
