import 'dart:async';
//import 'package:employee_management_app/Model/AttendanceCheckInModel.dart';
import 'package:employee_management_app/Utills/AttendanceDataList.dart';
import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:employee_management_app/Widgets/Local%20Widgets/AttendanceCard.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../Utills/Global Class/ScreenSize.dart';
import 'Functions/Location_Tracker.dart';
import '../../../Provider/Attendance Provider/attendanceProvider.dart';
import 'Widgets/SimpleCard.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override

  String checkIn=CheckInData.location;
  String checkOut='--|--';
  Timer? _midnightTimer;
  Timer? _autoCheckoutTimer;
  StreamController<int>? _countdownController;
  double progressvalue=20;

  @override
  void initState() {
    super.initState();
    _startMidnightTimer();
  }

  void _startMidnightTimer() {
    _midnightTimer = Timer.periodic(Duration(minutes: 1), (timer) {
      DateTime now = DateTime.now();
      if (now.hour == 0 && now.minute == 0) {
        setState(() {
          checkIn = '--|--';
          checkOut = '--|--';

        });
      }
    });
  }

  /*void _startAutoCheckoutTimer() {
    _autoCheckoutTimer?.cancel();
    const duration = Duration(hours: 8);
    _countdownController = StreamController<int>();
    _autoCheckoutTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      final remaining = duration - Duration(seconds: timer.tick);
      if (remaining <= Duration.zero) {
        timer.cancel();
        _countdownController?.close();
        if () {
          setState(() {
            checkOut = DateFormat('hh:mm').format(DateTime.now());
            ischeckedIn = false;
          });
        }
      } else {
        _countdownController?.add(remaining.inSeconds);
      }
    });
  }
*/
  @override
  void dispose() {
    _midnightTimer?.cancel();
    _autoCheckoutTimer?.cancel();
    _countdownController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initState(){
      setState(() {

      });
    }
    final atdProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text("Today's Status",style: GoogleFonts.roboto(
                textStyle:TextStyle(
                  color: lightBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize:screenWidth/15,
                )
              ),),
            ),

            Container(
              margin: EdgeInsets.only(top: 10,bottom: 30),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(2, 6)
                  )
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Check In",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth/25
                        )
                      ),),
                      Text("$checkIn",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: lightBlackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth/15
                            )
                        ),),
                    ],
                  )),
                  Expanded(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Check Out",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth/25
                                )
                            ),),
                          Text("$checkOut",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color:lightBlackColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: screenWidth/15
                                )
                            ),),
                        ],
                      )),

                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                         alignment: Alignment.centerLeft,
                         child: RichText(
                  
                             text: TextSpan(
                                 text: DateTime.now().day.toString(),
                                 style: GoogleFonts.roboto(
                                   textStyle: TextStyle(
                                       fontSize: screenWidth/15,
                                       fontWeight: FontWeight.w500,
                                       color: primary
                                   ),
                                 ),
                                 children: [
                                   TextSpan(
                                     text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                                     style: GoogleFonts.roboto(
                                       textStyle: TextStyle(
                                           fontSize: screenWidth/18,
                                           fontWeight: FontWeight.w500,
                                           color: lightBlackColor
                                       ),
                                     ),
                                   )
                  
                                 ]
                             )
                         )
                     ),
                     StreamBuilder(
                         stream: Stream.periodic(const Duration(seconds: 1)),
                         builder: (context,snapshot){
                           return Container(
                             alignment: Alignment.centerLeft,
                             child: Text(DateFormat('hh:mm:ss:a').format(DateTime.now()),style: GoogleFonts.roboto(
                                 textStyle: TextStyle(
                                     fontSize: screenWidth/20,
                                     color: Colors.black54,
                                     fontWeight: FontWeight.bold
                                 )
                             ),
                             ),
                           );
                         }),
                   ],
                                 ),
                ),
                atdProvider.ischeckedIn?
                Container() :Expanded(
                  child: StreamBuilder<int>(
                    stream: _countdownController?.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final remainingSeconds = snapshot.data!;
                        final hours = remainingSeconds ~/ 3600;
                        final minutes = (remainingSeconds % 3600) ~/ 60;
                        final seconds = remainingSeconds % 60;
                        return Text(
                          'Remaining Time: ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 18,
                              fontWeight: FontWeight.w500,
                              color: lightBlackColor,
                            ),
                          ),
                        );
                      } else {
                        return Text(
                          'Remaining Time: 08:00:00',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 18,
                              fontWeight: FontWeight.w500,
                              color: lightBlackColor,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),


            Container(
              margin: EdgeInsets.only(top: screenWidth/15),
              child: Builder(builder: (context){
                final GlobalKey<SlideActionState> key= GlobalKey();
                return SlideAction(
                  text: atdProvider.ischeckedIn?"Slide to Check Out":"Slide to Check In",
                  textStyle: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: lightBlackColor,
                      fontSize: screenWidth/20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  outerColor: Colors.white,
                  innerColor: atdProvider.ischeckedIn?darkgreyColor:primary,
                  elevation: 10,

                  key: key,
                  onSubmit: (){
                    key.currentState!.reset();
                    if(atdProvider.ischeckedIn==false){
                      /*checkIn = DateFormat('hh:mm').format(DateTime.now());
                      print("isChecked False");
                      print("$checkIn");
                      //_startAutoCheckoutTimer();
                      //getCurrentLocation();*/
                      getCurrentLocationCheckInTime(context);
                    }
                    else{
                      getCurrentLocationCheckOutTime(context);

                    }

                  }
                );
              }),
            ),
            SizedBox(
              height: screenHeight/15,
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: Text("${DateFormat(' MMMM').format(DateTime.now())} Status",style: GoogleFonts.roboto(
                  textStyle:TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize:screenWidth/15,
                  )
              ),),
            ),
            SizedBox(
              height: 5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleCustomCard(
                    label: "Early Leave",
                    progressValue: 8,
                    fontPrimaryColor: lightBlackColor,
                    fontSecondaryColor: whiteColor,
                    color: primary,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  totalhrs: '',
                  slash: '',
                ),
                SimpleCustomCard(
                    label: "On Time",
                    progressValue: 20,
                    fontPrimaryColor: lightBlackColor,
                    fontSecondaryColor: whiteColor,
                    color: primary,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  totalhrs: '',
                  slash: '',
                ),
              ],
            ),

            SizedBox(
              height: screenHeight/35,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleCustomCard(
                    label: "Absent",
                    progressValue: 2,
                    fontPrimaryColor: lightBlackColor,
                    fontSecondaryColor: whiteColor,
                    color: primary,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  totalhrs: '',
                  slash: '',
                ),
                SimpleCustomCard(
                    label: "TotalPresent",
                    progressValue: 28,
                    fontPrimaryColor: lightBlackColor,
                    fontSecondaryColor: whiteColor,
                    color: primary,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    totalhrs: '',
                  slash: '',
                ),
              ],
            ),





          ],
        )
      ),
    );
  }
}


