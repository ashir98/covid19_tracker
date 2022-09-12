// ignore_for_file: prefer_const_constructors

import 'package:covid_tracker/Pages/appBar.dart';
import 'package:covid_tracker/Services/states_services.dart';
import 'package:covid_tracker/Pages/country_details.dart';
import 'package:covid_tracker/Pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CountryStats extends StatefulWidget {
  static const String id = "country_stats";
  const CountryStats({Key? key}) : super(key: key);

  @override
  State<CountryStats> createState() => _CountryStatsState();
}

class _CountryStatsState extends State<CountryStats> {




  TextEditingController searchController = TextEditingController();
  @override

  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Sizer(builder: (context,orientation, deviceType){
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
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.h),
                  child: TextFormField(
                    style: GoogleFonts.lato(),
                    
                    keyboardType: TextInputType.name,
                    onChanged: (value){
                      setState(() {
                        
                      });
                    },
                    controller:  searchController,
                    cursorHeight:20,
                    cursorColor: Color(0xff42ba8f),
                   decoration: InputDecoration(
                    
                    filled: true,
                    fillColor: Colors.teal[50],
                    prefixIconColor: Colors.teal,
                    iconColor: Colors.teal,
                    hintStyle: TextStyle(color: Colors.teal),
                    contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                    prefixIcon: Icon(Icons.search_rounded, color: Colors.teal,),
                    hintText: 'Search with country name',
                    
                    
                  
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff42ba8f)),
                      borderRadius: BorderRadius.circular(50)
                    ),
                  
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff42ba8f)),
                      borderRadius: BorderRadius.circular(50),   
                    ),
                  
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff42ba8f)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    
                   ),
                   
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: stateServices.getCountriesStateData(),
                      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Color(0xff42ba8f),
                            ),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
    
                                String name = snapshot.data![index]['country'];
    
    
                                if(searchController.text.isEmpty){
    
                                  return Column(
                                  children: [
                                    GestureDetector(
    
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
    
    
                                      child: ListTile(
                                        leading: Container(
                                          height: 5.5.h,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(snapshot.data![index]['countryInfo']['flag'],),
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 1, style: BorderStyle.solid
                                            )
                                          )
                                        ),
                                        title: Text(snapshot.data![index]['country'],style: GoogleFonts.lato(color: Colors.black, )),
                                        trailing:
                                            Text("${snapshot.data![index]['deaths']}",style: GoogleFonts.lato(fontSize: 1.7.h, fontWeight: FontWeight.w400, color: Colors.red),),
                                      ),
                                    ),
                                    Divider()
                                  ],
                                );
    
                                }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                                  return Column(
                                  children: [
                                    GestureDetector(
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
                                      child: ListTile(
                                        leading: Container(
                                          height: 5.5.h,
                                          width: 20.w,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(snapshot.data![index]['countryInfo']['flag'],),
                                            ),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 1, style: BorderStyle.solid
                                            )
                                          )
                                        ),
                                        title: Text(snapshot.data![index]['country'],style: GoogleFonts.lato(color: Colors.black, )),
                                        trailing:
                                            Text("${snapshot.data![index]['deaths']}",style: GoogleFonts.lato(fontSize: 1.7.h, fontWeight: FontWeight.w300, color: Colors.red),),
                                      ),
                                    ),
                                    Divider()
                                  ],
                                );
    
                                }else{
    
                                  return SizedBox();
    
                                }
    
                                
                              });
                        }
                      }),
                )
              ],
            ),
          ));},
    );
  }
}
