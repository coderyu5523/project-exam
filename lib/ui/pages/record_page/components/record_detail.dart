import 'package:flutter/material.dart';
import 'package:project_account/ui/_common/under_line_widget.dart';
import 'package:project_account/ui/pages/record_page/components/record_list.dart';
import '../../../../data/record/dummy.dart';

class RecordDetail extends StatelessWidget {
  const RecordDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 원형 버튼
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xFFFF6254),
        shape: CircleBorder(),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: ListView.builder(
          itemCount: recordList.length,
          itemBuilder: (BuildContext context, int index) {
            final record = recordList[index];
            return Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${record['date']}일",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("${record['income']}원", style: TextStyle(color: Colors.blue)),
                            Text(
                              "${record['outgo']}원",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      UnderLineWidget(),
                      RecordList(items: record['records']),
                      SizedBox(
                        height: 8,
                        child: Container(
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
