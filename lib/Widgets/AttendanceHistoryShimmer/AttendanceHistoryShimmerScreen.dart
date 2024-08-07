import 'package:employee_management_app/Utills/Global%20Class/ScreenSize.dart';
import 'package:employee_management_app/Widgets/Global%20Widgets/Shimmer%20Widget/ContainerShimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../Utills/Global Class/ColorHelper.dart';

class AttendanceHistoryShimmer extends StatelessWidget {
  const AttendanceHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: SafeArea(
          child: Shimmer.fromColors(
            child: Column(
              children: [
                SizedBox(height: screenHeight/20,),
                Container(
                  height: screenHeight/8,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4),
                    borderRadius: BorderRadius.circular(screenWidth/40)
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerShimmer(
                                widthSize: screenWidth*0.75,
                                heightSize: screenHeight/30,
                                borderRadius: screenWidth/50
                            ),
                            SizedBox(height: screenHeight/40,),
                            Row(
                              children: [
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                                SizedBox(width: screenWidth/25,),
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(width: screenWidth/20,),
                        Center(
                          child: containerShimmer(
                              widthSize: screenWidth*.16,
                              heightSize: screenHeight/13,
                              borderRadius: screenWidth/2
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/50,),
                Container(
                  height: screenHeight/8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4),
                      borderRadius: BorderRadius.circular(screenWidth/40)
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerShimmer(
                                widthSize: screenWidth*0.75,
                                heightSize: screenHeight/30,
                                borderRadius: screenWidth/50
                            ),
                            SizedBox(height: screenHeight/40,),
                            Row(
                              children: [
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                                SizedBox(width: screenWidth/25,),
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(width: screenWidth/20,),
                        Center(
                          child: containerShimmer(
                              widthSize: screenWidth*.16,
                              heightSize: screenHeight/13,
                              borderRadius: screenWidth/2
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/50,),
                Container(
                  height: screenHeight/8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4),
                      borderRadius: BorderRadius.circular(screenWidth/40)
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerShimmer(
                                widthSize: screenWidth*0.75,
                                heightSize: screenHeight/30,
                                borderRadius: screenWidth/50
                            ),
                            SizedBox(height: screenHeight/40,),
                            Row(
                              children: [
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                                SizedBox(width: screenWidth/25,),
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(width: screenWidth/20,),
                        Center(
                          child: containerShimmer(
                              widthSize: screenWidth*.16,
                              heightSize: screenHeight/13,
                              borderRadius: screenWidth/2
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/50,),
                Container(
                  height: screenHeight/8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4),
                      borderRadius: BorderRadius.circular(screenWidth/40)
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerShimmer(
                                widthSize: screenWidth*0.75,
                                heightSize: screenHeight/30,
                                borderRadius: screenWidth/50
                            ),
                            SizedBox(height: screenHeight/40,),
                            Row(
                              children: [
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                                SizedBox(width: screenWidth/25,),
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(width: screenWidth/20,),
                        Center(
                          child: containerShimmer(
                              widthSize: screenWidth*.16,
                              heightSize: screenHeight/13,
                              borderRadius: screenWidth/2
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/50,),
                Container(
                  height: screenHeight/8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4),
                      borderRadius: BorderRadius.circular(screenWidth/40)
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerShimmer(
                                widthSize: screenWidth*0.75,
                                heightSize: screenHeight/30,
                                borderRadius: screenWidth/50
                            ),
                            SizedBox(height: screenHeight/40,),
                            Row(
                              children: [
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                                SizedBox(width: screenWidth/25,),
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(width: screenWidth/20,),
                        Center(
                          child: containerShimmer(
                              widthSize: screenWidth*.16,
                              heightSize: screenHeight/13,
                              borderRadius: screenWidth/2
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/50,),
                Container(
                  height: screenHeight/8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4),
                      borderRadius: BorderRadius.circular(screenWidth/40)
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerShimmer(
                                widthSize: screenWidth*0.75,
                                heightSize: screenHeight/30,
                                borderRadius: screenWidth/50
                            ),
                            SizedBox(height: screenHeight/40,),
                            Row(
                              children: [
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                                SizedBox(width: screenWidth/25,),
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(width: screenWidth/20,),
                        Center(
                          child: containerShimmer(
                              widthSize: screenWidth*.16,
                              heightSize: screenHeight/13,
                              borderRadius: screenWidth/2
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight/50,),
                Container(
                  height: screenHeight/8,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4),
                      borderRadius: BorderRadius.circular(screenWidth/40)
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            containerShimmer(
                                widthSize: screenWidth*0.75,
                                heightSize: screenHeight/30,
                                borderRadius: screenWidth/50
                            ),
                            SizedBox(height: screenHeight/40,),
                            Row(
                              children: [
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                                SizedBox(width: screenWidth/25,),
                                containerShimmer(
                                    widthSize: screenWidth*0.25,
                                    heightSize: screenHeight/30,
                                    borderRadius: screenWidth/50
                                ),
                              ],
                            )

                          ],
                        ),
                        SizedBox(width: screenWidth/20,),
                        Center(
                          child: containerShimmer(
                              widthSize: screenWidth*.16,
                              heightSize: screenHeight/13,
                              borderRadius: screenWidth/2
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
              baseColor: darkgreyColor,
              highlightColor: lightgreyColor
          ),
        ),
      );
  }
}
