import 'package:flutter/material.dart';

class MyPagecreen extends StatelessWidget {
  const MyPagecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로고'),
      ),
      body: Text('마이페이지'),
    );
  }
}
