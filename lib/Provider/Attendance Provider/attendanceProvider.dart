import 'dart:convert';
import 'dart:ffi';

import 'package:employee_management_app/Screens/Attendance%20Screen/Class/CheckInClass.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Functions/AttendanceSharedPrefrences.dart';
import 'package:employee_management_app/Utills/Global%20Class/userDataList.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../Utills/Global Class/GlobalAPI.dart';
import 'package:http/http.dart' as http;

class AttendanceProvider extends ChangeNotifier{
  bool _ischeckedIn=false;
  bool get ischeckedIn=>_ischeckedIn;

  setischeckedIn(bool value){
    _ischeckedIn=value;
    notifyListeners();
  }

  Future<void> AddCheckIn(double latitude,longitude) async {
    String url = "https://backend-production-6e95.up.railway.app/api/attendance/checkIn";
    final body = {
      "checkIn": {
        "latitude":latitude,
        "longituder":longitude
      }
    };

    try {
      final response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${UserDataList.token} "
          },
          body: jsonEncode(body)
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String,dynamic>;
        if(json.isNotEmpty){
          //CheckInClass.checkInTime=DateTime.now().toString();

          print("CheckIn Successfully");
          print("Response body: ${response.body}");
          AttendanceSharedPrefrences.Set_checkInSharePreference();
          setischeckedIn(true);
        }
        else{
          print("Server is Not Responding");
          setischeckedIn(false);
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        setischeckedIn(false);
      }
    } catch (e) {
      print("Exception: $e");
      setischeckedIn(false);
    }


  }

  Future<void> AddCheckOut(double latitude,longitude) async {
    String url = "https://backend-production-6e95.up.railway.app/api/attendance/checkOut";
    final body = {
      "checkOut": {
        "latitude":latitude,
        "longituder":longitude
      }
    };

    try {
      final response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${UserDataList.token} "
          },
          body: jsonEncode(body)
      );

      if (response.statusCode == 200) {
        print("CheckOut Successfully");
        print("Response body: ${response.body}");
        setischeckedIn(false);

      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        setischeckedIn(true);
      }
    } catch (e) {
      print("Exception: $e");
      setischeckedIn(true);
    }
  }

}

Future<void>GetProfile()async{
  String url="https://backend-production-6e95.up.railway.app/api/user/myProfile";
  final response=await http.get(Uri.parse(url));
  if(response.statusCode==200)
  print(response.body);
  else
    print(response.body);
}