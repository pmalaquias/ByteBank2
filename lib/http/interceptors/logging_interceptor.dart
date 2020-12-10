import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('URL: ${data.url}');
    print('HEADRES: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('STATUS CODE: ${data.statusCode}');
    print('HEADRES: ${data.headers}');
    print('BODY: ${data.body}');
    return data;
  }
}
