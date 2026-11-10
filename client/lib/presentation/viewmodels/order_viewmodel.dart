import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/data/repositories/order_repository_impl.dart';
import 'package:order_app/domain/models/order_model.dart';
import 'package:order_app/domain/repositories/order_repository.dart';
import 'package:order_app/domain/usecases/get_orders.dart';

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final httpClient = http.Client();
  const baseUrl = String.fromEnvironment('API_ENDPOINT', defaultValue: 'localhost:8080');
  final apiClient = ApiClient(baseUrl: baseUrl, client: httpClient);
  return OrderRepositoryImpl(apiClient: apiClient);
});

final orderViewModelProvider = ChangeNotifierProvider<OrderViewModel>((ref) {
  final orderRepository = ref.read(orderRepositoryProvider);
  final getOrdersUseCase = GetOrders(orderRepository: orderRepository);
  return OrderViewModel(
    getOrders: getOrdersUseCase,
    orderRepository: orderRepository,
  );
});

class OrderViewModel extends ChangeNotifier {
  final GetOrders _getOrders;
  final OrderRepository _orderRepository;
  AsyncValue<List<OrderModel>> _orders = const AsyncValue.loading();

  OrderViewModel({
    required GetOrders getOrders,
    required OrderRepository orderRepository,
  })  : _getOrders = getOrders,
        _orderRepository = orderRepository {
    _loadOrders();
  }

  AsyncValue<List<OrderModel>> get orders => _orders;

  Future<void> _loadOrders() async {
    try {
      _orders = const AsyncValue.loading();
      notifyListeners();
      final orders = await _getOrders();
      _orders = AsyncValue.data(orders);
    } catch (e, st) {
      _orders = AsyncValue.error(e, st);
    } finally {
      notifyListeners();
    }
  }

  Future<void> createOrder(OrderModel order) async {
    try {
      await _orderRepository.createOrder(order);
      await _loadOrders();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> refresh() async {
    await _loadOrders();
  }
}