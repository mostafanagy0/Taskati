// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:taskati/core/colors.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/style.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });
  final Task task;
  Color getColor(int index) {
    switch (index) {
      case 0:
        return AppColors.primaryColor;
      case 1:
        return AppColors.orangeColor;
      case 2:
        return AppColors.redColor;
      case 3:
        return Colors.green;
      default:
        return AppColors.primaryColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: getColor(task.color)),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: getTitleStyle(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.watch_later),
                Text('${task.startTime} : ${task.endTime}')
              ],
            ),
            const SizedBox(height: 10),
            Text(task.note),
          ],
        ),
        const Spacer(),
        Container(width: 1, height: 80, color: Colors.white),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            task.isComplete ? 'Completed' : 'TODO',
            style: getsmallStyle(color: AppColors.lightBG),
          ),
        )
      ]),
    );
  }
}
