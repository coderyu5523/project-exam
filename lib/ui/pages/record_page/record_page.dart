import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../_common/calender_widget.dart';


class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CalendarWidget(),
          Expanded(
            child: Center(
              child: Text('데이터가 없습니다.'),
            ),
          ),
        ],
      ),
    );
  }
}