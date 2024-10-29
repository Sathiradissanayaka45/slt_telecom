import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../services/api_service.dart';
import 'package:logger/logger.dart';


class EmployeeProvider with ChangeNotifier {
  List<Employee> _employees = [];
  final Logger logger = Logger();
  final ApiService _apiService = ApiService();

  List<Employee> get employees => _employees;

  Future<void> fetchEmployees() async {
    _employees = await _apiService.getAllEmployees();
    notifyListeners();
  }

  Future<void> addEmployee(Employee employee) async {
    try {
      await _apiService.createEmployee(employee);
      await fetchEmployees();
      logger.i("Employee added."); // info level logging
    } catch (e) {
      logger.e("Error adding employee: $e"); // error level logging
    }
  }


  Future<void> updateEmployee(Employee employee) async {
    await _apiService.updateEmployee(employee);
    await fetchEmployees();
  }

  Future<void> deleteEmployee(int empid) async {
    await _apiService.deleteEmployee(empid);
    await fetchEmployees();
  }
}
