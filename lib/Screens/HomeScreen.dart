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
      body: SingleChildScrollView(
        child: Column(
          children: [
          Container(
            height: screenHeight/3,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(2, 6)
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeCard(
                          labelText: "Manage",
                          labelText2: "Attendnace",
                          fontPrimaryColor: lightBlackColor,
                          backgroundColor: Colors.amber,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight
                      ),
                      SizedBox(
                        width: screenWidth/20,
                      ),
                      HomeCard(
                          labelText: "Manage",
                          labelText2: "Leave",
                          fontPrimaryColor: lightBlackColor,
                          backgroundColor: Colors.lightGreenAccent,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight/28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeCard(
                          labelText: "Manage",
                          labelText2: "Task",
                          fontPrimaryColor: lightBlackColor,
                          backgroundColor: Colors.blue,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight
                      ),
                      SizedBox(
                        width: screenWidth/20,
                      ),
                      HomeCard(
                          labelText: "Manage",
                          labelText2: "Leave",
                          fontPrimaryColor: lightBlackColor,
                          backgroundColor: Colors.deepOrange,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
            SizedBox(
              height: screenHeight/25,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text("${DateFormat(' MMMM').format(DateTime.now())} Stats",style: GoogleFonts.roboto(
                        textStyle:TextStyle(
                          color: lightBlackColor,
                          fontWeight: FontWeight.bold,
                          fontSize:screenWidth/15,
                        )
                    ),),
                  ),
                  SizedBox(
                    height: screenHeight/25,
                  ),
                 /* Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SimpleCustomCard(
                          label: "Working Hrs",
                          progressValue: 2,
                          fontPrimaryColor: lightBlackColor,
                          fontSecondaryColor: whiteColor,
                          color: primary,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          totalhrs: '176',
                          slash: '/',
                      ),
                      SizedBox(
                        width: screenWidth/25,
                      ),
                      SimpleCustomCard(
                        label: "Average Hrs",
                        progressValue: 8,
                        fontPrimaryColor: lightBlackColor,
                        fontSecondaryColor: whiteColor,
                        color: primary,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        totalhrs: '',
                        slash: '',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight/30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SimpleCustomCard(
                        label: "Total Attendance",
                        progressValue: 14,
                        fontPrimaryColor: lightBlackColor,
                        fontSecondaryColor: whiteColor,
                        color: primary,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        totalhrs: '22',
                        slash: '/',
                      ),
                      SizedBox(
                        width: screenWidth/25,
                      ),
                      SimpleCustomCard(
                        label: "Leave Balance",
                        progressValue: 1,
                        fontPrimaryColor: lightBlackColor,
                        fontSecondaryColor: whiteColor,
                        color: primary,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        totalhrs: '1',
                        slash: '/',
                      ),
                    ],
                  ),*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
