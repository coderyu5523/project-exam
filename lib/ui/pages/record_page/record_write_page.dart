import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_account/ui/pages/record_page/viewmodel/select_date_viewmodel.dart';

import 'components/record_category.dart'; // 날짜 선택을 위한 프로바이더

class RecordWritePage extends ConsumerWidget {
  var _dateTime;
  TimeOfDay? _selectedTime; // 시간을 저장할 변수

  RecordWritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedTime = ref.watch(selectedTimeProvider);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          RecordTypeSection(),
          InkWell(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.black,
                          onPrimary: Colors.black,
                          onSurface: Colors.black,
                        ),
                        dialogBackgroundColor: Colors.black,
                      ),
                      child: child!,
                    );
                  });
              if (picked != null && picked != selectedDate) {
                ref.read(selectedDateProvider.notifier).state = picked;
                _dateTime = picked.toIso8601String();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate == null
                        ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                        : '${selectedDate!.toLocal()}'.split(' ')[0],
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  const Icon(Icons.calendar_today, color: Colors.black),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: selectedTime ?? TimeOfDay.now(),
              );
              if (picked != null && picked != selectedTime) {
                ref.read(selectedTimeProvider.notifier).state = picked;
                _selectedTime = picked;
                print("시간 확인 : ${_selectedTime?.format(context)}");
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedTime == null
                        ? TimeOfDay.now().format(context)
                        : '${selectedTime.format(context)}',
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  const Icon(Icons.access_time, color: Colors.black),
                ],
              ),
            ),
          ),
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
