part of 'expenditure_services.dart';

class ExpenditureDataSource {
  Future<dynamic> loadListExpenditureUser()async{
    String pathUrl = MasterUri.pathMock.mockExpenditureList;
    return ApiClient().getList(pathUrl);
  }
}