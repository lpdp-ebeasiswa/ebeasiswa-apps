import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import '../../local/box/box_storage.dart';

class PushNotifikasiServices {
  final boxstorage = BoxStorage();
  Future<dynamic> sendNotification(String token, String? username) async {
    Map data = {
      "app_id": "01a913d7-1c1a-46c0-aa15-c42ff9c575bf",
      "include_external_user_ids": [token],
      "android_accent_color": "FF9976D2",
      "small_icon": "@mipmap/ic_launcher",
      "large_icon":
          "https://awsimages.detik.net.id/visual/2020/08/13/lpdp-kemenkeu.jpeg?w=650",
      "headings": {"en": "Ebeasiswa aaaaaaaaaaa"},
      "contents": {"en": "SELAMAT DATANG DI APPS EBEASISWA"},
      "data": {"user": "pic"},
      "big_picture":
          "https://awsimages.detik.net.id/visual/2020/08/13/lpdp-kemenkeu.jpeg?w=650"
    };
    var bodyRequestParam = jsonEncode(data);

    return await http.Client().post(
      Uri.parse("https://onesignal.com/api/v1/notifications"),
      body: bodyRequestParam,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            "Basic MzE1OGM3YzctZWE3OC00YWMzLThiMjAtM2JmYzkzZDI3ZDk2"
      },
    ).then((http.Response response) {
      print('oneSignal ${response.statusCode} - ${response.body}');
    });
  }

  sendingDataNotification(String? title, String? body, String? username) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference notification = firestore.collection("notification");
    DocumentReference docReference = notification.doc();
    try {
      await notification.doc(docReference.id).set({
        'id': docReference.id,
        'uid': boxstorage.getToken(),
        'username': username,
        'title': title,
        'body': body,
        'createdAt': DateTime.now(),
      });
      print("Berhasil Add Notif");
    } catch (e) {
      print(e);
    }
  }
}
