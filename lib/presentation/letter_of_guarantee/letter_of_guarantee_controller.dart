import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../data/local/box/box_storage.dart';
import '../../data/model/loslog/loslog.dart';
import '../../data/remote/ebeasiswa/loslog/loslog_datasource.dart';
import 'package:http/http.dart' as http;

class LetterOfGuaranteeController extends GetxController {

  LosLogDataSource losLogDataSource =
      LosLogDataSource();
    final BoxStorage boxStorage = BoxStorage();

   Future<List<Loslog>> getUserFund()async{
    String token = boxStorage.getUserToken();
    print('get token : $token');
    final response = boxStorage.getUserName() == 'dewianggreni06@yahoo.co.id' ?  await losLogDataSource.userloslogDummy(token: token): await losLogDataSource.userloslog(token: token);
    print('get response : $response');
     if (response['data'] != null) {
      await Future.delayed(const Duration(seconds: 2));
        List<dynamic> parsed =  response['data'];
        List<Loslog> userfund =   parsed.map((i) => Loslog.fromJson(i)).toList();
      return userfund;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return [];

      }
  }
   Future<List<Loslog>> getUserlos()async{
    String token = boxStorage.getUserToken();
    print('get token : $token');
    final response = boxStorage.getUserName() == 'dewianggreni06@yahoo.co.id' ?  await losLogDataSource.userlosDummy(token: token): await losLogDataSource.userloslog(token: token);
    print('get response : $response');
     if (response['data'] != null) {
      await Future.delayed(const Duration(seconds: 2));
        List<dynamic> parsed =  response['data'];
        List<Loslog> userfund =   parsed.map((i) => Loslog.fromJson(i)).toList();
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