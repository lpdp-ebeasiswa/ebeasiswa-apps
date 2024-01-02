import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../../model/userBeasiswa/userBeasiswa_model.dart';
import '../../model/userInfoBeasiswa/userInfoBeasiswa_model.dart';
import '../../model/userProfil/user_profile_model.dart';

class BoxStorage {
  final GetStorage _getStorage = GetStorage();

  static const _firstInstallKey = 'first_install';
  static const _selectedSplashScreenKey = 'splash_screen';
  static const _userIdKey = 'user_id';
  static const _userAvatarKey = 'user_avatar';
  static const _userNameKey = 'user_username';
  static const _userPasswordKey = 'user_password';
  static const _userRememberMe = 'user_remember_me';
  static const _userToken = 'user_token';
  static const _disabilitasRole = 'disabilitas_role';
  static const _userData = 'user_data';
  static const _userDataInfoBeasiswa = 'user_data_info_beasiswa';

  void setSplashScreen(String splashScreenKey) {
    _getStorage.write(_selectedSplashScreenKey, splashScreenKey);
  }

  String getSplashScreen() => _getStorage.read(_selectedSplashScreenKey) ?? '';

  void deleteSplashScreen() => _getStorage.remove(_selectedSplashScreenKey);

  void setUserId(String userid) {
    _getStorage.write(_userIdKey, userid);
  }

  String getUserId() => _getStorage.read(_userIdKey) ?? '';

  void deleteUserId() => _getStorage.remove(_userIdKey);

  void setUserAvatar(String userAvatar) {
    _getStorage.write(_userAvatarKey, userAvatar);
  }

  String getUserAvatar() => _getStorage.read(_userAvatarKey) ?? '';

  void deleteUserAvatar() => _getStorage.remove(_userAvatarKey);

  void setUserName(String username) {
    _getStorage.write(_userNameKey, username);
  }

  String getUserToken() => _getStorage.read(_userToken) ?? '';

  void deleteUserToken() => _getStorage.remove(_userToken);

  void setUserToken(String token) {
    _getStorage.write(_userToken, token);
  }

  String getUserName() => _getStorage.read(_userNameKey) ?? '';

  void deleteUserName() => _getStorage.remove(_userNameKey);

  void setUserPassword(String password) {
    _getStorage.write(_userPasswordKey, password);
  }

  String getUserPassword() => _getStorage.read(_userPasswordKey) ?? '';

  void deleteUserPassword() => _getStorage.remove(_userPasswordKey);

  void setUserRememberMe() {
    _getStorage.write(_userRememberMe, true);
  }

  bool getUserRememberMe() {
    final isRememberMe = _getStorage.read(_userRememberMe);
    if (isRememberMe != null) return true;
    return false;
  }

  void deleteUserRememberMe() => _getStorage.remove(_userRememberMe);

  void setFirstInstall() {
    _getStorage.write(_firstInstallKey, true);
    return;
  }

  void deleteFirstInstall() => _getStorage.remove(_firstInstallKey);

  bool getFirstInstall() {
    final isFirstInstall = _getStorage.read(_firstInstallKey);
    if (isFirstInstall != null) return true;
    return false;
  }

  void setDisabilitasRole(bool value) {
    _getStorage.write(_disabilitasRole, value);
  }

  bool getDisabilitasRole() {
    final isdisabilitas = _getStorage.read(_disabilitasRole);
    if (isdisabilitas != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> clearCache() {
    final isClear = _getStorage.erase();
    return isClear;
  }

  void setUserData(UserProfile userModel) {
    String jsonString = jsonEncode(userModel);
    print('saving .. $jsonString');
    _getStorage.write(_userData, jsonString);
  }
   getUserData() {
    var data = _getStorage.read(_userData) ?? '';
    print('data box : $data');
    if(data != '') {
    dynamic jsonData = jsonDecode(data);
    return UserProfile.fromJson(jsonData);
    }else{
      return UserProfile.fromJson({});
    }
  } 
  deleteUserData() => _getStorage.remove(_userData);

  void setUserDataInfoBeasiswa(UserInfoBeasiswaModel userInfoBeasiswaModel) {
    String jsonString = jsonEncode(userInfoBeasiswaModel);
    _getStorage.write(_userDataInfoBeasiswa, jsonString);
  }
   getUserDataInfoBeasiswa() {
    var data = _getStorage.read(_userDataInfoBeasiswa) ?? '';
    if(data != '') {
    dynamic jsonData = jsonDecode(data);
    return UserBeasiswaModel.fromJson(jsonData);
    }else{
      return UserBeasiswaModel.fromJson({});
    }
  } 
  deleteUserDataInfoBeasiswa() => _getStorage.remove(_userDataInfoBeasiswa);
}
