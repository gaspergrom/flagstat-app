import 'package:flagstat_app/shared/constants/FsRoutes.dart';
import 'package:flagstat_app/shared/constants/FsStorage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ApiService extends GetConnect {
  final _key = "Ez1VG7K7n09oi1vm9XBMZllG1PWeiFxO";
  final _secret =
      "yW38otGucCaJABusVzPgT3oPVK7ME3g27eJSYi1RsyTkItt2ohEo4xrAENPcor3E";
  final url = "http://flagstat-api-dev.herokuapp.com/v1";
  var token;

  GetStorage storage = GetStorage();

  @override
  void onInit() {
    httpClient.baseUrl = url;
    token = storage.read(FsStorage.token);

    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 8);

    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'bearer ${token ?? "$_key:$_secret"}';
      return request;
    });

    httpClient.addAuthenticator<dynamic>((request) {
      var t = storage.read(FsStorage.token);
      if(t != null){
        token = t;
      } else {
        Get.offAllNamed(FsRoute.authHome);
      }
      return request;
    });

    httpClient.maxAuthRetries = 1;

    super.onInit();
  }

  setToken(String? token) {
    this.token = token;
    if(token != null){
      storage.write(FsStorage.token, token);
    } else {
      storage.remove(FsStorage.token);
    }
  }

  handleError(Response error) {
    var e = error.body;
    if (e != null && e['message'] != null) {
      Get.snackbar(e['error'] ?? 'Erorr', e['message'],
          snackPosition: SnackPosition.BOTTOM,
          animationDuration: Duration(milliseconds: 300));
    }

    Get.snackbar('Erorr',
        'There was an error. Please contact support at support@flagstat.app',
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(milliseconds: 300));
  }
}
