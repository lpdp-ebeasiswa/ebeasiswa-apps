import 'dart:async';

import 'package:ebeasiswa/presentation/dana/dana_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../app/constant/baseurl.dart';

class ServicesDana {
  String urlMockListDana = BaseUrlMock().mockListDana;

  Future<List<PostModelDana>?> getAllPosts() async {
    try {
      var respons = await http
          .get(Uri.parse(urlMockListDana))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connection Time Out Try Again");
      });

      debugPrint('respons ---> ${respons.statusCode}');

      if (respons.statusCode == 200) {
        dynamic jsonrespon = convert.jsonDecode(respons.body)['data'];

        debugPrint('jsonrespon====> $jsonrespon');

        List<PostModelDana> model =
            jsonrespon.map((e) => PostModelDana.fromJson(e)).toList();
        return model;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("Respon Time Out");
    }
    return null;
  }
}
