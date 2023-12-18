import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tramber/View/drop_menu/add_place.dart';
import 'package:tramber/View/drop_menu/bucket_list.dart';
import 'package:tramber/View/home.dart';
import 'package:tramber/View/profile/tabs/about.dart';
import 'package:tramber/View/profile/tabs/contact.dart';
import 'package:tramber/View/profile/tabs/hosting.dart';
import 'package:tramber/View/profile/update_profile.dart';
import 'package:tramber/utils/variables.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  int current = 0;
  // List of tab bar items

  List<Map<String, dynamic>> items = [
    {
      'name': 'About',
    },
    {
      'name': 'Hosting details',
    },
    {
      'name': 'Contact',
    },
  ];
  List<Widget> pages = [
    about(),
    Hosting(),
    contact(),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    height: 290,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/img_6.png"))),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 335, top: 50),
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
                                          builder: (context) => bucket_list()));
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
                                            builder: (context) => add_place()));
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
                                            builder: (context) => home()));
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
                          padding: const EdgeInsets.only(left: 80, top: 60),
                          child: Text(
                            "Tramper",
                            style: GoogleFonts.marcellusSc(
                                fontSize: 68, color: HexColor("#0080FF")),
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 145, top: 200),
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("asset/img_5.png")),
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.cyan),
                  ),
                )
              ],
            ),
            Text(
              "Jennifer",
              style: GoogleFonts.niramit(
                  fontSize: 28, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
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
                            child: AnimatedContainer(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(5),
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? HexColor("#055C9D")
                                    : HexColor("#FFFFFF"),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: HexColor("#055C9D")),
                              ),
                              duration: Duration(),
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 5),
                                    child: Text(
                                      items[index]['name'],
                                      style: GoogleFonts.niramit(
                                          color: HexColor("#68BBE3"),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(),
              child: pages[current],
            ),
            const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => update_profile()));
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        size: 24,
                      ),
                      title: Text(
                        "Update Profile",
                        style: GoogleFonts.roboto(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 21,
                      ),
                    ),
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.settings,
                        size: 24,
                      ),
                      title: Text(
                        "Settings",
                        style: GoogleFonts.roboto(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 21,
                      )),
                  InkWell(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) => Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  auth.signOut(context);
                                },
                                child: Text("Log out?"),
                              ),
                            )),
                    child: ListTile(
                        leading: const Icon(
                          Icons.logout,
                          size: 24,
                        ),
                        title: Text(
                          "Log out",
                          style: GoogleFonts.roboto(
                              fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 21,
                        )),
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
