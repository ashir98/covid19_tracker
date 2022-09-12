// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_constructor_bodies, depend_on_referenced_packages, use_key_in_widget_constructors, must_be_immutable


import 'package:covid_tracker/Models/world_state_model.dart';
import 'package:covid_tracker/Pages/appBar.dart';
import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/Pages/countries_stats.dart';
import 'package:covid_tracker/Pages/country_details.dart';
import 'package:covid_tracker/Pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sizer/sizer.dart';


class HomePage extends StatefulWidget {
  static const String id = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colorList = <Color>[
    Color(0xff4285f4),
    Color(0xff1aa260),
    Color(0xffde5246),
    Color(0xff673685)
  ];

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Sizer(builder:(context, orientation, deviceType) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      
          home: Scaffold(
            backgroundColor: Colors.white,

            appBar: PreferredSize(
              preferredSize: Size.fromHeight(6.h),
              child: MyAppBar(),
            ),

            drawer: MyDrawer(),
       
       //APP BODY
            body: FutureBuilder(
              future: stateServices.getWorldStateData(),
              builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.teal,
                    ),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: Text('Something went Wrong',
                        style: GoogleFonts.lato(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  );
                }
            
            
            else if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        //PREVENTION TIPS TEXT
                        InfoText(
                          infoText: 'PREVENTION TIPS'),

                        //CAROUSEL SLIDER
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.8.h, horizontal: 1.h),
                          child: CarouselSlider(
                            options: CarouselOptions(
                                viewportFraction: 1,
                                autoPlay: true,
                                initialPage: 0,
                                height: 23 .h),
                            items: [
                              CarouselItems(imagePath: 'images/1.jpg'),
                              CarouselItems(imagePath: 'images/3.jpg'),
                              CarouselItems(imagePath: 'images/4.jpg'),
                              CarouselItems(imagePath: 'images/5.jpg'),
                            ],
                          ),
                        ),

                      //TEXT
                      InfoText(
                          infoText: 'WORLD STATS',
                        ),

