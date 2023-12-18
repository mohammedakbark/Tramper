import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Hosting extends StatefulWidget {
  const Hosting({super.key});

  @override
  State<Hosting> createState() => _HostingState();
}

class _HostingState extends State<Hosting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          height: 240,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Color.fromRGBO(104, 187, 227, 0.91)),
            right: BorderSide(color: Color.fromRGBO(104, 187, 227, 0.91),
            ),bottom: BorderSide(color: Color.fromRGBO(104, 187, 227, 0.91)),
            left: BorderSide(color: Colors.transparent)),

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