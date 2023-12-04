///import '../../../constantsss/app_theme/app_color.dart';
import 'package:ambrd_appss/constants/app_theme/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverPayoutHistory extends StatelessWidget {
  DriverPayoutHistory({Key? key}) : super(key: key);

  //DriverPayoutController _driverPayoutController =
  // Get.put(DriverPayoutController());
  ///
  // DriverPayoutHistoryController _driverPayoutHistoryController =
  // Get.put(DriverPayoutHistoryController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.ambapp6,
      height: size.height,
      width: size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child:
              // Obx(
              //       () => _driverPayoutHistoryController.isLoading.value
              //       ? Center(
              //     child: CircularProgressIndicator(),
              //   )
              //       :
              Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -size.height * 0.037,
                //bottom: size.height * 0.64,
                //left: -30,
                right: -size.width * 0.124,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: size.height * 0.22,
                    width: size.width * 0.55,
                    decoration: BoxDecoration(
                        //color: Colors.,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              'lib/assets/background_stack_png/paymhis2.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.01),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: size.height * 0.03,
                            width: size.width * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white70,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: size.height * 0.022,
                              color: MyTheme.ambapp,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          'Driver\'s Payout History',
                          style: GoogleFonts.alatsi(
                              fontSize: size.height * 0.032,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff023382)),
                        ),
                      ],
                    ),
                  ),
                  //Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: Container(
                      //height: size.height * 0.02,
                      decoration: new BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(30.0)),
                          color: MyTheme.ambapp9),
                      width: size.width,
                      height: size.height * 0.06,
                      margin: new EdgeInsets.fromLTRB(10, 23, 20, 20),
                      padding: new EdgeInsets.fromLTRB(5, 8, 8, 8),
                      child: Theme(
                        data: Theme.of(context)
                            .copyWith(splashColor: Colors.transparent),
                        child:
                            // Obx(
                            //   () => (_driverPayoutController.isLoading.value)
                            //       ? Center(child: CircularProgressIndicator())
                            //       :
                            TextField(
                          // onChanged: (value) =>
                          //     _driverPayoutHistoryController
                          //         .filterpayouthistory(value),

                          ///.filterdriverhistory(value),
                          // controller: _driverPayoutHistoryController
                          //     .appointmentController,
                          // onTap: () {
                          //   _driverPayoutHistoryController.chooseDate();
                          // },
                          autofocus: false,
                          style:
                              TextStyle(fontSize: 15.0, color: MyTheme.ambapp),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            filled: true,
                            fillColor: MyTheme.ambapp7,
                            hintText: 'dd-mm-yyyy',
                            contentPadding: const EdgeInsets.only(
                                left: 10.0, bottom: 12.0, top: 3.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                        //  ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  // Obx(
                  // _driverPayoutHistoryController
                  //     .foundpayoutdriver.value.isEmpty
                  //     ? Center(
                  //   child: Text("No List"),
                  // )
                  //     :
                  Expanded(
                    child: SizedBox(
                        //height: size.height * 0.76,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            // _driverPayoutHistoryController
                            //     .foundpayoutdriver?.length,
                            itemBuilder: (BuildContext context, int index) {
                              // DateTime? now =
                              //     _driverPayoutHistoryController
                              //         .foundpayoutdriver?[index]
                              //         .paymentDate;
                              ///.....
                              // String Date =
                              //     DateFormat('dd-MM-yyyy')
                              //         .format(now!);
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.03,
                                    vertical: size.height * 0.0005),
                                child: Container(
                                  height: size.height * 0.13,
                                  margin:
                                      EdgeInsets.symmetric(vertical: 30 / 5),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/logo222.png'),
                                        //'https://images.unsplash.com/photo-1589758438368-0ad531db3366?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80'),
                                        fit: BoxFit.fill),
                                    //color: MyTheme.containercolor8,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(-0, -0),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.yellow.shade300,

                                        // color: darkShadow1,
                                      ),
                                      BoxShadow(
                                        offset: Offset(3, 3),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        color: Colors.grey.shade200,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    height: size.height * 0.093,
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(
                                        vertical: size.width * 0.0 / 05),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Color(0xffffffff),
                                              Color(0xffF0FFF0)
                                              //darkPrimary,
                                            ]),
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-0, -0),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            color: Colors.green.shade200,
                                          ),
                                          BoxShadow(
                                            offset: Offset(3, 3),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            color: Colors.green.shade200,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: size.height * 0.09,
                                            width: size.width * 0.18,
                                            padding: EdgeInsets.all(8),
                                            child: Image.asset(
                                              'assets/logo222.png',
                                              // "lib/assets/image/icons8-hospital-64.png",
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  const BoxShadow(
                                                    color: Color(0xFFBEBEBE),
                                                    offset: Offset(5, 5),
                                                    blurRadius: 10,
                                                    spreadRadius: 1,
                                                  ),
                                                  const BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(-5, -5),
                                                    blurRadius: 10,
                                                    spreadRadius: 1,
                                                  ),
                                                ]),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '\u{20B9}erfefewf',

                                                /// _driverPayoutHistoryController.foundpayoutdriver?[index].amount}'

                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.045,
                                                  fontWeight: FontWeight.w500,
                                                  color: MyTheme.ambapp,
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Text(
                                                'efewfdewfew',
                                                //'${_driverPayoutHistoryController.foundpayoutdriver?[index].paymentDate}',
                                                style: GoogleFonts.roboto(
                                                  fontSize: size.width * 0.03,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Received",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ),
                  //)
                ],
              ),
            ],
          ),
          //),
        ),
      ),
    );
  }
}
