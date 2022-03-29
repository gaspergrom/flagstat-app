import 'package:flagstat_app/shared/api/api.service.dart';

class AuthApiService {
  final ApiHttpService _http;

  AuthApiService(this._http);

  Future register(String email, String password){
    return _http.post('/register', body: {
      'email': email,
      'password': password
    });
  }
}

