// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid_tracker/Pages/countries_stats.dart';
import 'package:covid_tracker/Pages/country_details.dart';
import 'package:covid_tracker/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyCovidTracker());
}

class MyCovidTracker extends StatefulWidget {
  const MyCovidTracker({Key? key}) : super(key: key);

  @override
  State<MyCovidTracker> createState() => _MyCovidTrackerState();
}

class _MyCovidTrackerState extends State<MyCovidTracker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id: (context) =>HomePage(),
        CountryStats.id: (context) =>CountryStats(),
        CountryDetails.id:(context) => CountryDetails() 
      },

      
    );
  }
}
