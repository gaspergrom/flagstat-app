import 'dart:convert';

import 'package:flagstat_app/shared/api/modules/auth.api.service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiHttpService http = ApiHttpService();

  AuthApiService get auth {
    return AuthApiService(http);
  }
}

final apiService = ApiService();

class ApiHttpService {
  final client = http.Client();
  final baseUrl = "flagstat-api-dev.herokuapp.com";
  final prefix = "/v1";
  final key = "Ez1VG7K7n09oi1vm9XBMZllG1PWeiFxO";
  final secret = "yW38otGucCaJABusVzPgT3oPVK7ME3g27eJSYi1RsyTkItt2ohEo4xrAENPcor3E";
  var token = null;

  Future get(path, { Map<String, dynamic>? params,
    Map<String, String> headers = const {}}) {
    final url = Uri.http(baseUrl, '$prefix$path', params);
    return client.get(url, headers: _mapHeaders(headers));
  }

  Future post(path, { Object? body, Map<String, String> headers = const {}}) {
    final url = Uri.http(baseUrl, '$prefix$path');
    return _requestWrapper(client.post(url, body: jsonEncode(body), headers: _mapHeaders(headers)));
  }

  Future patch(path, { Object? body, Map<String, String> headers = const {}}) {
    final url = Uri.http(baseUrl, '$prefix$path');
    return client.patch(url, body: body, headers: _mapHeaders(headers));
  }

  Future put(path, { Object? body, Map<String, String> headers = const {}}) {
    final url = Uri.http(baseUrl, '$prefix$path');
    return client.patch(url, body: body, headers: _mapHeaders(headers));
  }

  Future delete(path, { Object? body, Map<String, String> headers = const {}}) {
    final url = Uri.http(baseUrl, '$prefix$path');
    return client.delete(url, body: body, headers: _mapHeaders(headers));
  }

  _mapHeaders(Map<String, String> headers) {
    return {
      ...headers,
      'Authorization': 'bearer ${token != null ? token : "$key:$secret"}',
      'Content-Type': 'application/json'
    };
  }

  _requestWrapper(Future<http.Response> request){
    return request.then((res) {
      if (res.statusCode == 200) {
        return Future.value(jsonDecode(res.body));
      }
      throw Exception({
        'response': jsonDecode(res.body),
        'message': 'There was an error please contact support'
      });
    });
  }
}
