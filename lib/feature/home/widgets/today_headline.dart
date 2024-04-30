import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/add_task/add_task_view.dart';

class TodayHeadLineWidget extends StatelessWidget {
  const TodayHeadLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat.MMMMEEEEd().format(DateTime.now()),
            style: getTitleStyle(color: Theme.of(context).primaryColor),
          ),
          Text(' ToDay',
              style: getTitleStyle(color: Theme.of(context).primaryColor)),
        ],
      ),
      const Spacer(),
      CustomButton(
        text: '+ Add Task',
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTaskView()));
        },
      )
    ]);
  }
}
