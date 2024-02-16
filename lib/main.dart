import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'home_page.dart';
import 'insights_page.dart';
import 'settings_page.dart';
import 'date_detail_page.dart';

void main() {
  initializeDateFormatting('ja_JP', null).then((_) {
    Intl.defaultLocale = 'ja_JP';
    runApp(const MyApp());
  });
}

final List<Widget> _widgetOptions = <Widget>[
  const HomePage(),
  const InsightsPage(),
  const SettingsPage(),
];

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
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  DateTime selectedDate = DateTime.now(); // 選択された日付を管理

  late int daysInMonth;

  @override
  void initState() {
    super.initState();
    updateDaysInMonth();
  }

  void updateDaysInMonth() {
    daysInMonth = DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeMonth(bool isNext) {
    setState(() {
      if (isNext) {
        // 次の月へ
        selectedDate = DateTime(
            selectedDate.year, selectedDate.month + 1, selectedDate.day);
      } else {
        // 前の月へ
        selectedDate = DateTime(
            selectedDate.year, selectedDate.month - 1, selectedDate.day);
      }
      updateDaysInMonth();
    });
  }

  Widget _buildBody() {
    if (_widgetOptions.isNotEmpty) {
      return Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      );
    } else {
      return const Center(
        child: Text('No pages available'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: SizedBox(
          height: kToolbarHeight + 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () => _changeMonth(false),
                    ),
                    Text(
                      DateFormat.yMMMM('ja_JP').format(selectedDate),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () => _changeMonth(true),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: daysInMonth,
                  itemBuilder: (context, index) {
                    DateTime date = DateTime(
                        selectedDate.year, selectedDate.month, index + 1);
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DateDetailPage(selectedDate: date),
                          ),
                        );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[350],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.insights), label: 'Insights'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
