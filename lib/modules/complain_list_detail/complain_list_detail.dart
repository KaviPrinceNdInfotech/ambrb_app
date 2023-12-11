// import 'package:flutter/material.dart';
//
// import '../../constants/app_theme/app_color.dart';
// //import 'package:roshini/constants/app_theme/app_color.dart';
//
// class ComplainListDetail extends StatelessWidget {
//   ComplainListDetail({
//     Key? key,
//     required this.name,
//     required this.mobile,
//     required this.address,
//     required this.product_service,
//     required this.serviceType,
//     required this.status,
//   }) : super(key: key);
//   String name;
//   String mobile;
//   String address;
//   String product_service;
//   String serviceType;
//   String status;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: MyTheme.t1navbar1,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//               size: 22,
//             )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 dense: true,
//                 leading: Text("Name:", style: TextStyle(fontSize: 16)),
//                 title: Text(name, style: TextStyle(fontSize: 16)),
//               ),
//               ListTile(
//                 dense: true,
//                 leading: Text("Mobile:", style: TextStyle(fontSize: 16)),
//                 title: Text(mobile, style: TextStyle(fontSize: 16)),
//               ),
//               ListTile(
//                 dense: true,
//                 leading: Text("Address:", style: TextStyle(fontSize: 16)),
//                 title: Text(address, style: TextStyle(fontSize: 16)),
//               ),
//               ListTile(
//                 dense: true,
//                 leading:
//                     Text("Product / Service:", style: TextStyle(fontSize: 16)),
//                 title: Text(product_service, style: TextStyle(fontSize: 16)),
//               ),
//               ListTile(
//                 dense: true,
//                 leading: Text("Service type:", style: TextStyle(fontSize: 16)),
//                 title: Text(serviceType, style: TextStyle(fontSize: 16)),
//               ),
//               ListTile(
//                 dense: true,
//                 leading: Text("Status:", style: TextStyle(fontSize: 16)),
//                 title: Text(status, style: TextStyle(fontSize: 16)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     backgroundColor:
//                         MaterialStateProperty.all(MyTheme.t1containercolor),
//                     padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                   ),
//                   child: Text(
//                     "Add Technician",
//                     style: TextStyle(fontSize: 14, color: Colors.white),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
