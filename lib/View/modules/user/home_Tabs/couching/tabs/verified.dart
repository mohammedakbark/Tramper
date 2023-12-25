import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:tramber/View/modules/user/hosting/HosterProfile.dart';
import 'package:tramber/ViewModel/firestore.dart';
import 'package:tramber/utils/image.dart';

class verified extends StatefulWidget {
  const verified({super.key});

  @override
  State<verified> createState() => _verifiedState();
}

class _verifiedState extends State<verified> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Firestore>(builder: (context, storepro, child) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.9, crossAxisCount: 2),
          itemCount: storepro.hosterAllList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HosterProfile()));
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                // height: MediaQuery.of(context).size.height / 3.5,
                // width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    // color: Colors.green,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 17,
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: storepro.hosterAllList[index]
                                            .profileimage ==
                                        null
                                    ? imageNotFound
                                    : NetworkImage(storepro
                                        .hosterAllList[index].profileimage),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .26,
                                child: Text(
                                  storepro.hosterAllList[index].username,
                                  style: GoogleFonts.niramit(fontSize: 17),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const Row(
                                children: [
                                  Icon(LineIcons.phone),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, right: 5),
                                    child: Icon(LineIcons.alternateComment),
                                  ),
                                  Icon(Icons.mail_outline_outlined),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      storepro.hosterAllList[index].gender == ""
                          ? "..."
                          : storepro.hosterAllList[index].gender,
                      style: GoogleFonts.roboto(fontSize: 12),
                    ),
                    Text(
                      storepro.hosterAllList[index].hostingDetails == ""
                          ? "..."
                          : storepro.hosterAllList[index].hostingDetails,
                      style: GoogleFonts.roboto(fontSize: 12),
                    ),
                    Text(
                      storepro.hosterAllList[index].city == ""
                          ? "..."
                          : storepro.hosterAllList[index].city,
                      style: GoogleFonts.roboto(fontSize: 12),
                    ),
                    Text(
                      storepro.hosterAllList[index].about == ""
                          ? "..."
                          : storepro.hosterAllList[index].about,
                      style: GoogleFonts.roboto(fontSize: 11),
                    )
                  ],
                ),
              ),
            );
          });
    });
  }
}
