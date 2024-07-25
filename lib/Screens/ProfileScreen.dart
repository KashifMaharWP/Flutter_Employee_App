import 'package:employee_management_app/Screens/SignIn-UpScreen.dart';
import 'package:employee_management_app/Utills/Global%20Class/ColorHelper.dart';
import 'package:employee_management_app/Utills/Global%20Class/userDataList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utills/Global Class/ScreenSize.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {

    //final user = Provider.of<AuthProvider>(context).user;
    List<dynamic>? skills = UserDataList.userskill;
    //skills?.add("Developer");
    String url=UserDataList.userprofilePicture;


    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenHeight/7),
                height: screenHeight/4,
                child: Center(
                  child: CircleAvatar(
                     //backgroundImage: NetworkImage(url),
                    radius: 90,
                  ),
                ),
              ),
              Container(
                child: Text("${UserDataList.username}",style: GoogleFonts.roboto(
                  fontSize: screenWidth/15,
                  fontWeight: FontWeight.bold,
                  color: whiteColor
                ),),
              ),
          
              Container(
                child: Text("${UserDataList.useremail}",style: GoogleFonts.roboto(
                    fontSize: screenWidth/25,
                    fontWeight: FontWeight.bold,
                    color: lightBlackColor
                ),),
              ),
          
              SizedBox(
                height: screenHeight/40,
              ),
          
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color:Colors.black26,width: 0.5)
                ),
              ),
          
              SizedBox(
                height: screenHeight/30,
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        elevation: 10,
                        padding: EdgeInsets.all(10),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.gear,color: Colors.white,),
                          SizedBox(width: screenWidth/50,),
                          Text("Edit Profile Picture",style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: whiteColor,
                              fontSize: screenWidth/28,
                              fontWeight: FontWeight.bold
                            )
                          ),),
                        ],
                      ),
                  ),
          
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        elevation: 10,
                        padding: EdgeInsets.all(10),
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        )
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInUp()));
                      },
                      child: Wrap(
                        children: [
                          Icon(FontAwesomeIcons.rightFromBracket,color: Colors.white,),
                          SizedBox(width: screenWidth/50,),
                          Text("Logout",style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: whiteColor,
                                  fontSize: screenWidth/28,
                                  fontWeight: FontWeight.bold
                              )
                          ),),
                        ]
                      ),
                    ),
                  ),
                ]
              ),
          
              SizedBox(
                height: screenHeight/30,
              ),
          
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth/30),
                alignment: Alignment.center,
                height: screenHeight/15,
                padding: EdgeInsets.only(left: 40,right: 40),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Employee Details",style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        color: primary,
                        fontSize: screenWidth/20,
                        fontWeight: FontWeight.bold
                    )
                ),),
              ),
          
              SizedBox(
                height: screenHeight/20,
              ),
              
              
              //Phone Number
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(FontAwesomeIcons.phone,
                                color: primary,
                                size: screenWidth/22,)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Phone Number: ${UserDataList.userphoneNo}",style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: lightBlackColor,
                                  fontSize: screenWidth/22,
                                  fontWeight: FontWeight.bold
                              )
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.black26,width: 0.5)
                      ),
                    ),
                  ],
                ),
              ),
          
              //Date of Birth
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(FontAwesomeIcons.birthdayCake,
                                color: primary,
                                size: screenWidth/22,)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Date of Birth : ${UserDataList.userbirthDate}",style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: lightBlackColor,
                                  fontSize: screenWidth/22,
                                  fontWeight: FontWeight.bold
                              )
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.black26,width: 0.5)
                      ),
                    ),
                  ],
                ),
              ),
          
              //Address
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(FontAwesomeIcons.locationDot,
                                color: primary,
                                size: screenWidth/22,)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text("Address Line : ${UserDataList.userAddress?['AddressLine']}, ${UserDataList.userAddress?['City']}, ${UserDataList.userAddress?['State_Region']}",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: lightBlackColor,
                                      fontSize: screenWidth/22,
                                      fontWeight: FontWeight.bold
                                  )
                              ),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.black26,width: 0.5)
                      ),
                    ),
                  ],
                ),
              ),

              //Destination
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(FontAwesomeIcons.award,
                                color: primary,
                                size: screenWidth/22,)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("${UserDataList.userdesignation}",style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: lightBlackColor,
                                  fontSize: screenWidth/22,
                                  fontWeight: FontWeight.bold
                              )
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.black26,width: 0.5)
                      ),
                    ),
                  ],
                ),
              ),

              //Branch Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: Icon(FontAwesomeIcons.earth,
                                color: primary,
                                size: screenWidth/22,)
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text("Work Here : ${UserDataList.userbranchName}",style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: lightBlackColor,
                                    fontSize: screenWidth/22,
                                    fontWeight: FontWeight.bold
                                )
                            ),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Colors.black26,width: 0.5)
                      ),
                    ),
                  ],
                ),
              ),

              //Skill
              /*skills!=null&&skills!.isNotEmpty?
              ListView.builder(
                itemCount: skills.length,
                itemBuilder: (context, index){
                  return Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: primary,
                    ),
                    child: Text(skills[index]),
                  );
                },

              ):Container(),*/




            ],
          ),
        ),
      ),
    );
  }
}
