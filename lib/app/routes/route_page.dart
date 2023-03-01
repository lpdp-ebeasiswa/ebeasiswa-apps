import 'package:ebeasiswa/app/routes/route_name.dart';
import 'package:ebeasiswa/presentation/notification/notification_controller.dart';
import 'package:ebeasiswa/presentation/notification/notification_detail_view.dart';
import 'package:ebeasiswa/presentation/notification/notification_local_view.dart';
import 'package:ebeasiswa/presentation/splash_screen/splash_screen_view.dart';
import 'package:get/get.dart';
// import 'package:ebeasiswa/presentation/account/account_view.dart';
// import 'package:ebeasiswa/presentation/account_menu/callcenter_menu_view.dart';
// import 'package:ebeasiswa/presentation/account_menu/umum_menu_view.dart';
// import 'package:ebeasiswa/presentation/expenditure/expenditure_view.dart';
// import 'package:ebeasiswa/presentation/faq/faq_view.dart';
// import 'package:ebeasiswa/presentation/forgot_password/confirmation_password_view.dart';
// import 'package:ebeasiswa/presentation/forgot_password/forgot_password_view.dart';
import 'package:ebeasiswa/presentation/home/home_view.dart';
import 'package:ebeasiswa/presentation/login/login_view.dart';
import 'package:ebeasiswa/presentation/notification/notification_view.dart';
import 'package:ebeasiswa/presentation/onboarding/onboarding_view.dart';
// import 'package:ebeasiswa/presentation/registration/registration_view.dart';
// import 'package:ebeasiswa/presentation/splash_screen/splash_screen_view.dart';
// import 'package:ebeasiswa/presentation/update_profile/update_profile_view.dart';
// import 'package:ebeasiswa/presentation/verifikasi_account/send_code_view.dart';
// import 'package:ebeasiswa/presentation/verifikasi_account/verifikasi_account_view.dart';
// import 'package:ebeasiswa/presentation/verifikasi_email/verfikasi_email_view.dart';

class RoutesPage {
  static final Init = RoutesName.splashScreen;
  static final routes = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: RoutesName.onBoarding,
      page: () => const OnBoardingView(),
    ),
    GetPage(
      name: RoutesName.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
    ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const RegistrationView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const ForgotPasswordView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const ConfirmationPasswordView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const VerifikasiAcountView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const SendCodeView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const AccountView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const UmumMenuView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const CallcenterMenuView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const ExpenditureView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const FaqView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const UpdateProfileView(),
    // ),
    // GetPage(
    //   name: RoutesName.home,
    //   page: () => const VerifikasiEmailView(),
    // ),
    GetPage(
      name: RoutesName.notification,
      page: () => const NotificationView(),
    ),
    GetPage(
      name: RoutesName.notificationLocal,
      page: () => const NotificationLocalView(),
    ),
    GetPage(
      name: RoutesName.notificationDetail,
      page: () => const NotificationDatailView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<NotificationController>(() => NotificationController());
      }),
    ),
  ];
}
