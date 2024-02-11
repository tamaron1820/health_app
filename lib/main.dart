import 'package:flutter/material.dart';
import 'package:health_application/home_page.dart';
import 'package:health_application/inshigts_page.dart';
import 'package:health_application/settings_page.dart'; // 必要に応じてインポート

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(), // MainPageをアプリのホームとして使用
    );
  }
}

// MainPage クラスの定義
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // ページウィジェットのリスト
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    InshigtsPage(), // InsightsPageウィジェット、必要に応じて他のページを追加
    SettingsPage(),
  ];

  final List<String> _pageTitle = [
    'Home',
    'Insights',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle[_selectedIndex]),
        backgroundColor: Colors.greenAccent[700],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // 選択されたページを表示
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.insights), label: 'Insights'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
