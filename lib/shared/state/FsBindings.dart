import 'package:flagstat_app/features/auth/controllers/auth.controller.dart';
import 'package:flagstat_app/shared/controllers/global.controller.dart';
import 'package:get/get.dart';

class FsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<GlobalController>(GlobalController());
  }
}