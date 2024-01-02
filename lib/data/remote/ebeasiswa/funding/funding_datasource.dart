import 'package:flutter/foundation.dart';

import '../../../../app/constant/baseurl.dart';
import '../../../../app/helper/api_client/api_client_helper.dart';
import '../../../local/box/box_storage.dart';

class FundingDataSource {
  final BoxStorage boxStorage = BoxStorage();

    Future<dynamic> userFunding({required String token}) async {
    String pathUrl = MasterUri.pathFund.userFund;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }
    Future<dynamic> userFundingDummy({required String token}) async {
    String pathUrl = MasterUri.pathFund.userFundDummy;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }

}
