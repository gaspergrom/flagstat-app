import 'package:flagstat_app/features/auth/views/AuthLogin.dart';
import 'package:flagstat_app/features/auth/views/AuthMain.dart';
import 'package:flagstat_app/features/auth/views/AuthRegister.dart';
import 'package:get/get.dart';

class FsRoute {
  static const authHome = '/auth';
  static const authLogin = '/auth/login';
  static const authRegister = '/auth/register';
}

List<GetPage<dynamic>> Routes = [
  GetPage(name: FsRoute.authHome, page: () => const AuthMain()),
  GetPage(name: FsRoute.authLogin, page: () => const AuthLogin()),
  GetPage(name: FsRoute.authRegister, page: () => AuthRegister())
];