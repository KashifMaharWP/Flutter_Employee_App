import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleCustomCard extends StatelessWidget {
  final String label;
  final int progressValue;
  final Color color;
  final Color headingColor;
  final Color backgroundColor;
  final double screenWidth;
  final double screenHeight;
  final String totalhrs;
  final String slash;

  SimpleCustomCard({
    required this.label,
    required this.progressValue,
    required this.color,
    required this.headingColor,
    required this.backgroundColor,
    required this.screenWidth,
    required this.screenHeight,
    required this.totalhrs,
    required this.slash,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight/8,
      width: screenWidth/2.4,
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.1,
                blurRadius: 5,
                offset: Offset(2,2),
              color: lightBlackColor
            )
          ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${progressValue}${slash}${totalhrs}",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: headingColor,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth/15
                )
            ),),
          Text("${label}",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color:color,
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth/25
                )
            ),),

        ],
      ),
    );
  }
}



