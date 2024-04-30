import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/colors.dart';
import 'package:taskati/core/storage/local_storage.dart';
import 'package:taskati/core/style.dart';
import 'package:taskati/feature/profile/profile_view.dart';

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
          FutureBuilder(
            future: AppLocal.getData(AppLocal.NameKey),
            builder: (context, snapshot) {
              return Text('Hello , ${snapshot.data}',
                  style: getHeadlineStyle());
            },
          ),
          Text(
            'Have A Nice Day',
            style: getsmallStyle(),
          )
        ],
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProfileView()));
        },
        child: FutureBuilder(
          future: AppLocal.getData(AppLocal.ImageKey),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: FileImage(File(snapshot.data!)),
                  ));
            } else {
              return CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.greyColor,
                child: const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
              );
            }
          },
        ),
      )
    ]);
  }
}
