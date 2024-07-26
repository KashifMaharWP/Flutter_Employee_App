import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:employee_management_app/Utills/Global%20Class/ScreenSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveHistoryScreen extends StatelessWidget {
  const LeaveHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Stack(
              children: [
                Container(
                  height: screenHeight/3.5,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      boxShadow: [
                        BoxShadow(
                            color: lightBlackColor,
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(2, 4)
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(screenWidth/20),
                        bottomLeft: Radius.circular(screenWidth/20),
                      )
                  ),),

                Positioned(
                  top: screenHeight/14,
                  left: screenWidth/13,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width:screenWidth*0.85,
                        height: screenHeight/8,
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: lightBlackColor,
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                  offset: Offset(2, 4)
                              ),
                            ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                backgroundColor: whiteColor,
                                radius: screenWidth/16,
                                child: Icon(
                                  FontAwesomeIcons.fileCircleCheck,
                                  color: lightBlackColor,
                                )),
                            Text("You Have 2 Leave Balance",style: GoogleFonts.roboto(
                                color: whiteColor,
                                fontSize: screenWidth/22,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: screenHeight/6,
                  left: screenWidth*0.84,
                  child: CircleAvatar(
                    backgroundColor: lightBlackColor,
                    radius: screenWidth/15,
                    child: Icon(
                      FontAwesomeIcons.plus,
                    color: whiteColor,
                    ),
                  ),
                )
              ],
            )


          
        ],
      ),
    );
  }
}
