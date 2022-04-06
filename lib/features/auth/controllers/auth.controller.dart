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
        .register(email: email, password: password, device: device, terms: terms, newsletter: newsletter)
        .then((res) { user.value.email = res['email']; });
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

  passwordReset({
    required String email,
  }) {
    return authProvider
        .passwordReset(email: email);
  }

  passwordResetToken({
    required String token,
    required String password,
  }) {
    return authProvider
        .passwordResetToken(token: token, password: password);
  }
}
