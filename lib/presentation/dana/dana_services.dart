import 'dart:async';
import 'dart:convert';

// import 'package:ebeasiswa/presentation/dana/dana_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../../app/constant/baseurl.dart';

class ServicesDana {
  String urlMockListDana = BaseUrlMock().mockListDana;

  Future<dynamic> getAllPosts() async {
    try {
      var response = await http
          .get(Uri.parse(urlMockListDana))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connection Time Out Try Again");
      });

      debugPrint('response code---> ${response.statusCode}');
      debugPrint('response body data---> ${jsonDecode(response.body)['data']}');

      if (response.statusCode == 200) {
        debugPrint('respons body---> ${json.decode(response.body)}');

        // dynamic jsonrespon =
        // PostModelDana.fromJson(jsonDecode(response.body)['data']);

        // debugPrint('jsonrespon ====> $jsonrespon');

        // List<PostModelDana> model =
        //     jsonrespon.map((e) => PostModelDana.fromJson(e)).toList();

        // debugPrint('jsonrespon list ====> $jsonrespon');

        // return model;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("Respon Time Out");
    }
    return null;
  }
}
