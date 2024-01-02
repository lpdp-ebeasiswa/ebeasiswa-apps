// import 'dart:io';

// import 'package:ebeasiswa/app/constant/baseurl.dart';
// import 'package:ebeasiswa/data/model/profile/profile_model.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import '../../../app/helper/api_client/api_client_helper.dart';
// part '_profile_datasource.dart';

// class ProfileServices {
//   final ProfileDataSource profileDataSource = ProfileDataSource();

//   Future profileServices() async {
//     try {
//       final response = await profileDataSource.loadDataProfileUser();
//       debugPrint('clog $response');
//       debugPrint('clog ${response['data']}');
//       final validationResponse = response['data'];
//       if (validationResponse == []) {
//         debugPrint('clog ${response['data']}');
//         Get.snackbar('Notification', 'Data is empty');
//       } else {
//         final parsedResponse = response['data'] ?? [];
//         debugPrint('clog parsedResponse -------> $parsedResponse');
//         final data = ProfileModel.fromJson(parsedResponse);

//         return data;
//       }
//     } on SocketException {
//       Get.snackbar('Notification', 'Cant load services');
//     }
//     Get.snackbar('Notification', 'Cant load data');

//     return [];
//   }
// }
