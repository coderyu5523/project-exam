import 'package:flutter/material.dart';
import 'package:project_account/ui/pages/record_page/components/record_category_button.dart';

class RecordTypeSection extends StatelessWidget {
  const RecordTypeSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RecordTypeButton(
          text: "수입",
          onTap: () {
          },
        ),
        RecordTypeButton(
          text: "지출",
          onTap: () {
          },
        ),
      ],
    );
  }
}