                        // PIE CHART
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 1.h),
                          child: SizedBox(
                            height: 180,
                            child: Card(
                              color: Colors.amber[400],
                              elevation: 0.8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: PieChart(
                                chartRadius: 15.h,
                                chartValuesOptions: ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                                legendOptions: LegendOptions(
                                    legendPosition: LegendPosition.left),
                                animationDuration: Duration(seconds: 3),
                                chartType: ChartType.ring,
                                colorList: colorList,
                                dataMap: {
                                  "Total": double.parse(
                                      snapshot.data!.cases.toString()),
                                  "Recovered": double.parse(
                                      snapshot.data!.recovered.toString()),
                                  "Deaths": double.parse(
                                      snapshot.data!.deaths.toString()),
                                  "Crtical": double.parse(
                                      snapshot.data!.critical.toString()),
                                },
                              ),
                            ),
                          ),
                        ),

                      //STATISTICS CARDS
                      Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 1.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCard(
                                      bottomText:
                                          snapshot.data!.active.toString(),
                                      cardColor: 0xff8f8d8d,
                                      textColor: 0xff2e2e2e,
                                      topText: 'ACTIVE CASES'),
                                  CustomCard(
                                      bottomText:
                                          snapshot.data!.cases.toString(),
                                      cardColor: 0xff7a9eff,
                                      textColor: 0xff2457e3,
                                      topText: 'CONFIRMED')
                                ],
                              ),
                              Padding(
                                padding:
                                     EdgeInsets.symmetric(vertical: 1.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomCard(
                                        bottomText:
                                            snapshot.data!.recovered.toString(),
                                        cardColor: 0xff9dfac1,
                                        textColor: 0xff029649,
                                        topText: "RECOVERED"),
                                    CustomCard(
                                        bottomText:
                                            snapshot.data!.deaths.toString(),
                                        cardColor: 0xfffa9d9d,
                                        textColor: 0xff9c0606,
                                        topText: "DEATHS")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      //COUNTRIES INFO TEXT

                      InfoText(infoText: 'MOST AFFECTED COUNTRIES'),

                      //NOST AFFECTED COUNTRIES CHART

                      FutureBuilder(
                          future: stateServices.getCountriesStateData(),
                          builder:
                              (context, AsyncSnapshot<List<dynamic>> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator()
                              );
                            }else if(snapshot.connectionState == ConnectionState.active|| snapshot.connectionState == ConnectionState.done){

                              return Padding(
                                padding:  EdgeInsets.symmetric(
                                    vertical: 0.8.h, horizontal: 1.h),
                                child: Card(
                                    color: Colors.amber[400],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 1.h),
                                        child: Column(
                                          children: [
                                            ListView.builder(
                                              physics: NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: snapshot.data!.length,
                                                itemBuilder: (context, index) {
                                                  if (index == 217 ||
                                                      index == 94 ||
                                                      index == 71 ||
                                                      index == 26) {
                                                    return GestureDetector(
                                                      onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryDetails(
                                        name: snapshot.data![index]['country'], 
                                        image: snapshot.data![index]['countryInfo']['flag'], 
                                        active: snapshot.data![index]['active'], 
                                        critical: snapshot.data![index]['critical'], 
                                        todayCases: snapshot.data![index]['todayCases'],
                                        todayRecovered: snapshot.data![index]['todayRecovered'], 
                                        totalDeaths: snapshot.data![index]['totalDeaths'],
                                        totalRecovered: snapshot.data![index]['totalRecovered']
                                         )));
                                        
                                        
                                        
                                        
                                    },

                                                      child: CustomList(
                                                          image: snapshot.data![index]
                                                              ['countryInfo']['flag'],
                                                          numbers:
                                                              snapshot.data![index]
                                                                  ['deaths']),
                                                    );
                                                  } else {
                                                    return SizedBox();
                                                  }
                                                }),
                                            TextButton(onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryStats()));
                                            }, child: Text('See more',style: GoogleFonts.lato(fontSize: 2.h, color: Colors.black, fontWeight: FontWeight.w400), ))    
                                          ],
                                        ))),
                              );
                              
                            }else if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }else{
                              return SizedBox();
                            }
                          })
                    ],
                  ),
                );
              
            } else {
              throw Exception('SOMETHING WENT WRONG');
            }
          },
        ),
      ),
    );
    },);
  }
}























//CAROUSEL SLIDER ITEMS
class CarouselItems extends StatelessWidget {
  String imagePath;
  CarouselItems({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 0.8.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(fit: BoxFit.fill, image: AssetImage(imagePath)),
        ));
  }
}

//CUSTOM LIST
class CustomList extends StatelessWidget {
  String image;
  int numbers;

  CustomList({required this.image, required this.numbers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      child: GestureDetector(
        child: ListTile(
          leading: Container(
              width: 20.w,
              height: 6.h,
              margin: EdgeInsets.symmetric(horizontal: 0.8.h),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
              )),
          trailing: Text(
            'DEATHS: $numbers',
            style: GoogleFonts.lato(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

//INFORMATION TEXT

class InfoText extends StatelessWidget {
  String infoText;
  
  InfoText({required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 2.h, top: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            infoText,style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 2.8.h)
          )
        ],
      ),
    );
  }
}

//CUSTOM CARD WIDGET
class CustomCard extends StatelessWidget {
  String topText;
  String bottomText;
  int textColor;
  int cardColor;

  CustomCard(
      {required this.bottomText,
      required this.cardColor,
      required this.textColor,
      required this.topText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 13.h,
      width: 47.w,
      child: Card(
        elevation: 0.8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(cardColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    topText,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                        fontSize: 2.5.h,
                        fontWeight: FontWeight.bold,
                        color: Color(textColor)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    bottomText,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                        fontSize: 2.5.h,
                        fontWeight: FontWeight.w400,
                        color: Color(textColor)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
