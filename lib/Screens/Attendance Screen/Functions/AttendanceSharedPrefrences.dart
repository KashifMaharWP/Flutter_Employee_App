
import 'dart:ffi';

import 'package:employee_management_app/Screens/Attendance%20Screen/Class/CheckInClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceSharedPrefrences {
  late final CheckInDate;
  late final CheckInTime;
  static Future <void> Set_checkInSharePreference() async{
    String Datestamp = DateFormat("dd MM yyyy").format(DateTime.now());
    String Time=DateFormat("hh:mm:a").format(DateTime.now());
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("CheckInTime", Time);
    pref.setString("CheckInDate", Datestamp);
    print("SharedPreference Data Inserted");
    Get_checkInSharePreference();

  }

  static Future <void> Get_checkInSharePreference() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    //CheckInDate = pref.getString("CheckInDate").toString();
    //CheckInTime=pref.getString("CheckInTime").toString();

    print("Data Getted from Shared Preferences");
    print("Check Time : ${pref.getString("CheckInTime").toString()} ");
    print("Check Date : ${pref.getString("CheckInDate").toString()} ");
  }

}