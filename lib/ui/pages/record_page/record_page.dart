import 'package:flutter/material.dart';
import 'package:project_account/ui/pages/record_page/record_chart_page.dart';
import 'package:project_account/ui/pages/record_page/record_daily_page.dart';
import 'package:project_account/ui/pages/record_page/record_memo_page.dart';

import '../../_common/calender_widget.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          CalendarWidget(),
          TabBar(
            tabs: const [
              Tab(text: "일일"),
              Tab(text: "통계"),
              Tab(text: "메모")
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                RecordDailyPage(),
                RecordChartPage(),
                RecordMemoPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
