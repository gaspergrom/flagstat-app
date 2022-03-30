import 'package:flagstat_app/features/auth/models/User.model.dart';
import 'package:flagstat_app/features/auth/providers/auth.provider.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var user = UserModel().obs;

  AuthProvider authProvider = Get.put(AuthProvider());

  login({
    required String email,
    required String password,
    required dynamic device,
  }) {
    return authProvider
        .login(email: email, password: password, device: device)
        .then((res) {
      print(res);
      user.value = UserModel(email: res['email'], id: res['_id']);
    });
  }
}
