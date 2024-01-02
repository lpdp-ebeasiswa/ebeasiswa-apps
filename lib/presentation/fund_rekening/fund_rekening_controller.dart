import 'dart:convert';

import 'package:ebeasiswa/data/model/fund_request/fund_request_model.dart';
import 'package:get/get.dart';

import '../../data/local/box/box_storage.dart';
import '../../data/remote/ebeasiswa/funding/funding_datasource.dart';

class FundRekeningController extends GetxController {

  FundingDataSource fundingDataSource =
      FundingDataSource();
    final BoxStorage boxStorage = BoxStorage();

   Future<List<UserFunding>> getUserFund()async{
    String token = boxStorage.getUserToken();
    print('get token : $token');
    final response = boxStorage.getUserName() == 'dewianggreni06@yahoo.co.id' ?  await fundingDataSource.userFundingDummy(token: token): await fundingDataSource.userFunding(token: token);
    print('get response : $response');
     if (response['metadata'] != null) {
      await Future.delayed(const Duration(seconds: 2));
        List<dynamic> parsed =  response['metadata']['data'];
        List<UserFunding> userfund =   parsed.map((i) => UserFunding.fromJson(i)).toList();
      return userfund;
      } else{
        Get.snackbar('Error', 'mohon coba kembali');
       return [];

      }
  }


}