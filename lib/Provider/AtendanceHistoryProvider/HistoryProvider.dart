import 'dart:convert';

import 'package:employee_management_app/Screens/Attendance%20History%20Screen/attendance_provider.dart';
import 'package:employee_management_app/Utills/Global%20Class/GlobalAPI.dart';
import 'package:employee_management_app/Utills/Global%20Functions/SnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../Utills/Global Class/userDataList.dart';

class HistoryProvider extends ChangeNotifier{
  Future GetMonthData(String month, BuildContext context)async {

    String URL="${ApiDetail.BaseAPI}${ApiDetail.AtdHistory}$month";
    try{
      Response response=await http.get(Uri.parse(URL),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${UserDataList.token} "
          }
      );
      if(response.statusCode==200){
        final json=jsonDecode(response.body);
        AtdHistoryClass.CheckIn=json['checkIn'];
        AtdHistoryClass.CheckOut=json['checkOut'];
        print(json);
        print("CheckIn Data: "+json['monthAttendance']['checkIn'].toString());
      }
      else{
        showErrorSnackbar("There is Something Wrong Please Try Again", context);
      }
    }
    catch(e){
      showErrorSnackbar("There is Error Occured : ${e}", context);
        }
  }
}