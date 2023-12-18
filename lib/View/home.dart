import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tramber/View/drop_menu/add_place.dart';
import 'package:tramber/View/drop_menu/bucket_list.dart';
import 'package:tramber/View/home_Tabs/destination/Destinations.dart';
import 'package:tramber/View/profile/profile.dart';

import 'home_Tabs/couching/Couching.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int current = 0;

  var are = TextEditingController();
  // List of tab bar items

  List<String> texts = [
    "\tDestinations",
    "Couching",
  ];
  List<Widget> tabs2 = [
    Destinations(),
    Couching(),
  ];
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: hight * .3,
                width: width,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("asset/img_2.png"))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120, left: 50),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 18),
                                      child: Text(
                                        texts[index],
                                        style: GoogleFonts.niramit(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: current == index,
                                      child: Container(
                                        height: 2,
                                        width: 70,
                                        color: Colors.black,
                                      )),
                                ],
                              );
                            }),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 180, left: 20),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                height: 40,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(color: Colors.cyan)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 40),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "            Where would you like to go? ",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: HexColor("#055C9D"))),
                              ),
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 335),
                                child: PopupMenuButton(
                                  icon: Icon(CupertinoIcons
                                      .list_dash), //don't specify icon if you want 3 dot menu
                                  color: HexColor("#055C9D"),
                                  itemBuilder: (context) => [
                                    PopupMenuItem<int>(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => home()));
                                      },
                                      value: 0,
                                      child: Text(
                                        "Home",
                                        style: GoogleFonts.niramit(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    PopupMenuItem<int>(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    bucket_list()));
                                      },
                                      value: 1,
                                      child: Row(
                                        children: [
                                          Text(
                                            "Bucket List    ",
                                            style: GoogleFonts.niramit(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Icon(
                                            CupertinoIcons.bookmark,
                                            color: Colors.white,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem<int>(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      add_place()));
                                        },
                                        value: 2,
                                        child: Text(
                                          "Add a Place",
                                          style: GoogleFonts.niramit(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        )),
                                    PopupMenuItem<int>(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      add_place()));
                                        },
                                        value: 3,
                                        child: Text(
                                          "Help",
                                          style: GoogleFonts.niramit(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        )),
                                  ],
                                  onSelected: (item) => {print(item)},
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 125, top: 10),
                                child: Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.placemark,
                                      size: 16,
                                    ),
                                    Text(
                                      "Bangalore",
                                      style: GoogleFonts.niramit(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    ),
                                    Text(","),
                                    Text(
                                      "India",
                                      style: GoogleFonts.niramit(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 345, top: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => profile()));
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image:
                                                AssetImage("asset/img_5.png"))),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hight * .7,
                width: double.infinity,
                child: tabs2[current],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
