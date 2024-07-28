import 'package:flutter/material.dart';

class MyDataBase extends StatefulWidget {
  const MyDataBase({super.key});

  @override
  State<MyDataBase> createState() => _MyDataBaseState();
}

class _MyDataBaseState extends State<MyDataBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Database Management',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
    );
  }
}
