import 'dart:convert';

import 'package:employee_management_app/Model/AttendanceHistory.dart';
import 'package:employee_management_app/Utills/Global%20Class/GlobalAPI.dart';
import 'package:employee_management_app/Utills/Global%20Functions/SnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../Model/AttendanceHistoryModel.dart';
import '../../../Utills/Global Class/userDataList.dart';

class HistoryProvider extends ChangeNotifier{
  List<Attendance> _attendanceList = [];
  List<Attendance> get attendanceList => _attendanceList;
  /*Future GetMonthData(String month, BuildContext context)async {

    String URL="${ApiDetail.BaseAPI}${ApiDetail.AtdHistory}augest";
    try{
      Response response=await http.get(Uri.parse(URL),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${UserDataList.token} "
          }
      );
      if(response.statusCode==200){
        final data=json.decode(response.body)as Map<String, dynamic>;
        List<Attendance> loadedAttendance=[];
        data['monthAttendance'].forEach((item){
          loadedAttendance.add(Attendance.fromJson(item));
        });
        _attendanceList=loadedAttendance;
        notifyListeners();
        //AtdHistoryClass.CheckIn=json['checkIn'];
        //AtdHistoryClass.CheckOut=json['checkOut'];
        //print(json);
        //print("CheckIn Data: "+_attendanceList[1].checkOutTime.toString());
      }
      else{
        showErrorSnackbar("There is Something Wrong Please Try Again", context);
      }
    }
    catch(e){
      showErrorSnackbar("There is Error Occured : ${e}", context);
      print(e);
        }
  }*/


Future<AttendanceHistoryModel> GetAttendanceData(String month,BuildContext context) async {
  String URL="${ApiDetail.BaseAPI}${ApiDetail.AtdHistory}${month}";
  try{
    Response response=await http.get(Uri.parse(URL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${UserDataList.token} "
        }
    );

    print(month);
    var data = jsonDecode(response.body.toString());
  if(response.statusCode==200){
    return AttendanceHistoryModel.fromJson(data);
  }
  else{
    return AttendanceHistoryModel.fromJson(data);
  }
  }catch(e){
    print(e);
    showErrorSnackbar("There is error Occured during connection : ${e}", context);
  }
  return AttendanceHistoryModel();
}
}