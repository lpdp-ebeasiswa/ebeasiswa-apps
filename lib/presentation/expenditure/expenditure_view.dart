// import 'package:ebeasiswa/presentation/expenditure/expenditure_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../gen/assets.gen.dart';

// class ExpenditureView extends StatelessWidget {
//   const ExpenditureView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final ExpenditureController expenditureController =
//     //     Get.put(ExpenditureController());
//     return Scaffold(
//         appBar: AppBar(
//            automaticallyImplyLeading: false,
//           backgroundColor: const Color(0xFFFF6C06),
//           title: const Text("Riwayat Beasiswa")),
//         body: Container(
//             alignment: Alignment.topCenter,
//             padding: const EdgeInsets.all(20),
//             child: Obx(() {
//               if (expenditureController.isLoading.value) {
//                 return const SizedBox.shrink();
//               } else if (expenditureController.isError.value) {
//                 return Text(
//                     "Error: ${expenditureController.errmsg.value.capitalize}");
//               } else {
//                 return SizedBox(
//                     child: Column(
//                   children: expenditureController.expenditureData
//                       .map<Widget>((data) {
//                     return Card(
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           radius: 25,
//                         child: Assets.image.lpdpLogo
//                             .image(height: 50.0, width: 50.0)),
//                         title: Text(data.name),
//                         subtitle: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(data.email!),
//                             Text(data.address!),
//                             Text(data.expenditure.toString()),
//                             Text(data.expenditureDate!),
//                             Text(data.expenditureTime!),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ));
//               }
//             })));
//   }
// }
