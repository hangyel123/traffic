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
      debugShowCheckedModeBanner: false,
      title: 'YUB',
      home: SplashScreen(),
      routes: {
        '/main': (context) => MainPage(),
        '/alarm': (context) => AlarmScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );

    _controller!.forward();

    _navigateToMain();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  _navigateToMain() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/start_screen.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Y O B',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
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
    HomeScreen(),
    Center(child: Text('시내 셔틀 페이지')),
    Center(child: Text('시외 셔틀 페이지')),
    Center(child: Text('시내 버스 페이지')),
    Center(child: Text('마이 페이지')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'y o b',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarHeight: 100.0,
        titleSpacing: 40.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, '/alarm');
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: AnimatedSwitcher(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.green[300]),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        selectedLabelStyle: TextStyle(color: Colors.green),
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '사용자님\n안녕하세요',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          SizedBox(height: 20),
          Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    '예매 티켓권 사진',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              height: 400,
              child: Column(
                children: [
                  Center(
                    child: Text('data'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
