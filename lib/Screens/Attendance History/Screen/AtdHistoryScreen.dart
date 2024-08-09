import 'package:employee_management_app/Model/AttendanceHistoryModel.dart';
import 'package:employee_management_app/Screens/Attendance%20History/Attendance%20History%20Shimmer/AttendanceHistoryShimmerScreen.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Class/HistoryProvider.dart';
import 'package:employee_management_app/Screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Attendance Screen/Class/HistoryProvider.dart';
import '../../../Utills/Global Class/ColorHelper.dart';
import '../../../Utills/Global Class/ScreenSize.dart';
import 'CustomMonthPicker.dart';

class AtdHistoryScreen extends StatefulWidget {
  AtdHistoryScreen({super.key});

  @override
  State<AtdHistoryScreen> createState() => _AtdHistoryScreenState();
}
DateTime selectedMonth=DateTime.now();

class _AtdHistoryScreenState extends State<AtdHistoryScreen> {
  bool isCurrentMonth = true;
  int currentYear = DateTime.now().year.toInt();
  int month = 3, year = 2023;
  Future<AttendanceHistoryModel?>? _futureAttendance;

  DateTime _currentMonth = DateTime.now();
  String _currentMonthfilter='';




  String _getStatusText(String status) {
    switch (status) {
      case 'present':
        return 'P'; // Present
      case 'absent':
        return 'A'; // Absent
      case 'leave':
        return 'L'; // Closed or any other status
      default:
        return 'W'; // Unknown status
    }
  }

  Color _getBackgroundColor(String status) {
    switch (status) {
      case 'present':
        return Colors.blue; // Color for Present
      case 'absent':
        return Colors.red; // Color for Absent
      case 'leave':
        return Colors.orange; // Color for Closed or any other status
      default:
        return Colors.yellow; // Color for unknown status
    }
  }

