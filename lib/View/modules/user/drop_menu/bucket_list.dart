import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:tramber/View/modules/user/home.dart';
import 'package:tramber/View/modules/user/profile/profile.dart';
import 'package:tramber/ViewModel/firestore.dart';
import 'package:tramber/ViewModel/get_locatiion.dart';
import 'package:tramber/utils/image.dart';

class BucketList extends StatefulWidget {
  const BucketList({super.key});

  @override
  State<BucketList> createState() => _BucketListState();
}

class _BucketListState extends State<BucketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: PopupMenuButton(
          icon: const Icon(CupertinoIcons
              .list_dash), //don't specify icon if you want 3 dot menu
          color: HexColor("#055C9D"),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
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
                        builder: (context) => const BucketList()));
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
                  const Icon(
                    CupertinoIcons.bookmark,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
            ),
            // PopupMenuItem<int>(
            //     onTap: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => AddPlace()));
            //     },
            //     value: 2,
            //     child: Text(
            //       "Add a Place",
            //       style: GoogleFonts.niramit(
            //         color: Colors.white,
            //         fontSize: 16,
            //       ),
            //     )),
            PopupMenuItem<int>(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
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
        title: Consumer<LocationPrvider>(builder: (context, locpro, child) {
          return SizedBox(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                CupertinoIcons.placemark,
                size: 16,
              ),
              Text(
                "${locpro.place ?? ""}",
                style: GoogleFonts.niramit(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
              const Text("|"),
              Text(
                "${locpro.country ?? ""}",
                style: GoogleFonts.niramit(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ]),
          );
        }),
        actions: [
          Consumer<Firestore>(builder: (context, firestore, child) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
              child: Container(
                margin: EdgeInsets.only(right: 20),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: firestore.userModel?.profileimage == ""
                            ? imageNotFound
                            : NetworkImage(
                                "${firestore.userModel?.profileimage}"))),
              ),
            );
          })
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 738,
              width: double.infinity,
              decoration:const BoxDecoration(
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
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
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
