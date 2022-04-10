import 'package:flagstat_app/shared/services/api.service.dart';
import 'package:get/get.dart';

class GlobalProvider extends ApiService {
  Future getCountries() {
    return get('/countries')
        .then((Response res) {
      if (res.hasError) {
        handleError(res);
        return Future.error(res);
      }
      return res.body;
    });
  }
}
