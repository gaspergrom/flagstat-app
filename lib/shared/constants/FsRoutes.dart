import 'package:flagstat_app/features/auth/views/AuthForgotPassword.dart';
import 'package:flagstat_app/features/auth/views/AuthForgotPasswordReset.dart';
import 'package:flagstat_app/features/auth/views/AuthForgotPasswordSuccess.dart';
import 'package:flagstat_app/features/auth/views/AuthLogin.dart';
import 'package:flagstat_app/features/auth/views/AuthMain.dart';
import 'package:flagstat_app/features/auth/views/AuthRegister.dart';
import 'package:flagstat_app/features/auth/views/AuthRegisterSuccess.dart';
import 'package:flagstat_app/features/onboarding/views/OnboardingMain.dart';
import 'package:flagstat_app/features/onboarding/views/manager/OnboardingManagerDetails.dart';
import 'package:flagstat_app/features/onboarding/views/manager/OnboardingManagerLocation.dart';
import 'package:flagstat_app/features/onboarding/views/manager/OnboardingManagerMain.dart';
import 'package:flagstat_app/features/onboarding/views/manager/OnboardingManagerSuccess.dart';
import 'package:flagstat_app/features/onboarding/views/player/OnboardingPlayerLinkSuccess.dart';
import 'package:flagstat_app/features/onboarding/views/player/OnboardingPlayerMain.dart';
import 'package:flagstat_app/features/onboarding/views/player/OnboardingPlayerManual.dart';
import 'package:flagstat_app/features/onboarding/views/player/OnboardingPlayerManualSuccess.dart';
import 'package:flagstat_app/features/onboarding/views/visitor/OnboardingVisitorMain.dart';
import 'package:get/get.dart';

class FsRoute {
  static const authHome = '/auth';
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
  static const authRegisterSuccess = '/auth/register/success';
  static const authForgotPassword = '/auth/forgot-password';
  static const authForgotPasswordSuccess = '/auth/forgot-password/success';
  static const authForgotPasswordReset = '/auth/forgot-password/reset';

  static const onboardingHome = '/onboarding';
  static const onboardingVisitorHome = '/onboarding/visitor';
  static const onboardingPlayerHome = '/onboarding/player';
  static const onboardingPlayerLinkSuccess = '/onboarding/player/link/success';
  static const onboardingPlayerManual = '/onboarding/player/manual';
  static const onboardingPlayerManualSuccess = '/onboarding/player/manual/success';
  static const onboardingManagerHome = '/onboarding/manager';
  static const onboardingManagerDetails = '/onboarding/manager/details';
  static const onboardingManagerLocation = '/onboarding/manager/location';
  static const onboardingManagerSuccess = '/onboarding/manager/success';
}

List<GetPage<dynamic>> routes = [
  GetPage(name: FsRoute.authHome, page: () => const AuthMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authLogin, page: () => AuthLogin(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authRegister, page: () => AuthRegister(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authRegisterSuccess, page: () => AuthRegisterSuccess(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authForgotPassword, page: () => AuthFogotPassword(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authForgotPasswordSuccess, page: () => AuthForgotPasswordSuccess(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authForgotPasswordReset, page: () => AuthFogotPasswordReset(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),

  GetPage(name: FsRoute.onboardingHome, page: () => OnboardingMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingVisitorHome, page: () => OnboardingVisitorMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingPlayerHome, page: () => const OnboardingPlayerMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingPlayerLinkSuccess, page: () => const OnboardingPlayerLinkSuccess(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingPlayerManual, page: () => OnboardingPlayerManual(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingPlayerManualSuccess, page: () => const OnboardingPlayerManualSuccess(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingManagerHome, page: () => OnboardingManagerMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingManagerDetails, page: () => OnboardingManagerDetails(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingManagerLocation, page: () => OnboardingManagerLocation(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingManagerSuccess, page: () => const OnboardingManagerSuccess(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),



];