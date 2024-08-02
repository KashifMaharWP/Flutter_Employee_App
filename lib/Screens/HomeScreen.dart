import 'dart:developer';

import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:employee_management_app/Utills/Global%20Class/userDataList.dart';
import 'package:employee_management_app/Widgets/Local%20Widgets/HomeCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Provider/Attendance Provider/attendanceProvider.dart';
import '../Provider/Authentication Provider/authProvider.dart';
import '../Utills/Global Class/ScreenSize.dart';
import '../Widgets/Local Widgets/AttendanceCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:Colors.red.shade300,
        child: Center(
          child:Text("Home")
        )
      ),
    );
  }
}
