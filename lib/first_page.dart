import "package:flutter/material.dart";
import "package:health_application/second_page.dart";

class FirstPage extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  String nameText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('リスト'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            }));
  }
}
