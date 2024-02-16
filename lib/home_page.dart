import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.breakfast_dining),
            title: const Text('朝食'),
            subtitle: const Text('あなたの朝食を記録しましょう'),
            trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                }),
          ),
          ListTile(
            leading: const Icon(Icons.lunch_dining),
            title: const Text('昼食'),
            subtitle: const Text('あなたの昼食を記録しましょう'),
            trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                }),
          ),
          ListTile(
            leading: const Icon(Icons.dinner_dining),
            title: const Text('夕食'),
            subtitle: const Text('あなたの夕食を記録しましょう'),
            trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                }),
          ),
          ListTile(
            leading: const Icon(Icons.cookie),
            title: const Text('間食'),
            subtitle: const Text('間食したものを記録しましょう'),
            trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                }),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('運動'),
            subtitle: const Text('運動活動を記録しましょう'),
            trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
