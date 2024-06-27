import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/shared/helpers/network/model/http_client_request_params.dart';
import 'package:formularios_front/app/shared/helpers/network/model/http_request_methods_enum.dart';

void main() {
  group('HttpClientRequestParams', () {
    test('should create instance with all parameters', () {
      final params = HttpClientRequestParams(
        endPoint: 'https://api.example.com',
        method: HttpRequestMethodsEnum.get,
        body: {'key': 'value'},
        headers: {'Authorization': 'Bearer token'},
        queryParams: {'search': 'query'},
        onReceiveProgress: (count, total) {},
        onSendProgress: (count, total) {},
      );

      expect(params.endPoint, 'https://api.example.com');
      expect(params.method, HttpRequestMethodsEnum.get);
      expect(params.body, {'key': 'value'});
      expect(params.headers, {'Authorization': 'Bearer token'});
      expect(params.queryParams, {'search': 'query'});
      expect(params.onReceiveProgress, isNotNull);
      expect(params.onSendProgress, isNotNull);
    });

    test('should create instance with only required parameters', () {
      const params = HttpClientRequestParams(
        endPoint: 'https://api.example.com',
        method: HttpRequestMethodsEnum.post,
      );

      expect(params.endPoint, 'https://api.example.com');
      expect(params.method, HttpRequestMethodsEnum.post);
      expect(params.body, isNull);
      expect(params.headers, isNull);
      expect(params.queryParams, isNull);
      expect(params.onReceiveProgress, isNull);
      expect(params.onSendProgress, isNull);
    });
  });
}
