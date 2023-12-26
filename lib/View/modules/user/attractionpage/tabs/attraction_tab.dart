import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:tramber/ViewModel/controll_provider.dart';
import 'package:tramber/ViewModel/firestore.dart';
import 'package:tramber/utils/image.dart';

class Attraction extends StatelessWidget {
  String image;
  String description;
  String place;
  Attraction(
      {super.key,
      required this.image,
      required this.description,
      required this.place});

  List<Map<String, dynamic>> placesData = [
    {"name": "Amber Fort", "Image": "asset/one.png"},
    {"name": "Mehrangar Fort", "Image": "asset/two.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .27,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * .18,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(image))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                place,
                                style: GoogleFonts.marcellus(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Consumer<Controller>(
                                builder: (context, controller, child) {
                              return IconButton(
                                  onPressed: () {
                                    controller.isplaceSvae();
                                  },
                                  icon: controller.isPlaceSave
                                      ? const Icon(
                                          CupertinoIcons.bookmark_fill,
                                          color: Colors.white,

                                          // size: 18,
                                        )
                                      : const Icon(
                                          CupertinoIcons.bookmark,
                                          color: Colors.black,

                                          // size: 18,
                                        ));
                            })
                          ],
                        ),
                      ),
                    ),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: width / 3.4,
                        height: 30,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.black,
                                ),
                                Text(
                                  "Location",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Popular Places",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
              SizedBox(
                height: height * .25,
                width: width,
                // color: Colors.red,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: placesData.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(placesData[index]["Image"])),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30)),
                    width: width * .45,
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Consumer<Controller>(
                              builder: (context, controller, child) {
                            return IconButton(
                                onPressed: () {
                                  controller.isplaceSvae();
                                },
                                icon: controller.isPlaceSave
                                    ? const Icon(
                                        CupertinoIcons.bookmark_fill,
                                        color: Colors.white,

                                        // size: 18,
                                      )
                                    : const Icon(
                                        CupertinoIcons.bookmark,
                                        color: Colors.black,

                                        // size: 18,
                                      ));
                          }),
                        ),
                        Text(
                          placesData[index]["name"],
                          style: GoogleFonts.marcellus(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Hosts",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
              ),
              Consumer<Firestore>(builder: (context, firestore, child) {
                return SizedBox(
                    height: height * .25,
                    width: width,
                    child: firestore.selctedPlaceHosterList.isEmpty
                        ? Center(
                            child: Text(
                              "Hosters not found in this place...",
                              style: GoogleFonts.poppins(fontSize: 20),
                            ),
                          )
                        : ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                padding: EdgeInsets.all(10),
                                // height: MediaQuery.of(context).size.height / 3.5,
                                // width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(99, 255, 255, 255),
                                    // color: Colors.green,
                                    // border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              17,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            image: DecorationImage(
                                                image: firestore
                                                            .selctedPlaceHosterList[
                                                                index]
                                                            .profileimage ==
                                                        ""
                                                    ? imageNotFound
                                                    : NetworkImage(firestore
                                                        .selctedPlaceHosterList[
                                                            index]
                                                        .profileimage),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .26,
                                                child: Text(
                                                  firestore
                                                      .selctedPlaceHosterList[
                                                          index]
                                                      .username,
                                                  style: GoogleFonts.niramit(
                                                      fontSize: 17),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                              const Row(
                                                children: [
                                                  Icon(LineIcons.phone),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5, right: 5),
                                                    child: Icon(LineIcons
                                                        .alternateComment),
                                                  ),
                                                  Icon(Icons
                                                      .mail_outline_outlined),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      firestore.selctedPlaceHosterList[index]
                                                  .gender ==
                                              ""
                                          ? "..."
                                          : firestore
                                              .selctedPlaceHosterList[index]
                                              .gender,
                                      style: GoogleFonts.roboto(fontSize: 12),
                                    ),
                                    Text(
                                      firestore.selctedPlaceHosterList[index]
                                                  .hostingDetails ==
                                              ""
                                          ? "..."
                                          : firestore
                                              .selctedPlaceHosterList[index]
                                              .hostingDetails,
                                      style: GoogleFonts.roboto(fontSize: 12),
                                    ),
                                    Text(
                                      firestore.selctedPlaceHosterList[index]
                                                  .city ==
                                              ""
                                          ? "..."
                                          : firestore
                                              .selctedPlaceHosterList[index]
                                              .city,
                                      style: GoogleFonts.roboto(fontSize: 12),
                                    ),
                                    Text(
                                      firestore.selctedPlaceHosterList[index]
                                                  .about ==
                                              ""
                                          ? "..."
                                          : firestore
                                              .selctedPlaceHosterList[index]
                                              .about,
                                      style: GoogleFonts.roboto(fontSize: 11),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                            itemCount:
                                firestore.selctedPlaceHosterList.length));
              }),
              //   return Text(firestore.selctedPlaceHosterList[1].gender) ??
              //       Text("bnod");
              // }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
