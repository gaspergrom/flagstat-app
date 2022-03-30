import 'package:flagstat_app/features/auth/models/User.model.dart';
import 'package:flagstat_app/features/auth/providers/auth.provider.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var user = UserModel().obs;

  AuthProvider authProvider = Get.put(AuthProvider());

  register({
    required String email,
    required String password,
    required dynamic device,
    required bool terms,
    bool newsletter = false,
  }) {
    return authProvider
        .register(email: email, password: password, device: device, terms: terms, newsletter: newsletter);
  }

  login({
    required String email,
    required String password,
    required dynamic device,
  }) {
    return authProvider
        .login(email: email, password: password, device: device)
        .then((res) {
      user.value = UserModel(email: res['email'], id: res['_id']);
    });
  }
}
