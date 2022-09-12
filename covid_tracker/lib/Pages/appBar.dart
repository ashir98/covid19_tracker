// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {


  

  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override

 
   Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white
      ),
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      elevation: 0,
      title: Row(
        children: [
          SizedBox(width: 20,),
          Image.asset('images/applogo.png',
          height:40,
          width:40,),
          SizedBox(width: 8,),
          Text('Covid-19 Tracker', style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
   

    );
  }
}
