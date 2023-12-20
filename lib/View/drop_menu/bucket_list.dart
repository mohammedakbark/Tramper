import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tramber/View/home.dart';
import 'package:tramber/View/profile/profile.dart';

import 'add_place.dart';

class bucket_list extends StatefulWidget {
  const bucket_list({super.key});

  @override
  State<bucket_list> createState() => _bucket_listState();
}

class _bucket_listState extends State<bucket_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
           
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
                                        builder: (context) => home()));
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
                                          builder: (context) => AddPlace()));
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
                                          builder: (context) => AddPlace()));
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
                        padding: const EdgeInsets.only(left: 125, top: 10),
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
                        padding: const EdgeInsets.only(left: 345, top: 10),
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
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("asset/img_5.png"))),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 738,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "asset/img_7.png",
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "BUCKET LIST",
                      style: GoogleFonts.marcellusSc(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    height: 685,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: 200,
                              color: Colors.cyan,
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
