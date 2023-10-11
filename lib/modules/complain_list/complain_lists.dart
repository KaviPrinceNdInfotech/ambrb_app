import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_theme/app_color.dart';
import '../../controllers/complaint_list_controller/complaint_list_controller.dart';
import '../complain_list_detail/complain_list_detail.dart';

class ComplainList extends StatelessWidget {
  //const ComplainList({Key? key}) : super(key: key);

  ComplaintListController complaintListController =
      Get.put(ComplaintListController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: MyTheme.t1navbar1,
        appBar: AppBar(
          bottom: TabBar(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            indicatorColor: Colors.white,
            unselectedLabelColor: MyTheme.ThemeColors,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(),
                  color: Colors.red,
                  child: Text(
                    "Open",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(),
                  color: Colors.green,
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints.expand(),
                  color: Colors.yellow[600],
                  child: Text(
                    "Pending",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Complain List',
            style: GoogleFonts.alatsi(
                fontWeight: FontWeight.w600,
                wordSpacing: 0.5,
                color: Colors.black,
                letterSpacing: 1),
          ),
          backgroundColor: MyTheme.t1navbar1,
        ),
        body: TabBarView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [],
                  ),
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.00,
                  right: size.width * 0.00,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.00),
                    child: Container(
                      height: size.height * 0.8,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: MyTheme.t1bacgroundcolors1,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            SizedBox(
                                height: size.height * 0.8,
                                child: Obx(
                                  () => complaintListController.isLoading.value
                                      ? Center(
                                          child: CircularProgressIndicator(
                                              color: MyTheme.t1containercolor))
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: complaintListController
                                              .complaintListOpenModel
                                              ?.openresult
                                              ?.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final openItems =
                                                complaintListController
                                                    .complaintListOpenModel
                                                    ?.openresult;
                                            return Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.04,
                                                  vertical:
                                                      size.height * 0.001),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.01,
                                                    vertical:
                                                        size.height * 0.004),
                                                child: PhysicalModel(
                                                  color: Colors.white,
                                                  shadowColor: Colors.grey,
                                                  elevation: 3,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Get.to(
                                                            ComplainListDetail(
                                                          name: openItems[index]
                                                              .name
                                                              .toString(),
                                                          mobile:
                                                              openItems[index]
                                                                  .mobile
                                                                  .toString(),
                                                          address:
                                                              openItems[index]
                                                                  .address
                                                                  .toString(),
                                                          product_service:
                                                              openItems[index]
                                                                  .typeOfService
                                                                  .toString(),
                                                          serviceType:
                                                              openItems[index]
                                                                  .services
                                                                  .toString(),
                                                          status:
                                                              openItems[index]
                                                                  .status
                                                                  .toString(),
                                                        ));
                                                      },
                                                      child: Container(
                                                        height:
                                                            size.height * 0.26,
                                                        width: size.width,
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              MyTheme.gradient7,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                    size.height *
                                                                        0.25,
                                                                width:
                                                                    size.width *
                                                                        0.4,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Complain:',
                                                                      style: GoogleFonts.alegreya(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontSize: size.height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Name:',
                                                                      style: GoogleFonts.alegreya(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontSize: size.height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Mobile:',
                                                                      style: GoogleFonts.alegreya(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontSize: size.height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Product/S:',
                                                                      style: GoogleFonts.alegreya(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontSize: size.height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Address:',
                                                                      style: GoogleFonts.alegreya(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontSize: size.height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Service type:',
                                                                      style: GoogleFonts.alegreya(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontSize: size.height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Status:',
                                                                      style: GoogleFonts.alegreya(
                                                                          color: Colors
                                                                              .redAccent,
                                                                          fontSize: size.height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    size.height *
                                                                        0.25,
                                                                width:
                                                                    size.width *
                                                                        0.4,
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      openItems![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      style: GoogleFonts.alatsi(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: size.height *
                                                                              0.014,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      openItems[
                                                                              index]
                                                                          .name
                                                                          .toString(),
                                                                      style: GoogleFonts.alatsi(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: size.height *
                                                                              0.014,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      openItems[
                                                                              index]
                                                                          .mobile
                                                                          .toString(),
                                                                      style: GoogleFonts.alatsi(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: size.height *
                                                                              0.014,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      openItems[
                                                                              index]
                                                                          .services
                                                                          .toString(),
                                                                      style: GoogleFonts.alatsi(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: size.height *
                                                                              0.014,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      openItems[
                                                                              index]
                                                                          .address
                                                                          .toString(),
                                                                      style: GoogleFonts.alatsi(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: size.height *
                                                                              0.014,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      openItems[
                                                                              index]
                                                                          .typeOfService
                                                                          .toString(),
                                                                      style: GoogleFonts.alatsi(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: size.height *
                                                                              0.014,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      openItems[
                                                                              index]
                                                                          .status
                                                                          .toString(),
                                                                      style: GoogleFonts.alatsi(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize: size.height *
                                                                              0.014,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  child: Column(
                    children: [],
                  ),
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.00,
                  right: size.width * 0.00,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.00),
                    child: Container(
                      height: size.height * 0.8,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: MyTheme.t1bacgroundcolors1,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            SizedBox(
                              height: size.height * 0.8,
                              child: Obx(
                                () => complaintListController.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                        color: MyTheme.t1containercolor,
                                      ))
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: complaintListController
                                            .complaintListCloseModel
                                            ?.closeresult
                                            ?.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final closeItems =
                                              complaintListController
                                                  .complaintListCloseModel
                                                  ?.closeresult;
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.04,
                                                vertical: size.height * 0.001),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.01,
                                                  vertical:
                                                      size.height * 0.004),
                                              child: PhysicalModel(
                                                color: Colors.white,
                                                shadowColor: Colors.grey,
                                                elevation: 3,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(ComplainListDetail(
                                                        name: closeItems[index]
                                                            .name
                                                            .toString(),
                                                        mobile:
                                                            closeItems[index]
                                                                .mobile
                                                                .toString(),
                                                        address:
                                                            closeItems[index]
                                                                .address
                                                                .toString(),
                                                        product_service:
                                                            closeItems[index]
                                                                .typeOfService
                                                                .toString(),
                                                        serviceType:
                                                            closeItems[index]
                                                                .services
                                                                .toString(),
                                                        status:
                                                            closeItems[index]
                                                                .status
                                                                .toString(),
                                                      ));
                                                    },
                                                    child: Container(
                                                      height:
                                                          size.height * 0.26,
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            MyTheme.gradient7,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.25,
                                                              width:
                                                                  size.width *
                                                                      0.4,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Complain:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Name:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Mobile:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Product/S:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Address:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Service type:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Status:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.25,
                                                              width:
                                                                  size.width *
                                                                      0.4,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    closeItems![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    closeItems[
                                                                            index]
                                                                        .name
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    closeItems[
                                                                            index]
                                                                        .mobile
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    closeItems[
                                                                            index]
                                                                        .services
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    closeItems[
                                                                            index]
                                                                        .address
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    closeItems[
                                                                            index]
                                                                        .typeOfService
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    closeItems[
                                                                            index]
                                                                        .status
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  //color: MyTheme.t1navbar1,
                  child: Column(
                    children: [],
                  ),
                ),
                Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.00,
                  right: size.width * 0.00,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.00),
                    child: Container(
                      height: size.height * 0.8,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: MyTheme.t1bacgroundcolors1,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.014,
                            ),
                            SizedBox(
                              height: size.height * 0.8,
                              child: Obx(
                                () => complaintListController.isLoading.value
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: MyTheme.t1containercolor,
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: complaintListController
                                            .complaintListPendingModel
                                            ?.pendingresult
                                            ?.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final pendingItems =
                                              complaintListController
                                                  .complaintListPendingModel
                                                  ?.pendingresult;
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: size.width * 0.04,
                                                vertical: size.height * 0.001),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: size.width * 0.01,
                                                  vertical:
                                                      size.height * 0.004),
                                              child: PhysicalModel(
                                                color: Colors.white,
                                                shadowColor: Colors.grey,
                                                elevation: 3,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Get.to(ComplainListDetail(
                                                        name:
                                                            pendingItems![index]
                                                                .name
                                                                .toString(),
                                                        mobile:
                                                            pendingItems[index]
                                                                .mobile
                                                                .toString(),
                                                        address:
                                                            pendingItems[index]
                                                                .address
                                                                .toString(),
                                                        product_service:
                                                            pendingItems[index]
                                                                .typeOfService
                                                                .toString(),
                                                        serviceType:
                                                            pendingItems[index]
                                                                .services
                                                                .toString(),
                                                        status:
                                                            pendingItems[index]
                                                                .status
                                                                .toString(),
                                                      ));
                                                    },
                                                    child: Container(
                                                      height:
                                                          size.height * 0.26,
                                                      width: size.width,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            MyTheme.gradient7,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.25,
                                                              width:
                                                                  size.width *
                                                                      0.4,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Complain:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Name:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Mobile:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Product/S:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Address:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Service type:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    'Status:',
                                                                    style: GoogleFonts.alegreya(
                                                                        color: Colors
                                                                            .redAccent,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.017,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                                  size.height *
                                                                      0.25,
                                                              width:
                                                                  size.width *
                                                                      0.4,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    pendingItems![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    pendingItems[
                                                                            index]
                                                                        .name
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    pendingItems[
                                                                            index]
                                                                        .mobile
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    pendingItems[
                                                                            index]
                                                                        .services
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    pendingItems[
                                                                            index]
                                                                        .address
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    pendingItems[
                                                                            index]
                                                                        .typeOfService
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    pendingItems[
                                                                            index]
                                                                        .status
                                                                        .toString(),
                                                                    style: GoogleFonts.alatsi(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            size.height *
                                                                                0.014,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
