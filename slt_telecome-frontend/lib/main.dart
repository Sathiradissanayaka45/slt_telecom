// main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/employee_provider.dart';
import 'screens/landing_page.dart'; // Import the LandingPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EmployeeProvider()..fetchEmployees()),
      ],
      child: MaterialApp(
        title: 'Employee Management',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.grey),
          ),
        ),
        home: const LandingPage(), // Set LandingPage as the default screen
      ),
    );
  }
}
