import 'package:flagstat_app/shared/models/Country.model.dart';
import 'package:flagstat_app/shared/providers/global.provider.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  RxList<CountryModel> countries = <CountryModel>[].obs;

  GlobalProvider globalProvider = Get.put(GlobalProvider());

  getCountries() {
    // return globalProvider.getCountries()
    //     .then((res) {
    //
    //     });
  }
}
