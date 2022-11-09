class MasterUri {
  static BaseUrl get baseUrl => BaseUrl();
  static StorageUri get storageUrl => StorageUri();
  static PathWheather get pathWeather => PathWheather();
  static AuthUrl get authUrl => AuthUrl();
}

class BaseUrl {
  String get prodUrl => "https://aerisweather1.p.rapidapi.com";
}

class StorageUri {
  String get storage => "https://cdn.aerisapi.com/wxicons/v2/";
}

class PathWheather {
  String get dailyforecast => "forecasts";
  String get daily => "conditions";
  String get observation => "observations";
  String get jkt => "jakarta,id";
}

class AuthUrl {
  String get getAuth => "http://103.176.78.112:8080/Login";
}

class BaseUrlMock {
  String get mockListDana =>
      "https://dityadeveloper.github.io/mock/ebeasiswa/spending/expenditure_list.json";
}
