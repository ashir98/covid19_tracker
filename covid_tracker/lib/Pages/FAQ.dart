// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:covid_tracker/Pages/appBar.dart';
import 'package:covid_tracker/Pages/drawer.dart';
import 'package:covid_tracker/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
class FAQ extends StatelessWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: [
                InfoText(infoText: "FAQ", ),
                GFAccordion(
                  textStyle: GoogleFonts.lato(color: Colors.black, ),
                  contentBackgroundColor: Colors.teal[50],
                  title:"Is COVID-19 worse than flu?" ,
                  content: "COVID-19 has a higher rate of severe disease and mortality in nearly every age group, compared with influenza (flu).",
                ),
          
                GFAccordion(
                  textStyle: GoogleFonts.lato(color: Colors.black, ),
                  contentBackgroundColor: Colors.teal[50],
                  title: 'How does COVID-19 compare to other public health threats?',
                  content: "This depends very much on where people live and how old they are, with some parts of the world hit harder than others, and some age groups being affected more, such as older people. However, even in countries where the COVID-19 death rate seems relatively low, the indirect impact on reduced health services, vaccine supply shortages, and reluctance to seek medical treatment for fear of infection is having a drastic impact and putting tens of millions of people at risk – including children and newborns.",
                ),
          
                GFAccordion(
                  textStyle: GoogleFonts.lato(color: Colors.black, ),
                  contentBackgroundColor: Colors.teal[50],
                  title: "How effective are masks and do they also need to cover my nose?",
                  content: "Mask wearing is a very simple and effective way to reduce transmission and save lives. The degree of protection depends on the type of mask, how well they worn and on other factors such as the behaviour of people wearing them and the behaviour of air droplets in different settings.",
                ),
          
                GFAccordion(
                  textStyle: GoogleFonts.lato(color: Colors.black, ),
                  contentBackgroundColor: Colors.teal[50],
                  title: "Why do governments benefit from helping to ensure other countries access vaccines?",
                  content: "Ensuring COVID-19 vaccines reach people in the world’s poorest countries isn’t just about being charitable or acting on a moral imperative; it’s also in the best interest of every country to do so. The pandemic started in Wuhan, China and spread to 180 countries within three months. That means if the virus is circulating in one country, the rest of the world remains at risk.",
                ),
                GFAccordion(
                  textStyle: GoogleFonts.lato(color: Colors.black, ),
                  contentBackgroundColor: Colors.teal[50],
                  title: "Would it be possible to achieve herd immunity without vaccines?",
                  content: "Historically, the most successful way to achieve herd immunity is actually through mass vaccination. This is a much safer route as the alternative is for roughly 60% of the population to be infected with COVID-19 which essentially means leaving the virus unchecked.",
                ),
                GFAccordion(
                  textStyle: GoogleFonts.lato(color: Colors.black, ),
                  contentBackgroundColor: Colors.teal[50],
                  title: 'What are the risks of re-infection?',
                  content: "As with other coronaviruses, such as those that cause the common cold, SARS-CoV-2 can reinfect people. There have been multiple reports of reinfection, including a 25-year-old man in the US who tested positive twice. The Lancet reported that “the second infection was symptomatically more severe than the first.”",
                )
              ],
            ),
          ), 
      ),
    );
  }
}