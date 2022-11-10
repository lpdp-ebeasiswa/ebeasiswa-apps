import 'dart:async';
import 'dart:convert';

import 'package:ebeasiswa/presentation/profile/profile.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../app/constant/baseurl.dart';

class ServicesProfile {
  String urlMockListDana = BaseUrlMock().mockDetailProfile;

  Future<Profile> getDetailProfile() async {
    try {
      var response = await http
          .get(Uri.parse('${urlMockListDana}account/detailuser.json'))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connection Time Out Try Again");
      });

      if (response.statusCode == 200) {
        debugPrint('respons body---> ${json.decode(response.body)['data']}');

        var jsonMap = json.decode(response.body)['data'];
        var detailUserModel = Profile.fromJson(jsonMap);

        return detailUserModel;
      } else {
        return Future.error('Tidak ada data');
      }
    } on TimeoutException catch (_) {
      throw ("Api error");
    }
  }
}
