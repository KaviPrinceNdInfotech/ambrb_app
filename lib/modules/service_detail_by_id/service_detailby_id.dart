import 'package:ambrd_appss/controllers/home_controllers/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesDetail extends StatelessWidget {
  ServicesDetail({Key? key}) : super(key: key);
  HomeController _homePageController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final img = 'http://admin.ambrd.in/Images/';

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Service Details"),
        ),
        body: Obx(
          () => (_homePageController.isLoading.value)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _homePageController.serviceDetailModel?.serviceName == null
                  ? Center(
                      child: Text('No Image'),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "${_homePageController.serviceDetailModel?.serviceName}",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width,
                            color: Colors.red,
                            child: Image.network(
                              '$img${_homePageController.serviceDetailModel?.image}'
                              // "https://images.unsplash.com/photo-1502740479091-635887520276?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80"
                              // base +
                              //'${_homePageController.getcatagartlist!.result![index].imageName.toString()}'
                              ,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                //if image not comming in catagary then we have to purchase

                                return Icon(
                                  Icons.error,
                                  color: Colors.grey,
                                );
                              },

                              height: size.height * 0.056,
                              width: size.width * 0.15,
                              // color: _homePageController
                              //             .selectedIndex
                              //             .value ==
                              //         index
                              //     ? Colors.white
                              //     : MyTheme.ThemeColors
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                """${_homePageController.serviceDetailModel?.description}"""
                                // /oDUCSJKHXBSAOIIY LXHJSbyclxh gwSBkkokdsomvdsVCDSJ NVUBQERYFITVUYSIBOONPJPX INSUBDYVTFIW
                                //"""

                                ///  'Services Name'
                                ),
                          ),
                        ),
                      ],
                      //Text('Service Name')
                    ),
        ));
  }
}
