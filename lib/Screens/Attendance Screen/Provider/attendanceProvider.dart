import 'dart:convert';
import 'dart:ffi';

import 'package:employee_management_app/Screens/Attendance%20Screen/Class/CheckInClass.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Functions/AttendanceSharedPrefrences.dart';
import 'package:employee_management_app/Utills/Global%20Class/userDataList.dart';
import 'package:employee_management_app/Utills/Global%20Functions/SnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../../Utills/Global Class/GlobalAPI.dart';
import 'package:http/http.dart' as http;

class AttendanceProvider extends ChangeNotifier{
  bool _ischeckedIn=false;
  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  bool get ischeckedIn=>_ischeckedIn;

  setischeckedIn(bool value){
    _ischeckedIn=value;
    notifyListeners();
  }

  setisLoading(bool value){
    _isLoading=value;
    notifyListeners();
  }

  Future<void> AddCheckIn(double latitude,longitude,BuildContext context) async {
    String url = "${ApiDetail.BaseAPI}${ApiDetail.CheckIn}";
    final body = {
      "checkIn": {
        "latitude":latitude,
        "longituder":longitude
      }
    };

    try {
      setisLoading(true);
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
          showSuccessSnackbar("Check In Successfully", context);
          print("CheckIn Successfully");
          print("Response body: ${response.body}");
          AttendanceSharedPrefrences.Set_checkInSharePreference();
          setischeckedIn(true);
          setisLoading(false);
        }
        else{
          print("Server is Not Responding");
          showErrorSnackbar("Server is Not Responding", context);
          setischeckedIn(false);
          setisLoading(false);
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        showErrorSnackbar("Server is Not Responding", context);
        setischeckedIn(false);
        setisLoading(false);
      }
    } catch (e) {
      print("Exception: $e");
      setischeckedIn(false);
      setisLoading(false);
    }


  }

  Future<void> AddCheckOut(double latitude,longitude, BuildContext context) async {
    String url = "${ApiDetail.BaseAPI}${ApiDetail.CheckOut}";
    final body = {
      "checkOut": {
        "latitude":latitude,
        "longituder":longitude
      }
    };

    try {
      setisLoading(true);
      final response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${UserDataList.token} "
          },
          body: jsonEncode(body)
      );

      if (response.statusCode == 200) {
        showSuccessSnackbar("Check Out Successfully", context);
        print("CheckOut Successfully");
        print("Response body: ${response.body}");
        setischeckedIn(false);
        AttendanceSharedPrefrences.Set_checkOutSharePreference();
        setisLoading(false);
      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
        showErrorSnackbar("Server Respond Error", context);
        setischeckedIn(true);
        setisLoading(false);
      }
    } catch (e) {
      print("Exception: $e");
      showErrorSnackbar("Server Respond Error", context);
      setischeckedIn(true);
      setisLoading(false);
    }
  }


  Future <void> CheckMidNight()async {
    String currentDate=DateFormat("dd MM yyyy").format(DateTime.now());
    AttendanceSharedPrefrences.Get_checkInSharePreference();
    if(CheckInClass.checkInDate != currentDate){
      CheckInClass.checkInTime='--|--';
      CheckInClass.checkOutTime='--|--';
    }
  }

}

