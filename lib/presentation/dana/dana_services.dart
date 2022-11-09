import 'dart:async';

import 'package:ebeasiswa/presentation/dana/dana_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ServicesDana {
  final fullUrl =
      "https://dityadeveloper.github.io/mock/ebeasiswa/spending/expenditure_list.json";

  Future<List<PostModelDana>?> getAllPosts() async {
    try {
      var respons = await http
          .get(Uri.parse(fullUrl))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Connection Time Out Try Again");
      });

      debugPrint('respons ---> ${respons.statusCode}');

      if (respons.statusCode == 200) {
        List jsonrespon = convert.jsonDecode(respons.body)['data'];

        debugPrint('jsonrespon====> $jsonrespon');

        return jsonrespon.map((e) => PostModelDana.fromJson(e)).toList();
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print("Respon Time Out");
    }
    return null;
  }

  List? data1;

  Future<String> getData() async {
    http.Response response = await http
        .get(Uri.parse(fullUrl), headers: {"Accept": "json.decode/json"});
    return convert.jsonDecode(response.body);
  }
}
