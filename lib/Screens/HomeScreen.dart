import 'dart:developer';

import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:employee_management_app/Utills/Global%20Class/userDataList.dart';
import 'package:employee_management_app/Widgets/Local%20Widgets/HomeCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'Attendance History/Screen/CustomMonthPicker.dart';
import 'Attendance Screen/Provider/attendanceProvider.dart';
import '../Provider/Authentication Provider/authProvider.dart';
import '../Utills/Global Class/ScreenSize.dart';
import '../Widgets/Local Widgets/AttendanceCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  DateTime? selectedMonth;

  void _showMonthPicker() async {
    final customMonthPicker = CustomMonthPicker(
      initialSelectedMonth: DateTime.now(),
      firstEnabledMonth: DateTime(2020, 1),
      lastEnabledMonth: DateTime(2030, 12),
      firstYear: 2020,
      lastYear: 2030,
      selectButtonText: 'Select',
      cancelButtonText: 'Cancel',
      highlightColor: Colors.blue,
      textColor: Colors.white,
      contentBackgroundColor: Colors.blueAccent,
      dialogBackgroundColor: Colors.white,
      selectButtonTextStyle: TextStyle(color: Colors.white),
      cancelButtonTextStyle: TextStyle(color: Colors.red),
    );

    final DateTime? picked = await customMonthPicker.show(context);

    if (picked != null && picked != selectedMonth) {
      setState(() {
        selectedMonth = picked;
      });
      print('Selected month: ${picked.month}, year: ${picked.year}');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.red.shade300,
        child: Center(
        child: ElevatedButton(
        onPressed: _showMonthPicker,
        child: Text('Select Month'),
    ),
      ),
    ));
  }
}
