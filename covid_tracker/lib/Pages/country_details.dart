// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, duplicate_ignore

import 'package:covid_tracker/Pages/appBar.dart';
import 'package:covid_tracker/Pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CountryDetails extends StatefulWidget {

  static const String id = 'country_deatils'; 


  String name, image;
  int todayCases, active, critical, todayRecovered;
  int? totalDeaths, totalRecovered;

  CountryDetails({
     this.name = '',
     this.image = '',
    this.active =0,
     this.critical=0,
     this.todayCases=0,
     this.todayRecovered = 0,
     this.totalDeaths=0,
     this.totalRecovered
  });

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(builder:(context, orientation, deviceType) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
       backgroundColor: Colors.white,
       
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(),
        ),

        drawer: MyDrawer(),
       
       
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:5.h, horizontal: 2.h),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      color: Colors.teal[50],
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ListTile(
                            title: Text('Today Cases',style: GoogleFonts.lato(fontSize: 2.h),),
                            trailing: Text(widget.todayCases.toString(),style: GoogleFonts.lato(fontSize: 2.h),),
                          ),
                          ListTile(
                            title: Text('Critical',style: GoogleFonts.lato(fontSize: 2.h),),
                            trailing: Text(widget.critical.toString(),style: GoogleFonts.lato(fontSize: 2.h),),
                          ),
                          ListTile(
                            title: Text('Active',style: GoogleFonts.lato(fontSize: 2.h),),
                            trailing: Text(widget.active.toString(),style: GoogleFonts.lato(fontSize: 2.h),),
                          ),
                          ListTile(
                            title: Text('Today Recovered',style: GoogleFonts.lato(fontSize: 2.h),),
                            trailing: Text(widget.todayRecovered.toString(),style: GoogleFonts.lato(fontSize: 2.h),),
                          ),
                          ListTile(
                            title: Text('Total Deaths',style: GoogleFonts.lato(fontSize: 2.h),),
                            trailing: Text(widget.todayRecovered.toString(),style: GoogleFonts.lato(fontSize: 2.h),),
                          ),
                          ListTile(
                            title: Text('Total Recovered',style: GoogleFonts.lato(fontSize: 2.h),),
                            trailing: Text(widget.totalRecovered.toString(),style: GoogleFonts.lato(fontSize: 2.h),),
                          )
                        ],
                      ),
                    ),
                  ),
        
                  Column(
                    children: [
                     Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Color(0xff42ba8f)
                        )
                      ),
                       child: CircleAvatar(
                          
                    radius: 4.5.h,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                     ),
                  Text(widget.name, style: GoogleFonts.lato(fontSize: 3.h, fontWeight: FontWeight.bold),),
                    ],
                  )
              
                ],
              ),
            ],
          ),
        ),
      ),
    );
    },);
  }
}
