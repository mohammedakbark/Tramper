import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tramber/View/modules/user/home_Tabs/destination/beaches.dart';
import 'package:tramber/View/modules/user/home_Tabs/destination/DeCategory.dart';
import 'package:tramber/View/modules/user/TramModel.dart';
import 'package:tramber/View/modules/user/attractionpage/placepage.dart';
import 'package:tramber/View/modules/user/home_Tabs/destination/mountain.dart';
import 'package:tramber/ViewModel/firestore.dart';
import 'package:tramber/utils/image.dart';

class Destinations extends StatefulWidget {
  Destinations({super.key, required});

  @override
  State<Destinations> createState() => _DestinationsState();
}

class _DestinationsState extends State<Destinations> {
  List<Map<String, dynamic>> categoryItems = [
    {
      "Place": "BEACHES",
      "Image": "asset/beaches.jpeg",
      "Description":
          "Beaches are popular destinations for relaxation, water activities, and natural beauty. Coastline with a range of beautiful beaches are Goa, Kovalam, Kanyakumari, Marina beach and so on.",
      "nav": const Beaches()
    },
    {
      "Place": "MOUNTAINs",
      "Image": "asset/mountain.jpeg",
      "Description":
          "Mountains, these towering giants of the Earth, embody nature's grandeur and timelessness. Their rugged peaks, cloaked in blankets of snow or shrouded in ancient forests, stand as stoic sentinels that have witnessed the passage of countless seasons. Each mountain range tells a unique story, etching its own character on the landscape.",
      "nav": const Mountains()
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Firestore>(builder: (context, firestore, child) {
        final allPlaces = firestore.allPlaces;
        // final family = firestore.familyDestinationList;
        // final topCatergory = firestore.topCategoryList;
        // final adventureList = firestore.adventuresList;
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
                      itemCount: allPlaces.length,
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
                                            NetworkImage(allPlaces[index].image)),
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
                                          allPlaces[index].location,
                                          style: GoogleFonts.marcellusSc(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          allPlaces[index].description,
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
                                                      Place: allPlaces[index]
                                                          .location,
                                                      placeId:
                                                          "${allPlaces[index].placeID}",
                                                      image:
                                                          "${allPlaces[index].image}",
                                                      description: allPlaces[index]
                                                          .description,
                                                          lat: allPlaces[index].latitude,
                                                          lon: allPlaces[index].longitude,
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
                      itemCount: categoryItems.length,
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
                                        image: AssetImage(
                                            categoryItems[index]["Image"])),
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
                                          categoryItems[index]["Place"],
                                          style: GoogleFonts.marcellusSc(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          categoryItems[index]["Description"],
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
                                                    categoryItems[index]["nav"]
                                                //  PlaceMainPage(
                                                //     description:
                                                //         topCatergory[index]
                                                //             .description,
                                                //     Place: topCatergory[index]
                                                //         .location,
                                                //     placeId:
                                                //         "${topCatergory[index].placeID}",
                                                //     image:
                                                //         "${topCatergory[index].image}")
                                                // DeCategory(
                                                //   image:
                                                //       "assets/noImage.png",
                                                //   about: "ghfvhgdvhvmsjh",
                                                //   name: "jvdjhvjkdh",
                                                //   place: "gvdkvhdfj",
                                                //   star: 3,
                                                // )
                                                ));
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
                      itemCount: categoryItems.length,
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
                                        image: AssetImage(
                                            categoryItems[index]["Image"])),
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
                                          categoryItems[index]["Place"],
                                          style: GoogleFonts.marcellusSc(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          categoryItems[index]["Description"],
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
                                                  // PlaceMainPage(
                                                  //   description:
                                                  //       adventureList[index]
                                                  //           .description,
                                                  //   Place: adventureList[index]
                                                  //       .location,
                                                  //   placeId:
                                                  //       "${adventureList[index].placeID}",
                                                  //   image:
                                                  //       "${adventureList[index].image}",
                                                  // )
                                                  categoryItems[index]["nav"]));
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
