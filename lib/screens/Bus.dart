import 'package:flutter/material.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로고'),
      ),
      body: Text('시외버스'),
    );
  }
}
