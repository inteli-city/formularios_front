import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formularios_front/app/shared/helpers/services/dio/dio_http_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dio_http_service_test.mocks.dart';

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
      requestOptions: RequestOptions(path: 'https://example.com'),
      data: 'response data',
    );

    when(mockDio.get('https://example.com',
            queryParameters: anyNamed('queryParameters')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService.get('https://example.com');

    expect(result, response);
    verify(mockDio.get('https://example.com',
            queryParameters: anyNamed('queryParameters')))
        .called(1);
  });

  test('should perform POST request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://example.com'),
      data: 'response data',
    );

    when(mockDio.post('https://example.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService
        .post('https://example.com', data: {'key': 'value'});

    expect(result, response);
    verify(mockDio.post('https://example.com', data: {'key': 'value'}))
        .called(1);
  });

  test('should perform PUT request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://example.com'),
      data: 'response data',
    );

    when(mockDio.put('https://example.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result =
        await dioHttpService.put('https://example.com', data: {'key': 'value'});

    expect(result, response);
    verify(mockDio.put('https://example.com', data: {'key': 'value'}))
        .called(1);
  });

  test('should perform DELETE request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://example.com'),
      data: 'response data',
    );

    when(mockDio.delete('https://example.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService
        .delete('https://example.com', data: {'key': 'value'});

    expect(result, response);
    verify(mockDio.delete('https://example.com', data: {'key': 'value'}))
        .called(1);
  });

  test('should perform PATCH request', () async {
    final response = Response(
      requestOptions: RequestOptions(path: 'https://example.com'),
      data: 'response data',
    );

    when(mockDio.patch('https://example.com', data: anyNamed('data')))
        .thenAnswer((_) async => response);

    final result = await dioHttpService
        .patch('https://example.com', data: {'key': 'value'});

    expect(result, response);
    verify(mockDio.patch('https://example.com', data: {'key': 'value'}))
        .called(1);
  });
}
