import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/assets.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final day = DateFormat('EEEE').format(DateTime.now());
  final date = DateFormat('MMMM d, y').format(DateTime.now());
  final int itemCount = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 38.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello Friend 👋',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(Icons.dark_mode_outlined, color: AppColors.blackColor),
                  ],
                ),
                SizedBox(height: 16.0),

                Text(
                  'Ready to do your Daily Tasks ??',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
                SizedBox(height: 16.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Today\'s ',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: day,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: AppColors.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),

                    Text(
                      date,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: AppColors.geryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Divider(thickness: 2, color: AppColors.blackColor, indent: 150),

          Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 38.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ongoing',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                    Image.asset(Assets.calendarIcon, height: 30, width: 30),
                  ],
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                itemCount > 0
                    ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [BoxShadow(color: AppColors.bgColor)],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                Assets.gymIcon,
                                height: 48,
                                width: 48,
                              ),
                              SizedBox(width: 8.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Go to Gym',
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(height: 4.0),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.schedule_outlined, size: 16.0),
                                      SizedBox(width: 8.0),
                                      Text(
                                        '10 : 00 AM  -  06 : 00 PM',
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    )
                    : Center(
                      child: Image.asset(
                        Assets.noTaskFound,
                        height: 240,
                        width: 240,
                        opacity: AlwaysStoppedAnimation(0.25),
                      ),
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.blueColor,
        foregroundColor: AppColors.whiteColor,
        child: Icon(Icons.add),
      ),
    );
  }
}
