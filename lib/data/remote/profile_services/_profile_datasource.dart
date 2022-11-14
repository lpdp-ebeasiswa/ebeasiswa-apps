part of 'profile_services.dart';

class ProfileDataSource {
  Future<dynamic> loadDataProfileUser() async {
    String pathUrl = MasterUri.pathMock.mockProfile;
    return ApiClient().getList(pathUrl);
  }
}
