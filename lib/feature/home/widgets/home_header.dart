import 'package:flutter/material.dart';
import 'package:taskati/core/colors.dart';
import 'package:taskati/core/style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello , Sayed', style: getHeadlineStyle()),
          Text(
            'Have A Nice Day',
            style: getsmallStyle(),
          )
        ],
      ),
      const Spacer(),
      CircleAvatar(
          radius: 26,
          backgroundColor: AppColors.primaryColor,
          child: const CircleAvatar(
            radius: 24,
          ))
    ]);
  }
}
