import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountMenuController extends GetxController {
  var phoneNumber = '6281292921433'.obs;
  var email = 'hermanto.ditya@gmail.com'.obs;

  Future<void> callphone() async {
    final Uri launchUri = Uri.parse('tel:${phoneNumber.value}');
    await launchUrl(launchUri);
  }

  Future<void> msgphone() async {
    final Uri launchUri = Uri.parse('sms:${phoneNumber.value}');
    await launchUrl(launchUri);
  }

  Future<void> msgwhatsapp() async {
    Get.snackbar("Info", "Feature not ready yet");
    /*
    final Uri launchUri =
        Uri.parse('https://wa.me/${phoneNumber.value}?text=Your Message here');
    await launchUrl(launchUri);
    */
  }

  Future<void> msgemail() async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: email.value,
      query: 'subject=Halo E-Beasiswa&body=Halo Ebeasiswa',
    );
    await launchUrl(launchUri);
  }

  navCallCenterMenu(int id) async {
    switch (id) {
      case 1:
      await callphone();
        break;
      case 2:
      await  msgphone();
        break;
      case 3:
       await msgemail();
        break;
      case 4:
       await msgwhatsapp();
        break;
    }
  }
}
