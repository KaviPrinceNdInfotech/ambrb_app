import 'package:ambrd_appss/modules/search_page/search_page_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_theme/app_color.dart';
import '../../controllers/registration_list_controller/registration_list_controller.dart';

class RegistrationList extends StatefulWidget {
  const RegistrationList({Key? key}) : super(key: key);

  @override
  State<RegistrationList> createState() => _RegistrationListState();
}

class _RegistrationListState extends State<RegistrationList> {
  String search = '';
  TextEditingController searchController = TextEditingController();
  RegistrationListController registrationListController =
      Get.put(RegistrationListController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: MyTheme.t1navbar1,
            leadingWidth: 20,
            centerTitle: false,
            title: Container(
              margin: const EdgeInsets.only(right: 0),
              width: size.width - 30,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFFFFFFF).withOpacity(0.4)),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.3),
                  ),
                  hintText: 'search',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.black.withOpacity(0.3),
                onChanged: (String? value) {
                  setState(() {
                    search = value.toString();
                  });
                },
                keyboardType: TextInputType.phone,
              ),
            ),
            titleSpacing: 10,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 24,
                  )),
            ),
          ),
          body: Center(
            child: Obx(
              () => (registrationListController.isLoading.value)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: registrationListController
                                  .getRegistrationList?.result?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var item = registrationListController
                                    .getRegistrationList?.result;
                                late String? position =
                                    item?[index].number.toString();
                                if (searchController.text.isEmpty) {
                                  return Card(
                                    elevation: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(64, 75, 96, .9),
                                      ),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 10.0),
                                        leading: Container(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white24),
                                          )),
                                          child: CircleAvatar(
                                            radius: 32,
                                            backgroundColor: Colors.grey,
                                            child: Icon(
                                              Icons.account_circle,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          "${item?[index].number}",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Flexible(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "${item?[index].name}",
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                  softWrap: true,
                                                  maxLines: 3,
                                                )
                                              ],
                                            ))
                                          ],
                                        ),
                                        trailing: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchPageDetail(
                                                        name:
                                                            "${item?[index].name.toString()}"),
                                              ));
                                        },
                                      ),
                                    ),
                                  );
                                } else if (position!.toLowerCase().contains(
                                    searchController.text.toLowerCase())) {
                                  return Card(
                                    elevation: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(64, 75, 96, .9),
                                      ),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 10.0),
                                        leading: Container(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white24),
                                          )),
                                          child: const CircleAvatar(
                                            radius: 32,
                                            backgroundColor: Colors.grey,
                                            //backgroundImage: NetworkImage(_image[index]),
                                          ),
                                        ),
                                        title: Text(
                                          item![index].number.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Flexible(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                      text: item[index].name,
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  softWrap: true,
                                                  maxLines: 3,
                                                )
                                              ],
                                            ))
                                          ],
                                        ),
                                        trailing: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchPageDetail(
                                                        name:
                                                            "${item[index].name}"),
                                              ));
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }),
                        ),
                      ],
                    ),
            ),
          )),
    );
  }
}
