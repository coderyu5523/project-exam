import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:project_account/ui/pages/record_page/viewmodel/select_date_viewmodel.dart';
import 'components/record_category.dart'; // 날짜 선택을 위한 프로바이더

final selectedTimeProvider = StateProvider<TimeOfDay?>((ref) => null);

class RecordWritePage extends ConsumerWidget {
  final _accountdController = TextEditingController();

  var _dateTime;
  TimeOfDay? _selectedTime; // 시간을 저장할 변수

  RecordWritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedTime = ref.watch(selectedTimeProvider);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              RecordTypeSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "날짜",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
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
                                    primary: Color(0xFFFC7C9A),
                                    onPrimary: Color(0xFFFC7C9A),
                                    onSurface: Colors.black,
                                  ),
                                  dialogBackgroundColor: Colors.black,
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (picked != null && picked != selectedDate) {
                            ref.read(selectedDateProvider.notifier).state = picked;
                            _dateTime = picked.toIso8601String();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedDate == null
                                    ? DateFormat('yyyy-MM-dd').format(DateTime.now())
                                    : DateFormat('yyyy-MM-dd').format(selectedDate),
                                style: const TextStyle(color: Colors.black54, fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              const Icon(Icons.calendar_today, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: InkWell(
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
                            border: Border(
                              bottom: BorderSide(color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedTime == null
                                    ? TimeOfDay.now().format(context)
                                    : '${selectedTime.format(context)}',
                                style: const TextStyle(color: Colors.black, fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              const Icon(Icons.access_time, color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "금액",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        controller: _accountdController,
                        decoration: InputDecoration(
                          hintText: '금액을 입력하세요',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "분류",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '분류를 입력하세요',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "자산",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '자산을 입력하세요',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "내용",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '내용을 입력하세요',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: SizedBox(
                  width: double.infinity,
                  // Set the button width to full width of the container
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    child: Text('저장하기',style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFC7C9A),
                      foregroundColor: Color(0xFFFC7C9A),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
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
