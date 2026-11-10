import 'package:http/http.dart' as http;
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/domain/models/order_model.dart';
import 'package:order_app/domain/repositories/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final ApiClient apiClient;

  OrderRepositoryImpl({required this.apiClient});

  @override
  Future<List<OrderModel>> getOrders() async {
    try {
      final orders = await apiClient.getOrders();
      return orders;
    } on http.ClientException catch (e) {
      throw OrderRepositoryException(
        'Error de conexión al obtener pedidos: ${e.message}',
        e,
      );
    } on FormatException catch (e) {
      throw OrderRepositoryException(
        'Error de formato al procesar respuesta: ${e.message}',
        e,
      );
    } catch (e) {
      throw OrderRepositoryException(
        'Error inesperado al obtener pedidos: $e',
        e,
      );
    }
  }

  @override
  Future<OrderModel> createOrder(OrderModel order) async {
    if (order.items.isEmpty) {
      throw OrderRepositoryException('El pedido debe contener al menos un artículo');
    }

    if (order.userId.isEmpty) {
      throw OrderRepositoryException('El ID de usuario es requerido');
    }

    try {
      final createdOrder = await apiClient.createOrder(order);
      return createdOrder;
    } on http.ClientException catch (e) {
      throw OrderRepositoryException(
        'Error de conexión al crear pedido: ${e.message}',
        e,
      );
    } on FormatException catch (e) {
      throw OrderRepositoryException(
        'Error de formato al procesar respuesta: ${e.message}',
        e,
      );
    } catch (e) {
      throw OrderRepositoryException(
        'Error inesperado al crear pedido: $e',
        e,
      );
    }
  }
}

class OrderRepositoryException implements Exception {
  final String message;
  final dynamic originalError;

  OrderRepositoryException(this.message, [this.originalError]);

  @override
  String toString() => 'OrderRepositoryException: $message';
}