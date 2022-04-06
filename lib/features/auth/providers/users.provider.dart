import 'package:flagstat_app/shared/services/api.service.dart';
import 'package:get/get.dart';

class UsersProvider extends ApiService {
  Future getCurrentUser() {
    return get('/users/me').then((Response res) {
      if (res.hasError) {
        handleError(res);
        return Future.error(res);
      }
      return res.body;
    });
  }

  Future updateCurrentUser({
    String? name,
    String? defaultCountry,
    String? phoneNumber,
  }) {
    return patch('/users/me', {
      'name': name,
      'defaultCountry': defaultCountry,
      'phoneNumber': phoneNumber,
    }).then((Response res) {
      if (res.hasError) {
        handleError(res);
        return Future.error(res);
      }
      return res.body;
    });
  }
}
