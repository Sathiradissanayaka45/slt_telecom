import 'package:dio/dio.dart';
import '../models/employee.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class ApiService {
  final Dio _dio = Dio();
  final logger = Logger();
  final String baseUrl = 'http://192.168.8.146/slt_telecom/index.php';


Future<List<Employee>> getAllEmployees() async {
  final response = await _dio.get(
    '$baseUrl?action=viewAll',
    options: Options(responseType: ResponseType.json),
  );

  // If the response is a JSON string, parse it as JSON
  final data = response.data is String ? jsonDecode(response.data) : response.data;
  return (data as List).map((json) => Employee.fromJson(json)).toList();
}


Future<void> createEmployee(Employee employee) async {
  try {
    await _dio.post(
      '$baseUrl?action=create',
      data: employee.toJson(),
      options: Options(headers: {"Content-Type": "application/json"}),
    );
    logger.i("Employee created successfully.");
  } catch (e) {
    logger.e("Error creating employee: ${e.toString()}"); // Log detailed error
  }
}


  Future<void> updateEmployee(Employee employee) async {
    await _dio.post('$baseUrl?action=update', data: employee.toJson()..['empid'] = employee.empid);
  }

  Future<void> deleteEmployee(int empid) async {
    await _dio.post('$baseUrl?action=delete', data: {'empid': empid});
  }
}
