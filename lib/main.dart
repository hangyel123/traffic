import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YUB',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('로고 이미지'),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 1, // 열의 개수
        children: List.generate(3, (index) {
          return Center(
            child: Container(
              width: 100, // 박스의 너비
              height: 100, // 박스의 높이
              color: Colors.blue, // 박스의 색상
              child: Center(
                child: Text('Box ${index + 1}'), // 박스 안에 표시될 텍스트
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.grey),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: '시내 셔틀',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: '시외 셔틀',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: '시내 버스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이 페이지',
          ),
        ],
      ),
    );
  }
}
