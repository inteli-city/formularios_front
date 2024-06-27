import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/shared/helpers/network/model/http_client_response.dart';

void main() {
  group('HttpClientResponse', () {
    test('should create instance with given parameters', () {
      const response = HttpClientResponse(
        data: {'key': 'value'},
        statusCode: 200,
      );

      expect(response.data, {'key': 'value'});
      expect(response.statusCode, 200);
    });

    test('should handle different data types', () {
      const responseWithString = HttpClientResponse(
        data: 'response data',
        statusCode: 404,
      );

      const responseWithInt = HttpClientResponse(
        data: 12345,
        statusCode: 500,
      );

      expect(responseWithString.data, 'response data');
      expect(responseWithString.statusCode, 404);

      expect(responseWithInt.data, 12345);
      expect(responseWithInt.statusCode, 500);
    });
  });
}
