import 'dart:convert';

import 'package:employee_management_app/Screens/Leave%20Screen/Model/TeamLeadListModel.dart';
import 'package:employee_management_app/Utills/Global%20Functions/SnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../../Model/AttendanceHistoryModel.dart';
import '../../../Utills/Global Class/GlobalAPI.dart';
import '../Class/TeamLeads.dart';
import 'package:http/http.dart' as http;

class TeamLeadListProvider extends ChangeNotifier{
  List<TeamLeads> _teamLeadList = [];
  List<TeamLeads> get teamLeadList => _teamLeadList;



  Future<TeamLeadListModel> GetTeamLeadLsit(BuildContext context) async {
    String URL="${ApiDetail.BaseAPI}${ApiDetail.AtdHistory}${ApiDetail.TeamLeadList}";
    try{
      Response response = await http.get(Uri.parse(URL));

      var data = jsonDecode(response.body.toString());
      if(response.statusCode==200){
       // TeamLeads.TeamLeadlist=(data['teamHeads'] as List).map((element)=>J);
      }
      else{
        return TeamLeadListModel.fromJson(data);
      }
    }
    catch(e){
      print(e);
      showErrorSnackbar("There is an Error Occured during connection : ${e}", context);
    }


    return TeamLeadListModel();

  }

}

