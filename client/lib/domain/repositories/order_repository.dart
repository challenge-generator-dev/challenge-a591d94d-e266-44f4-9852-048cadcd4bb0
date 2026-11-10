import 'package:order_app/domain/models/order_model.dart';

abstract class OrderRepository {
  Future<List<OrderModel>> getOrders();
  Future<OrderModel> createOrder(OrderModel order);
}