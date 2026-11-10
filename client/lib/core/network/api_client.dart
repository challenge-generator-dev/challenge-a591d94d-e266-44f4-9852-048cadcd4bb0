import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/order_model.dart';

class ApiClient {
  final String baseUrl;
  final http.Client _client;

  ApiClient({required this.baseUrl, http.Client? client})
      : _client = client ?? http.Client();

  Future<List<OrderModel>> getOrders() async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body) as List<dynamic>;
        return data
            .map((jsonItem) => OrderModel.fromJson(jsonItem as Map<String, dynamic>))
            .toList();
      } else {
        throw ApiClientException('Failed to load orders: ${response.statusCode}');
      }
    } on ApiClientException {
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error fetching orders: $e');
      }
      rethrow;
    }
  }

  Future<OrderModel> createOrder(OrderModel order) async {
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl/orders'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(order.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return OrderModel.fromJson(json.decode(response.body) as Map<String, dynamic>);
      } else {
        throw ApiClientException('Failed to create order: ${response.statusCode}');
      }
    } on ApiClientException {
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error creating order: $e');
      }
      rethrow;
    }
  }

  void dispose() {
    _client.close();
  }
}

class ApiClientException implements Exception {
  final String message;
  ApiClientException(this.message);
  @override
  String toString() => 'ApiClientException: $message';
}