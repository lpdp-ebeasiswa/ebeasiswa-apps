import 'package:ebeasiswa/data/model/profile/profile_model.dart';
import 'package:ebeasiswa/data/remote/profile_services/profile_services.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  ProfileModel? profileModel;

  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  ProfileServices profileServices = ProfileServices();

  @override
  void onInit() {
    super.onInit();
    onFetchProfile();
  }

  Future<ProfileModel?> onFetchProfile() async {
    isLoading(true);
    try {
      final data = await profileServices.profileServices();
      profileModel = data;
      isLoading(false);
      isError(false);
    } catch (e) {
      isLoading(false);
      isError(true);
      throw Exception(e);
    }
    return null;
  }
}
