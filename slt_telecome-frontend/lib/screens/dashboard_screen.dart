import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/employee_provider.dart';
import '../shader_canvas.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeProvider = Provider.of<EmployeeProvider>(context);
    final totalEmployees = employeeProvider.employees.length;
    final departments = employeeProvider.employees.map((e) => e.department).toSet().length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        elevation: 0,
      ),
      body: Stack(
        children: [
          const Positioned.fill(
            child: ShaderCanvas(), // Using ShaderCanvas as the animated background
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dashboardHeader('Overview'),
                const SizedBox(height: 20),
                _statCard(
                  'Total Employees',
                  totalEmployees.toString(),
                  Icons.people,
                  Colors.tealAccent,
                ),
                const SizedBox(height: 20),
                _statCard(
                  'Total Departments',
                  departments.toString(),
                  Icons.apartment,
                  Colors.lightBlueAccent,
                ),
                const SizedBox(height: 20),
                _dashboardHeader('Recent Activities'),
                const SizedBox(height: 10),
                Expanded(child: _activityList()), // Expanded here to make it scrollable
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashboardHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.tealAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Card(
      color: Colors.white.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _activityList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4), // Semi-transparent background for better visibility
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 5, // Placeholder for recent activities
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white.withOpacity(0.1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: const Icon(Icons.check_circle, color: Colors.tealAccent),
              title: const Text(
                'Employee Updated',
                style: TextStyle(color: Colors.white70),
              ),
              subtitle: Text(
                'Updated at ${DateTime.now().toLocal()}',
                style: const TextStyle(color: Colors.white38),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
            ),
          );
        },
      ),
    );
  }
}
