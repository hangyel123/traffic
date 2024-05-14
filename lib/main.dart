import 'package:flutter/material.dart';
import './screens/Bus.dart';
import './screens/Downtown.dart';
import './screens/MyPage.dart';
import './screens/Out_Of_Town.dart';
import './screens/alarm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YUB',
      home: MainPage(),
      routes: {
        '/alarm': (context) => AlarmScreen(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text('홈 페이지')),
    Center(child: Text('시내 셔틀 페이지')),
    Center(child: Text('시외 셔틀 페이지')),
    Center(child: Text('시내 버스 페이지')),
    Center(child: Text('마이 페이지')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로고 이미지'),
        backgroundColor: Colors.white10,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/alarm');
            },
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
        transitionBuilder: (child, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.green[300]),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.green[300]),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
