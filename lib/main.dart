import 'package:employee_management_app/Provider/Attendance%20Provider/attendanceProvider.dart';
import 'package:employee_management_app/Provider/Authentication%20Provider/authProvider.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Screen/Attedance_screen.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Functions/Location_Tracker.dart';
import 'package:employee_management_app/Screens/Home.dart';
import 'package:employee_management_app/Screens/HomeScreen.dart';
import 'package:employee_management_app/Screens/SignIn-UpScreen.dart';
import 'package:employee_management_app/Utills/Global%20Class/myRoutes.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Widgets/AttendanceShimmerScreen.dart';
import 'package:employee_management_app/Utills/Global%20Functions/MidNightTimer.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'Utills/Global Class/ScreenSize.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.of(context).size.width;
    screenHeight=MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AuthProvider(),),
        ChangeNotifierProvider(create: (context)=>AttendanceProvider(),),
      ],

      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          "/":(context)=>SignInUp(),
          myRoutes.homeroute:(context)=>HomeScreen(),
          myRoutes.attendance:(context)=>AttendanceScreen(),

        },
        localizationsDelegates: [
          //MonthYearPickerLocalizations.delegate,
        ],


      ),
    );
  }
}

