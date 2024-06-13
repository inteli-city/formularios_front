
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/shared/helpers/services/dio/dio_http_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_auth_interceptor_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late DioHttpService dioHttpService;

  setUp(() {
    mockDio = MockDio();
    dioHttpService = DioHttpService(dio: mockDio);
  });

  test('should perform GET request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://api.exemplo.com'),
      data: 'response data',
    );

    when(mockDio.get('https://api.exemplo.com',
            queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService.get('https://api.exemplo.com');

    expect(result, response);
  });

  test('should perform POST request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://api.exemplo.com'),
      data: 'response data',
    );

    when(mockDio.post('https://api.exemplo.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService
        .post('https://api.exemplo.com', data: {'key': 'value'});

    expect(result, response);
  });

  test('should perform PUT request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://api.exemplo.com'),
      data: 'response data',
    );

    when(mockDio.put('https://api.exemplo.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService
        .put('https://api.exemplo.com', data: {'key': 'value'});

    expect(result, response);
  });

  test('should perform DELETE request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://api.exemplo.com'),
      data: 'response data',
    );

    when(mockDio.delete('https://api.exemplo.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService
        .delete('https://api.exemplo.com', data: {'key': 'value'});

    expect(result, response);
  });

  test('should perform PATCH request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://api.exemplo.com'),
      data: 'response data',
    );

    when(mockDio.patch('https://api.exemplo.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService
        .patch('https://api.exemplo.com', data: {'key': 'value'});

    expect(result, response);
  });
}
