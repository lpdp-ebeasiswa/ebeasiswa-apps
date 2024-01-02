class MasterUri {
  static Baseuri get baseurl => Baseuri();
  static PathAuth get pathAuth => PathAuth();
  static PathFunding get pathFund => PathFunding();
  static PathLosLog get pathLoslog => PathLosLog(); 
  static PathPK get pathPk => PathPK(); 
  static PathSP get pathSP => PathSP(); 
  static PathSK get pathSK => PathSK(); 
  static PathMock get pathMock => PathMock();
}

class Baseuri {
  String get baseAuth => "http://103.176.78.112:8080/";

  String get baseMock => "https://dityadeveloper.github.io/";
}

class PathAuth {
  String get authLogin => "/v1/api/login";
  String get authProfile => "/v1/api/profile/info-beasiswa";
}

class PathFunding {
 // String get userFund => "/api/pencairanbeasiswa";
  String get userFund => "/v1/api/profile/10/info-fund-request";
  String get userFundDummy => "/v1/api/profile/10/info-fund-request/dummy";
  String get userFundDetail => "/api/pencairanbeasiswa?id=";
}
class PathLosLog {
 // String get userFund => "/api/pencairanbeasiswa";
  String get loslog => "/v1/api/loslog/10";
  String get loslogDummy => "/v1/api/loslog/10/dummy";
  String get losDummy => "/v1/api/loslog/10/losdummy";
  
}
class PathPK{
 // String get userFund => "/api/pencairanbeasiswa";
  String get pk => "/v1/api/pk/10";
  String get pkDummy => "/v1/api/pk/10/dummy";
  
}
class PathSP {
  String get sp => "/v1/api/sp/10";
  String get spDummy => "/v1/api/sp/10/dummy";
  
}
class PathSK {
  String get sk => "/v1/api/sk/10";
  String get skDummy => "/v1/api/sk/10/dummy";
  
}

class PathMock {
  String get mockExpenditureList =>
      "mock/ebeasiswa/spending/expenditure_list.json";

  String get mockProfile => "mock/ebeasiswa/account/detailuser.json";
}
