import 'dart:convert';

import 'package:employee_management_app/Utills/Global%20Class/userDataList.dart';
import 'package:flutter/cupertino.dart';
import '../../Utills/Global Class/GlobalAPI.dart';
import 'package:http/http.dart' as http;

class AttendanceProvider extends ChangeNotifier{
  bool ischeckedIn=false;
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
        print("CheckIn Successfully");
        print("Response body: ${response.body}");
        ischeckedIn=true;
      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        ischeckedIn=false;
      }
    } catch (e) {
      print("Exception: $e");
      ischeckedIn=false;
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
        print("CheckIn Successfully");
        print("Response body: ${response.body}");
        final json = jsonDecode(response.body) as Map<String,dynamic>;
        ischeckedIn=true;

      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        ischeckedIn=false;
      }
    } catch (e) {
      print("Exception: $e");
      ischeckedIn=false;
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