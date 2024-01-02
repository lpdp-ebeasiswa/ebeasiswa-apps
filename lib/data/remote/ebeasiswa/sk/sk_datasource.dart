import 'package:flutter/foundation.dart';

import '../../../../app/constant/baseurl.dart';
import '../../../../app/helper/api_client/api_client_helper.dart';
import '../../../local/box/box_storage.dart';

class SKDataSource {
  final BoxStorage boxStorage = BoxStorage();

    Future<dynamic> userSK({required String token}) async {
    String pathUrl = MasterUri.pathSK.sk;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }
    Future<dynamic> userSKDummy({required String token}) async {
    String pathUrl = MasterUri.pathSK.skDummy;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }

}
