// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid_tracker/Pages/appBar.dart';
import 'package:covid_tracker/Pages/drawer.dart';
import 'package:covid_tracker/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class About extends StatelessWidget {
  static const String id = 'about';
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(6.h),
                child: MyAppBar(),
              ),
              drawer: MyDrawer(),
              body: Column(
                children: [
                  InfoText(
                    infoText: 'DEVELOPER',
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 30.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:1.h),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Color(0xff42ba8f), width: 3)),
                            child: CircleAvatar(
                              radius: 6.h,
                              backgroundImage: AssetImage("images/pic.jpg"),
                            ),
                          ),
                        ),
                        Text(
                          'Syed Ashir Ali',
                          style: GoogleFonts.lato(
                              fontSize: 3.h, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Designer and Developer',
                          style: GoogleFonts.lato(
                              fontSize: 1.8.h, color: Colors.grey[600]),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: 3.h, horizontal: 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.email_rounded,
                                color: Colors.teal,
                              ),
                              Icon(FontAwesomeIcons.github),
                              Icon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                              ),
                              Icon(
                                FontAwesomeIcons.instagram,
                                color: Colors.purple,
                              ),
                              Icon(
                                FontAwesomeIcons.youtube,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  InfoText(
                    infoText: 'ABOUT APP',
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    width: 90.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.h, vertical: 2.h),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: GoogleFonts.lato(),
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
