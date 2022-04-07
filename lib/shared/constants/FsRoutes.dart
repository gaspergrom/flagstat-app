import 'package:flagstat_app/features/auth/views/AuthForgotPassword.dart';
import 'package:flagstat_app/features/auth/views/AuthForgotPasswordReset.dart';
import 'package:flagstat_app/features/auth/views/AuthForgotPasswordSuccess.dart';
import 'package:flagstat_app/features/auth/views/AuthLogin.dart';
import 'package:flagstat_app/features/auth/views/AuthMain.dart';
import 'package:flagstat_app/features/auth/views/AuthRegister.dart';
import 'package:flagstat_app/features/auth/views/AuthRegisterSuccess.dart';
import 'package:flagstat_app/features/onboarding/views/OnboardingMain.dart';
import 'package:flagstat_app/features/onboarding/views/manager/OnboardingManagerMain.dart';
import 'package:flagstat_app/features/onboarding/views/player/OnboardingPlayerMain.dart';
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
  static const onboardingManagerHome = '/onboarding/manager';
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
  GetPage(name: FsRoute.onboardingPlayerHome, page: () => OnboardingPlayerMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.onboardingManagerHome, page: () => OnboardingManagerMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),



];