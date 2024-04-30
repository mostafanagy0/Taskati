// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/colors.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/style.dart';
import 'package:taskati/core/widgets/custom_button.dart';
import 'package:taskati/feature/home/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  var titleCon = TextEditingController();
  var notCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _date = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectedColor = 0;
  late Box<Task> box;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    box = Hive.box<Task>('task');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('Add Task'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------- Title -----------------
                Text('Title',
                    style:
                        getTitleStyle(color: Theme.of(context).primaryColor)),
                TextFormField(
                  controller: titleCon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Title mustn\'t empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter a Title here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                //------------------  Note  ---------------------------
                Text('Note',
                    style:
                        getTitleStyle(color: Theme.of(context).primaryColor)),
                TextFormField(
                  style: getSubStyle(color: Theme.of(context).primaryColor),
                  maxLines: 5,
                  controller: notCon,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Note mustn\'t empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter a Note here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                // ---------------------  Date  --------------------------
                Text('Date',
                    style:
                        getTitleStyle(color: Theme.of(context).primaryColor)),
                TextFormField(
                  style: getSubStyle(color: Theme.of(context).primaryColor),
                  readOnly: true,
                  decoration: InputDecoration(
                      hintStyle:
                          getSubStyle(color: Theme.of(context).primaryColor),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            await getDatePicker();
                          },
                          icon: Icon(
                            Icons.calendar_month,
                            color: AppColors.primaryColor,
                          )),
                      hintText: DateFormat.yMd().format(_date),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text('Start Time',
                            style: getTitleStyle(
                                color: Theme.of(context).primaryColor))),
                    Expanded(
                        child: Text('End time',
                            style: getTitleStyle(
                                color: Theme.of(context).primaryColor)))
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  //------------------- Star Time ----------------
                  children: [
                    Expanded(
                      child: TextFormField(
                        style:
                            getSubStyle(color: Theme.of(context).primaryColor),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: getSubStyle(
                              color: Theme.of(context).primaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                await ShowStartTimePicker();
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: AppColors.primaryColor,
                              )),
                          hintText: _startTime,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    //---------------------  End Time -------------------------
                    Expanded(
                      child: TextFormField(
                        style:
                            getSubStyle(color: Theme.of(context).primaryColor),
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: getSubStyle(
                              color: Theme.of(context).primaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                await ShowEndTimePicker();
                              },
                              icon: Icon(
                                Icons.watch_later_outlined,
                                color: AppColors.primaryColor,
                              )),
                          hintText: _endTime,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //--------------------- Colors ----------------------------
                Row(
                  children: [
                    ColorItem(0, AppColors.primaryColor),
                    const SizedBox(width: 5),
                    ColorItem(1, AppColors.orangeColor),
                    const SizedBox(width: 5),
                    ColorItem(2, AppColors.redColor),
                    const Spacer(),
                    //------------------------ Button ------------------------
                    CustomButton(
                        text: 'Creat Task',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await box.put(
                                '${titleCon.text}-${_date.toIso8601String()}',
                                Task(
                                    id: '${titleCon.text} ${_date.toIso8601String()}',
                                    title: titleCon.text,
                                    note: notCon.text,
                                    date: _date.toIso8601String(),
                                    startTime: _startTime,
                                    endTime: _endTime,
                                    color: _selectedColor,
                                    isComplete: false));

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomeView()));
                          }
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ColorItem(index, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = index;
        });
      },
      child: CircleAvatar(
          radius: 20,
          backgroundColor: color,
          child: (_selectedColor == index)
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null),
    );
  }

  getDatePicker() async {
    final DatePicked = await showDatePicker(
      currentDate: DateTime.now(),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
            data: ThemeData(
                colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onPrimary: Colors.white,
                    onSurface: AppColors.primaryColor),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.orangeColor))),
            child: child!);
      },
    );

    if (DatePicked != null) {
      setState(() {
        _date = DatePicked;
      });
    }
  }

  ShowStartTimePicker() async {
    final datePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
              data: ThemeData(
                  colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onPrimaryContainer: Colors.black,
                    onSurface: AppColors.primaryColor,
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor))),
              child: child!);
        });
    if (datePicked != null) {
      setState(() {
        _startTime = datePicked.format(context);
        int plus15min = datePicked.minute + 15;
        _endTime = datePicked.replacing(minute: plus15min).format(context);
      });
    }
  }

  ShowEndTimePicker() async {
    final datePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
              data: ThemeData(
                  colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                    onPrimaryContainer: Colors.black,
                    onSurface: AppColors.primaryColor,
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor))),
              child: child!);
        });
    if (datePicked != null) {
      setState(() {
        _endTime = datePicked.format(context);
      });
    }
  }
}
