import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tramber/View/modules/user/Category.dart';
import 'package:tramber/View/modules/user/TramModel.dart';
import 'package:tramber/View/modules/user/attractionpage/placepage.dart';
import 'package:tramber/ViewModel/firestore.dart';

class Destinations extends StatefulWidget {
  Destinations({super.key, required});

  @override
  State<Destinations> createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Firestore>(builder: (context, firestore, child) {
        final family = firestore.familyDestinationList;
        final topCatergory = firestore.topCategoryList;
        final adventureList = firestore.adventuresList;
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text("CATEGORY",style: GoogleFonts.niramit(fontWeight: FontWeight.w700,fontSize: 18),),
                // ),
                // SizedBox(
                //   height: 350,
                //   child: ListView.builder(

                //       scrollDirection: Axis.horizontal,

                //       itemBuilder: (context,index){
                //         return Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Stack(
                //             children: [
                //               Container(
                //                 height: 140,
                //                 width: 250,
                //                 decoration: BoxDecoration(
                //                     color: Colors.cyan,
                //                     borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                //                 ),

                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 120),
                //                 child: Container(
                //                   height: 200,
                //                   width: 250,
                //                   decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(22),
                //                       border: Border.all(color: Colors.black)
                //                   ),
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Padding(
                //                         padding: const EdgeInsets.only(left: 10,top: 10),
                //                         child: Text("RAJAtSTHAN",style: GoogleFonts.marcellusSc(fontSize: 16,fontWeight: FontWeight.w400,),),
                //                       ),
                //                       Padding(
                //                         padding: const EdgeInsets.only(left: 5),
                //                         child: Text("""Rajasthan, located in northwestern India, is a land of majestic palaces, historic forts,and vibrant culture. Visitors are drawn to iconic attractions like the Amber Fort in Jaipur, the intricate carvings of Ranakpur Jain Temple, and the desert city of Jaisalmer with its golden-hued architecture. """,
                //                           style: GoogleFonts.niramit(fontSize: 12),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(top: 280,left: 140),
                //                 child: Container(
                //                   alignment: Alignment.center,
                //                   height: 30,
                //                   width: 100,
                //                   decoration: BoxDecoration(
                //                       color: Colors.blue,
                //                       borderRadius: BorderRadius.circular(100)
                //                   ),
                //                   child: Text("Explore Now",style: GoogleFonts.niramit(color: Colors.white),),
                //                 ),
                //               )
                //             ],
                //           ),
                //         );
                //       }),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "FAMILY DESTINATIONS",
                    style: GoogleFonts.niramit(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                      itemCount: family.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 140,
                                width: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            NetworkImage(family[index].image)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: Container(
                                  height: 200,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Text(
                                          family[index].location,
                                          style: GoogleFonts.marcellusSc(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          family[index].description,
                                          style:
                                              GoogleFonts.niramit(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 280, left: 140),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PlaceMainPage(
                                                      Place: family[index]
                                                          .location,
                                                      placeId:
                                                          "${family[index].placeID}",
                                                      image:
                                                          "${family[index].image}",
                                                      description: family[index]
                                                          .description,
                                                    )));
                                      },
                                      child: Text(
                                        "Explore Now",
                                        style: GoogleFonts.niramit(
                                            color: Colors.white),
                                      )),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "TOP CATEGORY",
                    style: GoogleFonts.niramit(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: topCatergory.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 140,
                                width: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            topCatergory[index].image)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: Container(
                                  height: 200,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Text(
                                          topCatergory[index].location,
                                          style: GoogleFonts.marcellusSc(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          topCatergory[index].description,
                                          style:
                                              GoogleFonts.niramit(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 280, left: 140),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PlaceMainPage(
                                                    description:
                                                        topCatergory[index]
                                                            .description,
                                                    Place: topCatergory[index]
                                                        .location,
                                                    placeId:
                                                        "${topCatergory[index].placeID}",
                                                    image:
                                                        "${topCatergory[index].image}")));
                                      },
                                      child: Text(
                                        "Explore Now",
                                        style: GoogleFonts.niramit(
                                            color: Colors.white),
                                      )),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ADVENTURES",
                    style: GoogleFonts.niramit(
                        fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 350,
                  child: ListView.builder(
                      itemCount: adventureList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              Container(
                                height: 140,
                                width: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            adventureList[index].image)),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(22),
                                        topRight: Radius.circular(22))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: Container(
                                  height: 200,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                      border: Border.all(color: Colors.black)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: Text(
                                          adventureList[index].location,
                                          style: GoogleFonts.marcellusSc(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          adventureList[index].description,
                                          style:
                                              GoogleFonts.niramit(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 280, left: 140),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlaceMainPage(
                                                    description:
                                                        adventureList[index]
                                                            .description,
                                                    Place: adventureList[index]
                                                        .location,
                                                    placeId:
                                                        "${adventureList[index].placeID}",
                                                    image:
                                                        "${adventureList[index].image}",
                                                  )));
                                    },
                                    child: Text(
                                      "Explore Now",
                                      style: GoogleFonts.niramit(
                                          color: Colors.white),
                                    ),
                                  ),
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
        );
      }),
    );
  }
}
