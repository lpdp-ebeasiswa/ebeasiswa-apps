import 'package:get_storage/get_storage.dart';

class BoxStorage {
  final GetStorage _getStorage = GetStorage();

  static const _firstInstallKey = 'first_install';
  static const _selectedSplashScreenKey = 'splash_screen';
  static const _userIdKey = 'user_id';
  static const _userAvatarKey = 'user_avatar';
  static const _userNameKey = 'user_username';
  static const _userPasswordKey = 'user_password';
  static const _userRememberMe = 'user_remember_me';
  static const _rememberMeCheck = 'rememberMeCheck';

  static const _token = 'token';
  static const _fcmtoken = 'fcmtoken';

  static const _countNotif = 'countNotif';

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

  String getUserName() => _getStorage.read(_userNameKey) ?? '';

  void deleteUserName() => _getStorage.remove(_userNameKey);

  void setUserPassword(String password) {
    _getStorage.write(_userPasswordKey, password);
  }

  String getUserPassword() => _getStorage.read(_userPasswordKey) ?? '';

  void deleteUserPassword() => _getStorage.remove(_userPasswordKey);

  void setUserRememberMe(bool uncheck) {
    _getStorage.write(_userRememberMe, uncheck);
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

  Future<void> clearCache() {
    final isClear = _getStorage.erase();
    return isClear;
  }

// Token User
  void setToken(String token) {
    _getStorage.write(_token, token);
  }

  String getToken() => _getStorage.read(_token) ?? '';
  deleteToken() => _getStorage.remove(_token);

// Token Fcm User
  void setStoageToken(String fcmtoken) {
    _getStorage.write(_fcmtoken, fcmtoken);
  }

  String getStorageToken() => _getStorage.read(_fcmtoken) ?? '';
  void deleteStorageToken() => _getStorage.remove(_fcmtoken);

//set jumlah notif yang belum di baca
  void setCountNotif(int countNotif) {
    _getStorage.write(_countNotif, countNotif);
  }

//get jumlah notif yang belum di baca
  int getCountNotif() => _getStorage.read(_countNotif) ?? 0;
}
