part of 'api_client_helper.dart';

class PayloadData {
  Future<Map?> catchPayloadData(http.Response response) async {
    try {
      switch (response.statusCode) {
        case 200:
          final jsonResponse = json.decode(response.body);
          debugPrint("clog : $jsonResponse");
          return jsonResponse;
        case 401:
          final jsonResponse = {"error": true};
          return jsonResponse;
        case 500:
          final jsonResponse = {"error": true};
          return jsonResponse;
      }
    } on SocketException {
      Get.snackbar('Notification', 'Invalid link');
    }
    return {"error": true, "data": []};
  }
}
