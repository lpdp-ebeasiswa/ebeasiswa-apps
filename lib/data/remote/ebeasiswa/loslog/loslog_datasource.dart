import 'package:flutter/foundation.dart';

import '../../../../app/constant/baseurl.dart';
import '../../../../app/helper/api_client/api_client_helper.dart';
import '../../../local/box/box_storage.dart';

class LosLogDataSource {
  final BoxStorage boxStorage = BoxStorage();

    Future<dynamic> userloslog({required String token}) async {
    String pathUrl = MasterUri.pathLoslog.loslog;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }
    Future<dynamic> userloslogDummy({required String token}) async {
    String pathUrl = MasterUri.pathLoslog.loslogDummy;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }
    Future<dynamic> userlosDummy({required String token}) async {
    String pathUrl = MasterUri.pathLoslog.losDummy;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }

}
