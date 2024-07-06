import 'package:flutter/material.dart';

import '../../_common/under_line_widget.dart';
import 'components/total_account.dart';

class RecordDailyPage extends StatelessWidget {
  const RecordDailyPage({super.key});

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
