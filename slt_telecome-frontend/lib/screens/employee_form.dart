import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/employee.dart';
import '../providers/employee_provider.dart';
import '../shader_canvas.dart';
import 'home_screen.dart';

class EmployeeFormScreen extends StatefulWidget {
  final Employee? employee;

  const EmployeeFormScreen({super.key, this.employee});

  @override
  EmployeeFormScreenState createState() => EmployeeFormScreenState();
}

class EmployeeFormScreenState extends State<EmployeeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String fullname, number, department, username;
  String? password; // Password is nullable to differentiate between new and update cases

  @override
  void initState() {
    super.initState();
    // Initialize fields with existing employee data if updating
    fullname = widget.employee?.fullname ?? '';
    number = widget.employee?.number ?? '';
    department = widget.employee?.department ?? '';
    username = widget.employee?.username ?? '';
    password = widget.employee?.password; // Fetch existing password for update, if available
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.employee == null ? 'Add Employee' : 'Edit Employee'),
        backgroundColor: Colors.indigo[900],
        elevation: 0,
      ),
      body: Stack(
        children: [
          const ShaderCanvas(),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.white.withOpacity(0.05),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField(
                          'Full Name',
                          fullname,
                          (value) => fullname = value!,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter the full name'
                              : null,
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          'Phone Number',
                          number,
                          (value) => number = value!,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the phone number';
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Phone number must contain only digits';
                            } else if (value.length < 10) {
                              return 'Phone number must be at least 10 digits';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          'Department',
                          department,
                          (value) => department = value!,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter the department'
                              : null,
                        ),
                        const SizedBox(height: 10),
                        _buildTextField(
                          'Username',
                          username,
                          (value) => username = value!,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter a username'
                              : null,
                        ),
                        // Show password field only if adding a new employee
                        if (widget.employee == null)
                          const SizedBox(height: 10),
                        if (widget.employee == null)
                          _buildTextField(
                            'Password',
                            '',
                            (value) => password = value!,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent[700],
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            widget.employee == null ? 'Add Employee' : 'Update Employee',
                            style: const TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              // If updating, keep the existing password unless a new one was provided
                              final employee = Employee(
                                empid: widget.employee?.empid,
                                fullname: fullname,
                                number: number,
                                department: department,
                                username: username,
                                password: password ?? widget.employee!.password, // Retain existing password if updating
                              );

                              final provider = Provider.of<EmployeeProvider>(context, listen: false);
                              if (widget.employee == null) {
                                provider.addEmployee(employee);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Employee successfully added!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } else {
                                provider.updateEmployee(employee);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Employee successfully updated!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(initialPageIndex: 0),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, Function(String?) onSaved,
      {bool obscureText = false, String? Function(String?)? validator}) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
