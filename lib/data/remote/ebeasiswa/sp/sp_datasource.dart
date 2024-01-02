import 'package:flutter/foundation.dart';

import '../../../../app/constant/baseurl.dart';
import '../../../../app/helper/api_client/api_client_helper.dart';
import '../../../local/box/box_storage.dart';

class SPDataSource {
  final BoxStorage boxStorage = BoxStorage();

    Future<dynamic> userSP({required String token}) async {
    String pathUrl = MasterUri.pathSP.sp;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }
    Future<dynamic> userSPDummy({required String token}) async {
    String pathUrl = MasterUri.pathSP.spDummy;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }

}
