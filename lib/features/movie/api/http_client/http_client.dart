import 'package:http/http.dart' as http;
abstract class HttpClient {
  Future<http.Response> get(Uri url);
}
class HttpClientImpl implements HttpClient{
  final http.Client httpClient;

  HttpClientImpl(this.httpClient);

  @override
  Future<http.Response> get(Uri url) {
    return httpClient.get(url);
  }
}