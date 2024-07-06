import 'package:flutter/material.dart';

import '../../_common/under_line_widget.dart';
import 'components/total_account.dart';

class RecordCalenderPage extends StatelessWidget {
  const RecordCalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TotalAccount(),
        UnderLineWidget()
      ],
    );
  }
}
