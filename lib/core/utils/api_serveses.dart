import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://192.168.137.173:10349/api/Auth/";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    required dynamic body,
    String? token,
  }) async {
    print("📤 Sending POST request to: $_baseUrl$endPoint");
    print("📦 Body: $body");

    final headers = <String, dynamic>{
      'Accept': 'application/json',
      // مهم: لا ترسلي application/json
      // Dio يضبط multipart تلقائياً مع FormData
    };
    final formData = FormData.fromMap(body);
    try {
      final response = await _dio.post(
        '$_baseUrl$endPoint',
        data: formData,
        options: Options(headers: headers),
      );

      print("✅ Response Status: ${response.statusCode}");
      print("📥 Response Data: ${response.data}");

      return response.data;
    } on DioException catch (e) {
      print("❌ API Error: $e");
      rethrow; // 👈 مهم جدًا عشان يروح للريبو
    }
  }
}
