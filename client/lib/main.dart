import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:order_app/core/network/api_client.dart';
import 'package:order_app/data/repositories/order_repository_impl.dart';
import 'package:order_app/domain/repositories/order_repository.dart';
import 'package:order_app/domain/usecases/get_orders.dart';
import 'package:order_app/presentation/screens/order_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvironmentService.init();
  runApp(const ProviderScope(child: OrderApp()));
}

class OrderApp extends StatelessWidget {
  const OrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const OrderListScreen(),
    );
  }
}

final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final client = ref.watch(httpClientProvider);
  final baseUrl = EnvironmentService.apiEndpoint ?? 'http://localhost:8080';
  return ApiClient(baseUrl: baseUrl, client: client);
});

final orderRepositoryProvider = Provider<OrderRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return OrderRepositoryImpl(apiClient: apiClient);
});

final getOrdersProvider = Provider<GetOrders>((ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return GetOrders(orderRepository: repository);
});

class EnvironmentService {
  static const String _apiEndpointKey = 'API_ENDPOINT';
  static String? _apiEndpoint;

  static String? get apiEndpoint => _apiEndpoint;

  static Future<void> init() async {
    _apiEndpoint = const String.fromEnvironment(_apiEndpointKey, defaultValue: 'http://localhost:8080');
  }
}