import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String name;

  const DashboardScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome, $name',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
