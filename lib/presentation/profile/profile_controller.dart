import 'package:ebeasiswa/data/model/profile/profile_model.dart';
import 'package:ebeasiswa/data/remote/profile_services/profile_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  ProfileModel? profileModel;

  var isLoading = true.obs;
  var isError = false.obs;
  var errmsg = "".obs;
  ProfileServices profileServices = ProfileServices();

  final box = GetStorage();
  var statusVerifikasi = false.obs;

  // EmailAuth emailAuth = EmailAuth(sessionName: "Test Verifikasi E-Beasiswa");
  // var suksesSend = false.obs;
  // final emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    storageVerifikasi();
    onFetchProfile();
  }

  void storageVerifikasi() {
    box.write('verifikasi', statusVerifikasi);
  }

  // Future<void> sendOTP(String email) async {
  //   var res = await emailAuth.sendOtp(recipientMail: email, otpLength: 4);
  //   if (res) {
  //     suksesSend.value = res;
  //     debugPrint("data verifikasi send email ----> $res");
  //   } else {
  //     suksesSend.value = res;
  //     Get.snackbar('Gagal send Email', 'Email $email tidak valid');
  //     debugPrint("data verifikasi send email ----> $res");
  //   }
  // }

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
