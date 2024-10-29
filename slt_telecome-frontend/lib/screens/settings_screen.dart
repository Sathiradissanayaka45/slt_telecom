import 'package:flutter/material.dart';
import '../shader_canvas.dart'; // Import ShaderCanvas

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo[900]?.withOpacity(0.8),
      ),
      body: Stack(
        children: [
          const ShaderCanvas(), // ShaderCanvas as animated background
          ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              _settingsHeader('Account'),
              const SizedBox(height: 10),
              _settingsOption(
                icon: Icons.person_outline,
                title: 'Profile',
                subtitle: 'View and edit your profile',
                onTap: () {
                  // Handle Profile navigation
                },
              ),
              const SizedBox(height: 15),
              _settingsOption(
                icon: Icons.lock_outline,
                title: 'Change Password',
                subtitle: 'Update your password for security',
                onTap: () {
                  // Handle Change Password navigation
                },
              ),
              const SizedBox(height: 30),
              _settingsHeader('Preferences'),
              const SizedBox(height: 10),
              _settingsOption(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                subtitle: 'Manage notification settings',
                onTap: () {
                  // Handle Notifications settings
                },
              ),
              const SizedBox(height: 15),
              _settingsOption(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle: 'Toggle dark mode for the app',
                trailing: Switch(
                  value: true, // This should reflect current theme setting
                  onChanged: (bool value) {
                    // Handle theme toggle here
                  },
                  activeColor: Colors.tealAccent,
                ),
                onTap: () {
                  // Optional: add action if needed
                },
              ),
              const SizedBox(height: 30),
              _settingsHeader('General'),
              const SizedBox(height: 10),
              _settingsOption(
                icon: Icons.info_outline,
                title: 'About',
                subtitle: 'Learn more about the app',
                onTap: () {
                  // Handle About page navigation
                },
              ),
              const SizedBox(height: 15),
              _settingsOption(
                icon: Icons.logout,
                title: 'Logout',
                subtitle: 'Sign out of your account',
                onTap: () {
                  _confirmLogout(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _settingsHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.tealAccent,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _settingsOption({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.tealAccent),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        onTap: onTap,
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add logout functionality here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully logged out!'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
