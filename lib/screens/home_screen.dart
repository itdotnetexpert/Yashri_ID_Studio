import 'package:flutter/material.dart';
import 'form_screen.dart';
import 'entries_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yashri ID Studio'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              context,
              title: 'Create New ID',
              icon: Icons.badge,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FormScreen()),
              ),
            ),
            SizedBox(height: 20),
            _buildButton(
              context,
              title: 'Saved Entries',
              icon: Icons.folder_open,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => EntriesListScreen()),
              ),
            ),
            SizedBox(height: 20),
            _buildButton(
              context,
              title: 'Settings',
              icon: Icons.settings,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Settings screen coming soon!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
        textStyle: TextStyle(fontSize: 18),
      ),
      icon: Icon(icon, size: 28),
      label: Text(title),
      onPressed: onTap,
    );
  }
}