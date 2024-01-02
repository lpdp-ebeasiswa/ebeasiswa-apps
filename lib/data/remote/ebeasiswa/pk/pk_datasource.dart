import 'package:flutter/foundation.dart';

import '../../../../app/constant/baseurl.dart';
import '../../../../app/helper/api_client/api_client_helper.dart';
import '../../../local/box/box_storage.dart';

class PKDataSource {
  final BoxStorage boxStorage = BoxStorage();

    Future<dynamic> userPK({required String token}) async {
    String pathUrl = MasterUri.pathPk.pk;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }
    Future<dynamic> userPKDummy({required String token}) async {
    String pathUrl = MasterUri.pathPk.pkDummy;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }

}
