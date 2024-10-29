import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shader_canvas.dart';
import '../providers/employee_provider.dart';
import 'employee_form.dart';
import '../widgets/employee_card.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Employee Directory',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[900],
        elevation: 0,
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: ShaderCanvas()),
          Consumer<EmployeeProvider>(
            builder: (context, provider, _) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                itemCount: provider.employees.length,
                itemBuilder: (context, index) {
                  final employee = provider.employees[index];
                  return EmployeeCard(
                    key: ValueKey(employee.empid), // Ensure empid here is the correct type
                    employee: employee,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EmployeeFormScreen(employee: employee),
                        ),
                      );
                    },
                    onDelete: () => _confirmDelete(context, provider, employee.empid!),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, EmployeeProvider provider, int empId) { // Accepts int empId now
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this employee?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                provider.deleteEmployee(empId); // Using int empId directly
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Employee successfully deleted!'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
