import 'package:flutter/material.dart';
import 'package:project_account/ui/pages/record_page/components/record_category.dart';
import 'package:project_account/ui/pages/record_page/components/time_picker_example.dart';


class RecordWritePage extends StatelessWidget {
  const RecordWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          RecordTypeSection(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFC7C9A),
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text("기록", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.settings, color: Colors.white),
        )
      ],
    );
  }
}


