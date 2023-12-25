import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tramber/View/modules/admin/place/add_place.dart';
import 'package:tramber/View/modules/admin/place/placelist.dart';
import 'package:tramber/View/modules/admin/reviw_and_feedback.dart';
import 'package:tramber/ViewModel/firestore.dart';
import 'package:tramber/utils/image.dart';

class HomePageAdmin extends StatelessWidget {
  const HomePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Firestore>(context, listen: false).fetchAllUSer();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              color: const Color.fromARGB(255, 94, 81, 76),
              width: width / 2,
              height: height * .3,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: imageNotFound,
                        ),
                      ),
                      Text(
                        "Addmin",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        "admin@gmail.com",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ]),
              ),
            ),
            ListTile(
              title: Text(
                "Add Location",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPlace()));
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Explore Locations",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlaceListPage()));
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            ListTile(
              title: Text(
                "Review & Feedback",
                style: GoogleFonts.poppins(fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewAndFeedback()));
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TRAMBER",
          style: GoogleFonts.poppins(fontSize: 30),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer<Firestore>(builder: (context, firestore, child) {
          final list = firestore.hosterAllList;
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: SizedBox(
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                      backgroundImage: list[index].profileimage == ""
                          ? imageNotFound
                          : NetworkImage(
                              list[index].profileimage,
                            ),
                    ),
                  ),
                  title: Text(list[index].username),
                  subtitle: const Text("user or hoster"),
                  trailing: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {},
                    child: const Text(
                      "Remove",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length);
        }),
      ),
      // body: ,
    );
  }
}
