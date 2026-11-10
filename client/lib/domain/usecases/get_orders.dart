import '../models/order_model.dart';
import '../repositories/order_repository.dart';

class GetOrders {
  final OrderRepository orderRepository;

  GetOrders({required this.orderRepository});

  Future<List<OrderModel>> call() async {
    try {
      final orders = await orderRepository.getOrders();
      if (orders.isEmpty) {
        throw Exception('No orders found');
      }
      return orders;
    } catch (e) {
      throw Exception('Failed to get orders: $e');
    }
  }
}