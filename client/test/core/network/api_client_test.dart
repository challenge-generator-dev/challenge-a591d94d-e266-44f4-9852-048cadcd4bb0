import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/domain/models/order_model.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ApiClient apiClient;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    apiClient = ApiClient(baseUrl: 'http://test.api.com', client: mockHttpClient);
  });

  group('ApiClient getOrders', () {
    test('debe retornar lista de OrderModel cuando la respuesta es exitosa', () async {
      final responseJson = [
        {
          'id': 'order-1',
          'userId': 'user-123',
          'items': [
            {
              'productId': 'prod-1',
              'productName': 'Test Product',
              'quantity': 2,
              'price': 29.99
            }
          ],
          'total': 59.98,
          'status': 'pending',
          'createdAt': '2024-01-15T10:30:00.000Z'
        }
      ];

      when(mockHttpClient.get(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(jsonEncode(responseJson), 200));

      final result = await apiClient.getOrders();

      expect(result, isA<List<OrderModel>>());
      expect(result.length, 1);
      expect(result.first.id, 'order-1');
      expect(result.first.userId, 'user-123');
      expect(result.first.items.first.productName, 'Test Product');
      expect(result.first.status, 'pending');
    });

    test('debe lanzar excepción cuando la respuesta tiene código de error', () async {
      when(mockHttpClient.get(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response('Internal Server Error', 500));

      expect(
        () => apiClient.getOrders(),
        throwsA(isA<ApiClientException>()),
      );
    });

    test('debe lanzar excepción cuando hay error de red', () async {
      when(mockHttpClient.get(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
      )).thenThrow(http.ClientException('Network error'));

      expect(
        () => apiClient.getOrders(),
        throwsA(isA<http.ClientException>()),
      );
    });
  });

  group('ApiClient createOrder', () {
    test('debe retornar OrderModel creado cuando la respuesta es exitosa', () async {
      final requestJson = {
        'id': 'order-new',
        'userId': 'user-456',
        'items': [
          {
            'productId': 'prod-2',
            'productName': 'New Product',
            'quantity': 1,
            'price': 49.99
          }
        ],
        'total': 49.99,
        'status': 'created',
        'createdAt': '2024-01-15T12:00:00.000Z'
      };

      when(mockHttpClient.post(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(jsonEncode(requestJson), 201));

      final order = OrderModel(
        id: 'order-new',
        userId: 'user-456',
        items: [
          OrderItemModel(
            productId: 'prod-2',
            productName: 'New Product',
            quantity: 1,
            price: 49.99,
          )
        ],
        total: 49.99,
        status: 'created',
        createdAt: DateTime.parse('2024-01-15T12:00:00.000Z'),
      );

      final result = await apiClient.createOrder(order);

      expect(result, isA<OrderModel>());
      expect(result.id, 'order-new');
      expect(result.status, 'created');
    });

    test('debe lanzar excepción cuando la respuesta tiene código de error', () async {
      when(mockHttpClient.post(
        Uri.parse('http://test.api.com/orders'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Bad Request', 400));

      final order = OrderModel(
        id: 'order-invalid',
        userId: 'user-789',
        items: [],
        total: 0,
        status: 'invalid',
        createdAt: DateTime.now(),
      );

      expect(
        () => apiClient.createOrder(order),
        throwsA(isA<ApiClientException>()),
      );
    });
  });

  group('OrderModel serialization', () {
    test('fromJson debe parsear correctamente el JSON', () {
      final json = {
        'id': 'order-json-test',
        'userId': 'user-json',
        'items': [
          {
            'productId': 'prod-json',
            'productName': 'JSON Product',
            'quantity': 3,
            'price': 15.50
          }
        ],
        'total': 46.50,
        'status': 'processing',
        'createdAt': '2024-02-20T08:00:00.000Z'
      };

      final model = OrderModel.fromJson(json);

      expect(model.id, 'order-json-test');
      expect(model.userId, 'user-json');
      expect(model.items.length, 1);
      expect(model.items.first.productName, 'JSON Product');
      expect(model.total, 46.50);
      expect(model.status, 'processing');
    });

    test('toJson debe generar el JSON correcto', () {
      final model = OrderModel(
        id: 'order-tojson',
        userId: 'user-tojson',
        items: [
          OrderItemModel(
            productId: 'prod-tojson',
            productName: 'ToJSON Product',
            quantity: 5,
            price: 10.00,
          )
        ],
        total: 50.00,
        status: 'shipped',
        createdAt: DateTime.parse('2024-03-10T14:30:00.000Z'),
      );

      final json = model.toJson();

      expect(json['id'], 'order-tojson');
      expect(json['userId'], 'user-tojson');
      expect(json['total'], 50.00);
      expect(json['status'], 'shipped');
      expect((json['items'] as List).length, 1);
    });
  });

  group('OrderItemModel serialization', () {
    test('fromJson debe parsear correctamente el JSON del item', () {
      final json = {
        'productId': 'prod-item',
        'productName': 'Item Product',
        'quantity': 2,
        'price': 25.00
      };

      final item = OrderItemModel.fromJson(json);

      expect(item.productId, 'prod-item');
      expect(item.productName, 'Item Product');
      expect(item.quantity, 2);
      expect(item.price, 25.00);
    });

    test('toJson debe generar el JSON correcto del item', () {
      final item = OrderItemModel(
        productId: 'prod-item-tojson',
        productName: 'Item ToJSON',
        quantity: 4,
        price: 12.75,
      );

      final json = item.toJson();

      expect(json['productId'], 'prod-item-tojson');
      expect(json['productName'], 'Item ToJSON');
      expect(json['quantity'], 4);
      expect(json['price'], 12.75);
    });
  });
}