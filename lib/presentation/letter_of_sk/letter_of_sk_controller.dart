import 'package:ebeasiswa/data/remote/ebeasiswa/pk/pk_datasource.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../data/local/box/box_storage.dart';
import '../../data/model/SK/sk_model.dart';
import '../../data/model/SP/sp_model.dart';
import '../../data/model/loslog/loslog.dart';
import '../../data/model/pk/pk_model.dart';
import '../../data/remote/ebeasiswa/loslog/loslog_datasource.dart';
import 'package:http/http.dart' as http;

import '../../data/remote/ebeasiswa/sk/sk_datasource.dart';

class LetterOfSKController extends GetxController {

  SKDataSource skDataSource =
      SKDataSource();
    final BoxStorage boxStorage = BoxStorage();

   Future<List<SK>> getUserFund()async{
    String token = boxStorage.getUserToken();
    print('get token : $token');
     final response = boxStorage.getUserName() == 'dewianggreni06@yahoo.co.id' ?  await skDataSource.userSKDummy(token: token): await skDataSource.userSK(token: token);
   
    print('get response : $response');
     if (response['data'] != null) {
      await Future.delayed(const Duration(seconds: 2));
        List<dynamic> parsed =  response['data'];
        List<SK> userfund = parsed.map((i) => SK.fromJson(i)).toList();
      return userfund;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return [];

      }
  }

   Future<String> getDoc({required String url})async{
    String token = boxStorage.getUserToken();
    print('get token : $token');
    
    final response = await http.Client()
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 30), onTimeout: () {
        debugPrint('Request Timeout');
        return http.Response('Request Timeout', 408);
      }).onError((error, stackTrace) {
        debugPrint('invalid connection');
        return http.Response('Internal Server Error', 500);
      });
    
    print('get response : $response');
     if (response.statusCode == 200) {
      await Future.delayed(const Duration(seconds: 2));
  
     return response.body;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
        return '';
      }
  }


}