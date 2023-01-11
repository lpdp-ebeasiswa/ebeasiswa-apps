class MasterUri {
  static Baseuri get baseurl => Baseuri();
  static PathAuth get pathAuth => PathAuth();
  static PathMock get pathMock => PathMock();
}

class Baseuri {
  String get baseAuth => "http://103.176.78.112:8080/";

  String get baseMock => "https://dityadeveloper.github.io/";

  String get basePushNotif => "https://fcm.googleapis.com/fcm/send";
}

class PathAuth {
  String get authLogin => "Login";
}

class PathMock {
  String get mockExpenditureList =>
      "mock/ebeasiswa/spending/expenditure_list.json";

  String get mockProfile => "mock/ebeasiswa/account/detailuser.json";
}
