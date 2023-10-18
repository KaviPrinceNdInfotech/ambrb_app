// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
//
// import '../../constants/app_theme/app_color.dart';
// //import 'package:roshini/constants/app_theme/app_color.dart';
//
// class AddBanner extends StatefulWidget {
//   const AddBanner({Key? key}) : super(key: key);
//
//   @override
//   State<AddBanner> createState() => _AddBannerState();
// }
//
// class _AddBannerState extends State<AddBanner> {
//   TextEditingController _textEdit = TextEditingController();
//   File? imagepath;
//   String? imagename;
//   String? imagedata;
//   ImagePicker imagePicker = new ImagePicker();
//   Future<void> getImage() async {
//     var getimage = await imagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       imagepath = File(getimage!.path);
//       imagename = getimage.path.split('/').last;
//       imagedata = base64Encode(imagepath!.readAsBytesSync());
//       // print('imagepath: ${imagepath}');
//       // print('imageName: ${imagename}');
//       // print('imagedata: ${imagedata}');
//     });
//   }
//
//   uploadImage() async {
//     String text = _textEdit.text;
//     var id = int.parse(text);
//     print("captionText: ${id}");
//     try {
//       var url = 'https://jkroshini.com/api/Registration/Banner';
//       http.Response r = await http.post(
//         Uri.parse(url),
//         headers: {
//           "content-type": "application/json",
//           "accept": "application/json",
//         },
//         body: jsonEncode({
//           "VendorId": id,
//           "ImageBase64": "$imagedata",
//           "Image": "$imagename"
//         }),
//       );
//       if (r.statusCode == 200) {
//         Get.snackbar('Success', 'Image Uploaded');
//         print('response333333: ${r.body}');
//         return r;
//       } else {
//         Get.snackbar('Error', 'Image Not Uploaded');
//         return r;
//       }
//     } catch (e) {
//       print('Error');
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: MyTheme.t1navbar1,
//         title: Text(
//           "Upload Banner",
//           style: TextStyle(color: Colors.black),
//         ),
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.black,
//             )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 300,
//               width: 300,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: new Border.all(color: Colors.blue, width: 1.0),
//                   borderRadius: BorderRadius.circular(20)),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: SizedBox.fromSize(
//                     size: Size.fromRadius(48),
//                     child: imagepath != null
//                         ? Image.file(
//                             imagepath!,
//                             fit: BoxFit.cover,
//                           )
//                         : const Center(child: Text("Image Not Choosen yet"))),
//               ),
//             ),
//             // Container(
//             //     height: 300,
//             //     width: 300,
//             //   decoration: new BoxDecoration(
//             //     color: Colors.white,
//             //     border: new Border.all(color: Colors.blueAccent, width: 2.0),
//             //     borderRadius: new BorderRadius.circular(10.0),
//             //   ),
//             //     child: imagepath != null ? Image.file(imagepath!,fit: BoxFit.cover,)
//             //         : Center(child: Text("Image Not Choosen yet"))
//             // ),
//             // imagepath != null ?
//             // Container(
//             //   height: 300,
//             //   width: 300,
//             // child: Image.file(imagepath!),)  :
//             //
//             // Container(
//             //     height: 300,width: 300,
//             //     child: Text("Image Not Choose yet")),
//
//             const SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               controller: _textEdit,
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), label: Text("Enter Vendor Id")),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             InkWell(
//               onTap: () => getImage(),
//               child: Container(
//                 height: 50.0,
//                 decoration: BoxDecoration(
//                   color: Colors.blueAccent,
//                   border: Border.all(color: Colors.white, width: 2.0),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Choose Image',
//                     style: TextStyle(fontSize: 18.0, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             imagepath != null
//                 ? InkWell(
//                     onTap: () {
//                       setState(() {
//                         uploadImage();
//                       });
//                     },
//                     child: Container(
//                       height: 50.0,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.blue, width: 0.5),
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'Upload Image',
//                           style: TextStyle(fontSize: 18.0, color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   )
//                 : Container()
//             // ElevatedButton(onPressed: (){
//             //   getImage();
//             // }, child: Text("Choose Image")),
//
//             // ElevatedButton(onPressed: (){
//             //   setState(() {
//             //     uploadImage();
//             //   });
//             // }, child: Text("Upload Image"))
//           ],
//         ),
//       ),
//     );
//   }
// }
