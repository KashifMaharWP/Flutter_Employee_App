//import 'package:employee_management_app/Model/userModel.dart';
import 'package:employee_management_app/Screens/Attendance%20History%20Screen/AtdHistoryScreen.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Screen/Attedance_screen.dart';
import 'package:employee_management_app/Screens/HomeScreen.dart';
import 'package:employee_management_app/Screens/LeaveHistory/LeaveHistoryScreen.dart';
import 'package:employee_management_app/Screens/ProfileScreen.dart';
import 'package:employee_management_app/Screens/Leave%20Screen/LeaveScreen.dart';
import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utills/Global Class/userDataList.dart';


class homePage extends StatefulWidget {

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int currentIndex=0;
  String _locationMessage = "";

  List<IconData> navigationIcons=[
    FontAwesomeIcons.house,
    FontAwesomeIcons.circleCheck,
    FontAwesomeIcons.calendarDays,
    FontAwesomeIcons.calendarCheck,
    FontAwesomeIcons.calendarXmark
  ];
  String url=UserDataList.userprofilePicture;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primary,
              blurRadius: 12,
              offset: Offset(4, 2)
            )
          ]
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(int i = 0; i < navigationIcons.length; i++ )...<Expanded>{
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        currentIndex=i;
                      });;
                    },
                    child: Center(
                      child: Icon(navigationIcons[i],
                          color:i==currentIndex? primary:lightBlackColor,
                        size: i==currentIndex? 30:26,
                      ),
                    ),
                  )
              )
    
            }
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: primary,
            padding: EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfileScreen()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                     // backgroundImage: NetworkImage(url),
                    ),
                  ) ,
                  SizedBox(
                    width: 10,
                  ),
                  Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${UserDataList.username}",
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                      Text("${UserDataList.userdesignation}",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),)
                    ],
                  ),

                ],
              ),
            ),
          ),



          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                HomeScreen(),
                LeaveHistoryScreen(),
                AtdHistoryScreen(),
                AttendanceScreen(),
                LeaveScreen(),
              ],
            ),
          ),
        ],
      ),
    
    
    );
  }
}