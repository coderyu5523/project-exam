import 'package:flutter/material.dart';

class RecordTab extends StatelessWidget {
  final TabController tabController;

  const RecordTab({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: "일일",),
            Tab(text:"통계"),
            Tab(text:"메모")
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: 42,
                itemBuilder: (context, index) {
                  return Image.network("https://picsum.photos/id/${index + 1}/200/200");
                },
              ),
              Container(color: Colors.red),
            ],
          ),
        ),
      ],
    );
  }
}