  void _showMonthPicker(DateTime selectedMonth,currentYear,currentMonth) async {
    final customMonthPicker = CustomMonthPicker(
      initialSelectedMonth: selectedMonth, //DateTime.now(),
      firstEnabledMonth: DateTime(2020, 1),
      lastEnabledMonth:currentMonth,// DateTime(2030, 12),
      firstYear: DateTime.now().year,
      lastYear: currentYear,
      selectButtonText: 'Select',
      cancelButtonText: 'Cancel',
      highlightColor: primary,
      textColor: primary,
      contentBackgroundColor: whiteColor,
      dialogBackgroundColor: whiteColor,
      selectButtonTextStyle: GoogleFonts.roboto(
        textStyle: TextStyle(
          color: primary,
        )
      ),
      cancelButtonTextStyle: GoogleFonts.roboto(
          textStyle: TextStyle(
              color: primary
          )
      ),
    );

    final DateTime? picked = await customMonthPicker.show(context);

    if (picked != null && picked != selectedMonth) {
      setState(() {
        selectedMonth = picked;
        _currentMonthfilter=DateFormat("MMMM").format(selectedMonth);
        _currentMonth = DateTime(selectedMonth.year,selectedMonth.month);
        DateTime now = DateTime.now();
        if (selectedMonth.year == now.year && selectedMonth.month == now.month) {
          isCurrentMonth = true;
        } else {
          isCurrentMonth = false;
        }

      });
      print('Selected month: ${picked.month}, year: ${picked.year}');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAttendanceData();
  }

  void _fetchAttendanceData() {
    final futureAttendance = Provider.of<HistoryProvider>(context,listen: false);
      _currentMonthfilter= futureAttendance.currentMonthfilter;
        futureAttendance.GetAttendanceData(_currentMonthfilter, context);
  }



  @override
  Widget build(BuildContext context) {
    int currentYear=_currentMonth.year;
    final AtdHistProvider = Provider.of<HistoryProvider>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(screenWidth/20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Attendance",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                    color: lightBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth / 15,
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        onTap: () {
                          AtdHistProvider.PreviousMonth(context);
                        },
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: primary,
                          size: screenWidth / 15,
                        )),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Wrap(children: [
                      Consumer<HistoryProvider>(
                        builder: (context, AtdHistProvider, child) {
                          return Text(
                            DateFormat("MMMM").format(AtdHistProvider.currentMonth),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: lightBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth / 18,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      InkWell(
                          onTap: () async {
                            _showMonthPicker(
                                _currentMonth,
                                currentYear,
                                DateTime.now()
                            );
                            },
                          child: Icon(
                            FontAwesomeIcons.calendar,
                            color: primary,
                            size: screenWidth / 15,
                          )),
                    ]),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          //NextMonth(context);
                          AtdHistProvider.NextMonthFunction(context);
                          _fetchAttendanceData();
                          //AtdHistProvider.GetMonthData(_currentMonth.toString(), context);
                        },
                        child: AtdHistProvider.isCurrentMonth
                            ? Container()
                            : Icon(
                                FontAwesomeIcons.chevronRight,
                                color: primary,
                                size: screenWidth / 15,
                              )),
                  ),
                ],
              ),
              
              Consumer<HistoryProvider>(builder: (context,historyProvider,child){
                return Expanded(
                  child: FutureBuilder<AttendanceHistoryModel?>(
                    future: _futureAttendance,
                    builder: (context, dataSnapshot) {
                      if (dataSnapshot.connectionState == ConnectionState.waiting) {
                        return AttendanceHistoryShimmer();
                      } else if (dataSnapshot.error != null) {
                        return Center(child: Text('An error occurred!'));
                      }

                      else if(dataSnapshot.hasData) {
                        final attendanceDatasnap = dataSnapshot.data;
                        final monthAttendance = attendanceDatasnap?.monthAttendance;
                        if(monthAttendance==null){
                          return Center(
                            child: Text("There is No data available for ${_currentMonthfilter}",style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: screenWidth/20,
                                    color: primary,
                                    fontWeight: FontWeight.bold
                                )
                            ),),
                          );
                        }
                        // Reverse the list to show the most recent date first
                        var attendanceData =
                            dataSnapshot.data?.monthAttendance?.reversed.toList() ??
                                [];
                        return ListView.builder(
                          itemCount: attendanceData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              height: MediaQuery.of(context).size.height / 8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            attendanceData[index].date??"none",
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                color: primary, // Use your primary color variable
                                                fontWeight: FontWeight.w400,
                                                fontSize: MediaQuery.of(context).size.width / 18,
                                              ),
                                            ),
                                          ),
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                      crossAxisAlignment:CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          attendanceData[index].checkIn?.time??"",
                                                          style: GoogleFonts.roboto(
                                                              textStyle: TextStyle(
                                                                  color:
                                                                  lightBlackColor,
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: screenWidth / 22
                                                              )),
                                                        ),
                                                        Text(
                                                          "Check In",
                                                          style: GoogleFonts.roboto(
                                                              textStyle: TextStyle(
                                                                  color: Colors.black54,
                                                                  fontWeight: FontWeight.bold,
                                                                  fontSize: screenWidth / 30
                                                              )),
                                                        ),
                                                      ]
                                                  ),
                                                ),
                                                Expanded(
                                                    child:Column(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text(
                                                            attendanceData[index].checkOut?.time??"",
                                                            style: GoogleFonts.roboto(
                                                                textStyle: TextStyle(
                                                                    color:lightBlackColor,
                                                                    fontWeight: FontWeight.w500,
                                                                    fontSize: screenWidth/22
                                                                )
                                                            ),),
                                                          Text("Check Out",
                                                            style: GoogleFonts.roboto(
                                                                textStyle: TextStyle(
                                                                    color: Colors.black54,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: screenWidth/30
                                                                )
                                                            ),),
                                                        ]
                                                    )
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor:_getBackgroundColor(attendanceData[index].status.toString()),
                                      child: Container(
                                          child: Text(_getStatusText(attendanceData[index]?.status??""),style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenWidth/15
                                              )
                                          ),)

                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      else{
                        return Text("There is no Data");
                      }
                    },
                  ),
                );
              }),

            ],
          ),
      ),
    );
  }
}
