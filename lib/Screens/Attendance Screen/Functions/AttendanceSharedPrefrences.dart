
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
    Get_checkInSharePreference();
    print("SharedPreference Data Inserted");
  }

  static Future <void> Set_checkOutSharePreference() async{
    String Time=DateFormat("hh:mm:a").format(DateTime.now());
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("CheckOutTime", Time);
    Get_checkOutSharePreference();
    print("Checkout Data SharedPreference Data Inserted");
  }

  static Future <void> Get_checkInSharePreference() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    CheckInClass.checkInDate = pref.getString("CheckInDate").toString();
    CheckInClass.checkInTime=pref.getString("CheckInTime").toString();
    CheckInClass.checkOutTime=pref.getString("CheckOutTime").toString();
    print("Data Getted from Shared Preferences");
    }

  static Future <void> Get_checkOutSharePreference() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    CheckInClass.checkOutTime=pref.getString("CheckOutTime").toString();
    print("Data Getted from Shared Preferences");
  }

}