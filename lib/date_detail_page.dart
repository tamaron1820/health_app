import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDetailPage extends StatelessWidget {
  final DateTime selectedDate;

  const DateDetailPage({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.yMMMMd('ja_JP').format(selectedDate)),
      ),
      body: Center(
        child:
            Text('選択された日: ${DateFormat.yMMMMd('ja_JP').format(selectedDate)}'),
      ),
    );
  }
}
