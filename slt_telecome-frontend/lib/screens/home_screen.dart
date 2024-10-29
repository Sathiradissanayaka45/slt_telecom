// home_screen.dart
import 'package:flutter/material.dart';
import 'employee_list.dart';
import 'employee_form.dart';
import 'dashboard_screen.dart';
import 'settings_screen.dart';
import '../shader_canvas.dart';

class HomeScreen extends StatefulWidget {
  final int initialPageIndex;

  const HomeScreen({super.key, this.initialPageIndex = 0});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialPageIndex;
  }

  final List<Widget> _pages = [
    const EmployeeListScreen(),
    const EmployeeFormScreen(),
    const DashboardScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const Positioned.fill(child: ShaderCanvas()),
          _pages[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        selectedItemColor: Colors.tealAccent,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1_outlined),
            label: 'Add Employee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
