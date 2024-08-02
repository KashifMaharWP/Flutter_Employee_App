import 'package:employee_management_app/Provider/Authentication%20Provider/authProvider.dart';
import 'package:employee_management_app/Provider/Authentication%20Provider/authProvider.dart';
import 'package:employee_management_app/Screens/Home.dart';
import 'package:employee_management_app/Screens/HomeScreen.dart';
import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:employee_management_app/Screens/Attendance%20Screen/Widgets/AttendanceShimmerScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../Utills/Global Class/ScreenSize.dart';

class SignInUp extends StatefulWidget {
   SignInUp({super.key});

  @override
  State<SignInUp> createState() => _SignInUpState();
}

class _SignInUpState extends State<SignInUp> {

   final UserName = TextEditingController();
   final email = TextEditingController();
   final password = TextEditingController();
   final EID = TextEditingController();
   final _formKey=GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight/3,
              decoration: BoxDecoration(
                  color: primary,
              ),
              child: Center(
                child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 8,
                            offset: Offset(2, 4)
                          )
                        ]
                    ),
                    child: Image(
                      image: AssetImage("lib/Assets/images/Logo.png"),
                      width: screenWidth/3,
                    )
                ),
              ),
            ),

            Container(
              height: screenHeight,
              padding: EdgeInsets.only(left: 20,right: 20,top: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 8,
                    offset: Offset(2, 0)
                  )
                ]
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        labelText: "Email",
                        icon: Icon(
                          FontAwesomeIcons.solidEnvelope,
                          color: primary,
                          size: screenWidth/20,
                        )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Email Field is Empty";
                        }
                        else if(!value.contains('@')){
                          return "Invalid Email Address";
                        }
                        else{
                          return null;
                        }
                      },//Validator
                    ),

                    TextFormField(
                      obscureText:true,
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        labelText: "Password",
                        icon: Icon(
                          FontAwesomeIcons.lock,
                          color: primary,
                          size: screenWidth/20,
                        )
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Password Field is Empty";
                        }
                        /*else if(value.length < 6){
                          return "Password must be 6 character Long";
                        }*/
                        else{
                          return null;
                        }
                      },//Validator
                    ),
                    SizedBox(
                      height: 20,
                    ),


                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child:
                        ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()) {

                          print("Clicked");
                            authProvider.login(
                                email.text.toString(),
                                password.text.toString(),
                                context,
                            );
                        }
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            elevation: 20,
                          ),
                          child: authProvider.loading?Text("Sign In",
                            style: GoogleFonts.roboto(
                                  color: whiteColor,
                                  fontSize: screenWidth/18,
                                  fontWeight: FontWeight.bold
                          )
                          ,):CircularProgressIndicator(color: primary,)
                      )
                    ),

                    SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
