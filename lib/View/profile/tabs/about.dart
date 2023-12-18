import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 110,
        width: double.infinity,
         decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:[
      Color.fromRGBO(0, 71, 255, 0.28),
        Color.fromRGBO(192, 194, 244, 0.16),
        Color.fromRGBO(255, 255, 255, 0),


        ]),
      border: Border.all(color: HexColor("#055C9D"))
      ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("""Hello, I'm Jenifer, a passionate traveler always in pursuit of new horizons. I find joy in immersing myself in diverse cultures, savoring local cuisines, and collecting stories from every corner of the globe.Also i would like to host Trampers with immense pleasure wich allows us to share a cultural bond.""",style: GoogleFonts.niramit(fontSize: 12),),
        ),
      ),
    );
  }
}
