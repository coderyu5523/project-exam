import 'package:flutter/material.dart';
import 'package:project_account/ui/_common/under_line_widget.dart';

class RecordDetail extends StatelessWidget {
  const RecordDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[];
      },
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
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
                            "06일",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("0원",
                            style: TextStyle(color: Colors.blue)),
                          Text(
                            "0원",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    UnderLineWidget(),
                    ..._buildRows(),
                    SizedBox(
                      height: 8,
                      child: Container(
                        color: Colors.grey[200],
                      ),
                    ),

                  ],
                ),
              ),
              // 회색의 작은 틈 추가

            ],
          );
        },
      ),
    );
  }

  // 테스트용
  List<Widget> _buildRows() {
    List<Map<String, String>> items = [
      {"category": "패션/미용", "description": "바지 삼", "amount": "10000원"},
      {"category": "식비", "description": "점심 식사", "amount": "5000원"},
      // 더 많은 항목 추가 가능
    ];

    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item["category"]!),
            Text(item["description"]!),
            Text(
              item["amount"]!,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      );
    }).toList();
  }
}
