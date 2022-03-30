import 'package:flagstat_app/shared/services/api.service.dart';
import 'package:get/get.dart';

class AuthProvider extends ApiService {
  Future register({
    required String email,
    required String password,
    required dynamic device,
    required bool terms,
    bool newsletter = false,
  }) {
    return post('/register', {
      'email': email,
      'password': password,
      'device': device,
      'privacyPolicy': {'terms': terms, 'newsletter': newsletter}
    }).then((Response res) {
      if (res.hasError) {
        handleError(res);
      }
      return res.body;
    });
  }

  Future login({
    required String email,
    required String password,
    required dynamic device,
  }) {
    return post('/login', {
      'email': email,
      'password': password,
      'device': device,
    }).then((Response res) {
      if (res.hasError) {
        handleError(res);
        return Future.error(res);
      }
      return res.body;
    });
  }
}
