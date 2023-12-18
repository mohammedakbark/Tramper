import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
class about2 extends StatefulWidget {
  const about2({super.key});

  @override
  State<about2> createState() => _about2State();
}

class _about2State extends State<about2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Female",style: GoogleFonts.niramit(fontWeight: FontWeight.w400,fontSize: 20),),
              Text("Hosting spinster",style: GoogleFonts.niramit(fontWeight: FontWeight.w400,fontSize: 20),),
              Text("Place: Kerala",style: GoogleFonts.niramit(fontWeight: FontWeight.w400,fontSize: 20),),
              Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 30),
                child: Container(
                  height: MediaQuery.of(context).size.height/7.5,
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
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/4.6,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [Colors.indigo,Colors.white])
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height/25,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: HexColor("#055C9D")
                      ),
                      child: Text("Reviews and Feedback",style: GoogleFonts.niramit(color: HexColor("#68BBE3"),fontSize: 14,fontWeight: FontWeight.w700),),
                    ),
                  ],
                ),

              )

            ],
          ),
        ),
      ),
    );
  }
}
