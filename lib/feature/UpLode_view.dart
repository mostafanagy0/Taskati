// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/colors.dart';
import 'package:taskati/core/storage/local_storage.dart';
import 'package:taskati/core/style.dart';
import 'package:taskati/feature/home/home_view.dart';

String? image_path;
String name = '';

class UpLoadView extends StatefulWidget {
  const UpLoadView({super.key});

  @override
  State<UpLoadView> createState() => _UpLoadViewState();
}

class _UpLoadViewState extends State<UpLoadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  if (image_path != null && name.isNotEmpty) {
                    AppLocal.cacheData(AppLocal.IsUpload, true);
                    AppLocal.cacheData(AppLocal.NameKey, name);

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ));
                  } else if (image_path == null && name.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.redColor,
                        content: const Text(
                            'Please Upload Your Image and Enter Your Name')));
                  } else if (image_path == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.redColor,
                        content: const Text('Please Upload Your Image')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: AppColors.redColor,
                        content: const Text('Please Enter your Name')));
                  }
                },
                child: Text(
                  'Done',
                  style: getSubStyle(color: AppColors.primaryColor),
                ))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primaryColor,
                foregroundImage: (image_path != null)
                    ? FileImage(File(image_path!)) as ImageProvider
                    : const AssetImage(
                        'assets/user.png',
                      ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  await getImagefromCamera();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor),
                  child: Text(
                    'Upload from Camera',
                    style: TextStyle(color: AppColors.lightBG),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await getImagefromGallery();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor),
                  child: Text(
                    'Upload from Gallery',
                    style: TextStyle(color: AppColors.lightBG),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  color: AppColors.primaryColor,
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                style: getTitleStyle(color: Theme.of(context).primaryColor),
                decoration: const InputDecoration(hintText: 'Enter Your Name'),
              )
            ],
          ),
        ));
  }

  getImagefromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.ImageKey, pickedImage.path);
      setState(() {
        image_path = pickedImage.path;
      });
    }
  }

  getImagefromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.ImageKey, pickedImage.path);

      setState(() {
        image_path = pickedImage.path;
      });
    }
  }
}
