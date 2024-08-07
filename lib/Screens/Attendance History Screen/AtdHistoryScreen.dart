import 'package:employee_management_app/Provider/AtendanceHistoryProvider/HistoryProvider.dart';
import 'package:employee_management_app/Screens/HomeScreen.dart';
import 'package:employee_management_app/Widgets/AttendanceHistoryShimmer/AttendanceHistoryShimmerScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_month_picker/flutter_custom_month_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Provider/AtendanceHistoryProvider/HistoryProvider.dart';
import '../../Utills/Global Class/ColorHelper.dart';
import '../../Utills/Global Class/ScreenSize.dart';

class AtdHistoryScreen extends StatefulWidget {
  AtdHistoryScreen({super.key});

  @override
  State<AtdHistoryScreen> createState() => _AtdHistoryScreenState();
}

class _AtdHistoryScreenState extends State<AtdHistoryScreen> {
  bool isCurrentMonth = true;
  int currentYear = DateTime.now().year.toInt();
  int month = 3, year = 2023;

  DateTime _currentMonth = DateTime.now();
  String _currentMonthfilter=DateFormat(' MMMM').format(DateTime.now());
  void PreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _currentMonthfilter=DateFormat("MMMM").format(_currentMonth);
      isCurrentMonth = false;
    });
  }

  void NextMonth(BuildContext context) {
    setState(() {
      DateTime now = DateTime.now();
      if (_currentMonth.year == now.year && _currentMonth.month == now.month) {
        // If the current month is the same as the actual current month, do nothing
        return;
      }

      // Proceed to change the month
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _currentMonthfilter=DateFormat("MMMM").format(_currentMonth);
      if (_currentMonth.year == now.year && _currentMonth.month == now.month) {
        isCurrentMonth = true;
      } else {
        isCurrentMonth = false;
      }
    });
  }

/*void _pickMonth() async {
    final selectedDate = await showMonthYearPicker(
        context: context,
        initialDate: _currentMonth,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        builder: (context,child){
          return Theme(data: Theme.of(context).copyWith(
            dataTableTheme: DataTableThemeData(

                dataTextStyle: TextStyle(
                    fontSize: 22,
                )
            ),
            textTheme: TextTheme(
              bodyLarge: TextStyle(fontSize: 18),
              bodyMedium: TextStyle(fontSize: 18),
              bodySmall: TextStyle(fontSize: 16),
            ),
            colorScheme: ColorScheme.light(
              primary: primary,
              onPrimary: fontSecondary,
              onSurface: fontPrimary,
            ),
          ),
              child: child!,

          );
        }
    );

    if (selectedDate != null) {
      setState(() {
        _currentMonth = DateTime(selectedDate.year, selectedDate.month);
        DateTime now=DateTime.now();
        if(_currentMonth.year==now.year && _currentMonth.month==now.month){
          isCurrentMonth=true;
          _currentMonth=DateTime(_currentMonth.year,_currentMonth.month);
        }
        else{
          isCurrentMonth=false;
        }
      });
    }*/

  /*int _getDaysToShowCount() {
    DateTime today = DateTime.now();
    if (_currentMonth.year == today.year &&
        _currentMonth.month == today.month) {
      return today.day;
    } else {
      DateTime endOfMonth =
          DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
      return endOfMonth.day;
    }
  }*/

  /*DateTime _calculateDateForIndex(int index) {
    DateTime today = DateTime.now();
    if (_currentMonth.year == today.year &&
        _currentMonth.month == today.month) {
      return DateTime(today.year, today.month, today.day - index);
    } else {
      DateTime endOfMonth =
          DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
      return DateTime(
          endOfMonth.year, endOfMonth.month, endOfMonth.day - index);
    }
  }*/
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

  @override
  Widget build(BuildContext context) {
    final AtdHistProvider = Provider.of<HistoryProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
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
                        PreviousMonth();
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
                    Text(
                      DateFormat(" MMMM ").format(_currentMonth),
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                        color: lightBlackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 18,
                      )),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    InkWell(
                        onTap: () async {
                          showMonthPicker(
                            context,
                            onSelected: (month, year) {
                              if (kDebugMode) {
                                print('Selected month: $month, year: $year');
                              }
                              setState(() {
                                this.month = month;
                                this.year = year;
                              });
                            },
                            initialSelectedMonth: month,
                            initialSelectedYear: year,
                            firstEnabledMonth: 3,
                            lastEnabledMonth: 10,
                            firstYear: 2000,
                            lastYear: 2025,
                            selectButtonText: 'OK',
                            cancelButtonText: 'Cancel',
                            highlightColor: primary,
                            textColor: Colors.black,
                            contentBackgroundColor: Colors.white,
                            dialogBackgroundColor: Colors.grey[200],
                          );
                          print('Selected month: $month, year: $year');
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
                        NextMonth(context);
                        //AtdHistProvider.GetMonthData(_currentMonth.toString(), context);
                      },
                      child: isCurrentMonth
                          ? Container()
                          : Icon(
                              FontAwesomeIcons.chevronRight,
                              color: primary,
                              size: screenWidth / 15,
                            )),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<HistoryProvider>(context, listen: false)
                    .GetAttendanceData(_currentMonthfilter.toString()),
                builder: (context, dataSnapshot) {
                  if (dataSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (dataSnapshot.error != null) {
                    return Center(child: Text('An error occurred!'));
                  } else {
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
