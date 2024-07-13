import 'json_http_client.dart';
import 'response.dart';

extension Endpoints on Never {
  static const String config = 'conf/un1v3rs4lk3y';
}

class ApiClient {
  final JsonHttpClient _httpClient;

  ApiClient(this._httpClient);

  Future<ConfigResponse> config() async {
    return _httpClient.get(
      Endpoints.config,
      mapper: (dynamic data) => ConfigResponse.fromJson(data as Map<String, dynamic>),
    );
  }
}
