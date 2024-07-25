import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleCustomCard extends StatelessWidget {
  final String label;
  final int progressValue;
  final Color fontPrimaryColor;
  final Color fontSecondaryColor;
  final Color color;
  final double screenWidth;
  final double screenHeight;
  final String totalhrs;
  final String slash;

  SimpleCustomCard({
    required this.label,
    required this.progressValue,
    required this.fontPrimaryColor,
    required this.fontSecondaryColor,
    required this.color,
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
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [fontSecondaryColor,Colors.white]
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(2,4),
              color: Colors.black12
            )
          ],
          border:Border(top:BorderSide(
              color: color,
              width: 10,
              style: BorderStyle.solid
          )),
          borderRadius: BorderRadius.circular(2)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${progressValue}${slash}${totalhrs}",
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: color,
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



