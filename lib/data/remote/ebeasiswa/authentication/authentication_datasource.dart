import 'package:flutter/foundation.dart';

import '../../../../app/constant/baseurl.dart';
import '../../../../app/helper/api_client/api_client_helper.dart';
import '../../../local/box/box_storage.dart';

class AuthenticationDataSource {
  final BoxStorage boxStorage = BoxStorage();

  Future<dynamic> loginUser(Map<String,String> requestBody) async {
    String pathUrl = MasterUri.pathAuth.authLogin;
    debugPrint("path running on : $pathUrl - request body : $requestBody");
    return ApiClient()
        .post(pathUrl: pathUrl, requestBody: requestBody, token: '');
  }

    Future<dynamic> profileUser({required String token}) async {
    String pathUrl = MasterUri.pathAuth.authProfile;
    debugPrint("path running on : $pathUrl");
    return ApiClient().get(pathUrl: pathUrl, token: token);
  }

}
