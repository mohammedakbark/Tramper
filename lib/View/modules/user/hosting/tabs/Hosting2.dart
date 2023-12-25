import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class Hosting2 extends StatefulWidget {
  const Hosting2({super.key});

  @override
  State<Hosting2> createState() => _Hosting2State();
}

class _Hosting2State extends State<Hosting2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 240,
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(12),
            border: Border.all(color: HexColor("#68BBE3")),

          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 30,bottom: 30),
            child: Text("""Hey, I have always been eager to host people around to get
more cultural exposture. I have always created a certain 
parameters for hosting such as

*Hosting Families
*Hosting Women
*No Beverages or Alcohol allowed

If your ok with these feel free to contact with me. We can 
surely have a healthy time.
  """,style: GoogleFonts.niramit(fontSize: 12),),
          ),
        ),
      ),
    );
  }
}