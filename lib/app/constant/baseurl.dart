class MasterUri {
  static Baseuri get baseurl => Baseuri();
  static PathAuth get pathAuth => PathAuth();
  static PathMock get pathMock => PathMock();
}
class Baseuri {
  String get baseAuth => "http://103.176.78.112:8080/";

  String get baseMock => "https://dityadeveloper.github.io/";
}

class PathAuth{
   String get authLogin => "Login";
}

class PathMock{
    String get mockExpenditureList => "mock/ebeasiswa/spending/expenditure_list.json";
}

class patchMockApi {}

class BaseUrlMock {
  String get mockListDana =>
      "https://dityadeveloper.github.io/mock/ebeasiswa/spending/expenditure_list.json";

  String get mockDetailProfile =>
      "https://dityadeveloper.github.io/mock/ebeasiswa/";
}
