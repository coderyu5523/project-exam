import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/calender_widget.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(CupertinoIcons.search, color: Colors.black),
        title: Text("가계부", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.settings, color: Colors.black),
          )
        ],
      ),
    );
  }
}
