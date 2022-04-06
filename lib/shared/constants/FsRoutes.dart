import 'package:flagstat_app/features/auth/views/AuthForgotPassword.dart';
import 'package:flagstat_app/features/auth/views/AuthForgotPasswordReset.dart';
import 'package:flagstat_app/features/auth/views/AuthForgotPasswordSuccess.dart';
import 'package:flagstat_app/features/auth/views/AuthLogin.dart';
import 'package:flagstat_app/features/auth/views/AuthMain.dart';
import 'package:flagstat_app/features/auth/views/AuthRegister.dart';
import 'package:flagstat_app/features/auth/views/AuthRegisterSuccess.dart';
import 'package:get/get.dart';

class FsRoute {
  static const authHome = '/auth';
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
  static const authRegisterSuccess = '/auth/register/success';
  static const authForgotPassword = '/auth/forgot-password';
  static const authForgotPasswordSuccess = '/auth/forgot-password/success';
  static const authForgotPasswordReset = '/auth/forgot-password/reset';
}

List<GetPage<dynamic>> Routes = [
  GetPage(name: FsRoute.authHome, page: () => const AuthMain(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authLogin, page: () => const AuthLogin(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authRegister, page: () => const AuthRegister(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authRegisterSuccess, page: () => const AuthRegisterSuccess(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authForgotPassword, page: () => const AuthFogotPassword(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authForgotPasswordSuccess, page: () => const AuthForgotPasswordSuccess(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
  GetPage(name: FsRoute.authForgotPasswordReset, page: () => const AuthFogotPasswordReset(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 200)),
];