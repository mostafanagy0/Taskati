import 'package:flutter/material.dart';
import 'package:taskati/core/style.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/empty.png'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'You do not have any tasks yet!',
            style: getsmallStyle(),
          )
        ],
      ),
    );
  }
}
