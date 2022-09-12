// ignore_for_file: prefer_const_constructors

import 'package:covid_tracker/Pages/FAQ.dart';
import 'package:covid_tracker/Pages/about.dart';
import 'package:covid_tracker/Pages/countries_stats.dart';
import 'package:covid_tracker/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Sizer(builder: (context, orientation, deviceType){
      return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.symmetric(vertical:3.5.h),
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              children: [
                ClipRRect(
                  
                  
                  child: Image.asset(
                    
                    'images/logo.png',
                    width: 100.w,
                    height: 12.h,
                    semanticLabel: 'COVID-19 Tracker',
                  ),
                ),
                

                
              ],
            ) ,
          ),

          ListTile(
            leading: Icon(Icons.home_rounded, color: Color(0xff42ba8f),),
            title: Text('Home',style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
          ),

          ListTile(
            leading: Icon(Icons.auto_graph_rounded,color: Color(0xff42ba8f)),
            title: Text('Country Stats',style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryStats())),
          ),

          Divider(),


          ListTile(
            leading: Icon(Icons.info, color: Color(0xff42ba8f),),
            title: Text('About',style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>About())),
          ),
          

          ListTile(
            leading: Icon(Icons.question_mark_rounded ,color: Color(0xff42ba8f)),
            title: Text('FAQ',style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQ())),
          ),

         
        ],
      ),
    );
    });
  }
}