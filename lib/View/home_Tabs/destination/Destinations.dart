import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Category.dart';
import '../../TramModel.dart';
class Destinations extends StatefulWidget {
  const Destinations({super.key});

  @override
  State<Destinations> createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("CATEGORY",style: GoogleFonts.niramit(fontWeight: FontWeight.w700,fontSize: 18),),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(


                    scrollDirection: Axis.horizontal,


                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 140,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Text("RAJAtSTHAN",style: GoogleFonts.marcellusSc(fontSize: 16,fontWeight: FontWeight.w400,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("""Rajasthan, located in northwestern India, is a land of majestic palaces, historic forts,and vibrant culture. Visitors are drawn to iconic attractions like the Amber Fort in Jaipur, the intricate carvings of Ranakpur Jain Temple, and the desert city of Jaisalmer with its golden-hued architecture. """,
                                        style: GoogleFonts.niramit(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 280,left: 140),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Text("Explore Now",style: GoogleFonts.niramit(color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("FAMILY DESTINATIONS",style: GoogleFonts.niramit(fontWeight: FontWeight.w700,fontSize: 18),),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 140,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Text("RAJAtSTHAN",style: GoogleFonts.marcellusSc(fontSize: 16,fontWeight: FontWeight.w400,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("""Rajasthan, located in northwestern India, is a land of majestic palaces, historic forts,and vibrant culture. Visitors are drawn to iconic attractions like the Amber Fort in Jaipur, the intricate carvings of Ranakpur Jain Temple, and the desert city of Jaisalmer with its golden-hued architecture. """,
                                        style: GoogleFonts.niramit(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 280,left: 140),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));
                                    },
                                    child: Text("Explore Now",style: GoogleFonts.niramit(color: Colors.white),)),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("TOP CATEGORY",style: GoogleFonts.niramit(fontWeight: FontWeight.w700,fontSize: 18),),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: TOPCATEGORYModel.length,

                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 140,
                              width: 250,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(TOPCATEGORYModel[index]['image'])),


                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Text(TOPCATEGORYModel[index]['place'],style: GoogleFonts.marcellusSc(fontSize: 16,fontWeight: FontWeight.w400,),),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(TOPCATEGORYModel[index]['about'],

                                        style: GoogleFonts.niramit(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 280,left: 140),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child:InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TOPCATEGORYModel[index]['navigator'])) ;
                                    },
                                    child: Text("Explore Now",style: GoogleFonts.niramit(color: Colors.white),)),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("ADVENTURES",style: GoogleFonts.niramit(fontWeight: FontWeight.w700,fontSize: 18),),
              ),
              SizedBox(
                height: 350,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 140,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 120),
                              child: Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Text("RAJAtSTHAN",style: GoogleFonts.marcellusSc(fontSize: 16,fontWeight: FontWeight.w400,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("""Rajasthan, located in northwestern India, is a land of majestic palaces, historic forts,and vibrant culture. Visitors are drawn to iconic attractions like the Amber Fort in Jaipur, the intricate carvings of Ranakpur Jain Temple, and the desert city of Jaisalmer with its golden-hued architecture. """,
                                        style: GoogleFonts.niramit(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 280,left: 140),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                child: Text("Explore Now",style: GoogleFonts.niramit(color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
