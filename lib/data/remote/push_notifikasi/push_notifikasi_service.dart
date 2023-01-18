import 'dart:convert';
import 'dart:io';

import '../../../app/constant/baseurl.dart';
import 'package:http/http.dart' as http;

class PushNotifikasiServices {
  Future<dynamic> loadPushNotif(String token) async {
    String pathUrl = MasterUri.baseurl.basePushNotif;
    Map data = {
      "data": {
        "title": "ebeasiswa-title",
        "body": "ebeasiswa-body",
        "url": "ebeasiswa-uri",
        "route": "/notification-view"
      },
      "notification": {
        "title": "Pengumuman",
        "body": "Akhir Januari Cuti Bersama",
        "content_available": true
      },
      "to": token,
      "click_action": "FLUTTER_NOTIFICATION_CLICK"
    };
    var bodyRequestParam = jsonEncode(data);
    return await http.Client().post(
      Uri.parse(pathUrl),
      body: bodyRequestParam,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            "key=AAAAwOd7_yg:APA91bGnBXHcxayp7iyZCh_Hu3XUiJ4uNaxzHk_gESytaFflIvkuxoldh1rzOFf4EruAegVrFMbGXeXgX541TOjX3vvOVfBpzQusnPWcX_qFB5RjnhqtbrojYmR-IOKCbf36hJiIjfHO"
      },
    ).then((http.Response response) {
      print('respons------> ${response.statusCode}');
      print('respons------> ${response.body}');
    });
  }
}
