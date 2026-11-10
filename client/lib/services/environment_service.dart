import 'package:flutter/foundation.dart';

class EnvironmentService {
  static const String _apiEndpointKey = 'API_ENDPOINT';
  static String? _apiEndpoint;

  static Future<void> init() async {
    try {
      _apiEndpoint = const String.fromEnvironment(_apiEndpointKey);
      if (_apiEndpoint == null || _apiEndpoint!.isEmpty) {
        throw Exception('API_ENDPOINT no está definido en las variables de entorno');
      }
      debugPrint('API Endpoint: $_apiEndpoint');
    } catch (e) {
      debugPrint('Error inicializando EnvironmentService: $e');
      rethrow;
    }
  }

  static String get apiEndpoint {
    if (_apiEndpoint == null) {
      throw Exception('EnvironmentService no inicializado. Llama a init() primero.');
    }
    return _apiEndpoint!;
  }
}