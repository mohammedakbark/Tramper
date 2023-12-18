import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tramber/View/hosting/HosterProfile.dart';

class Males extends StatefulWidget {
  const Males({super.key});

  @override
  State<Males> createState() => _MalesState();
}

class _MalesState extends State<Males> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          crossAxisSpacing: 7,
          mainAxisSpacing: 20,
          crossAxisCount: 2),
          itemCount: 6,


          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HosterProfile()));
              },
              child: Container(

                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/2,

                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)

                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(

                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height/17,
                            width: MediaQuery.of(context).size.width/8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(image: AssetImage("asset/img_8.png"),fit: BoxFit.fill),
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Anupriya",style: GoogleFonts.niramit(fontSize: 17),),
                                Row(
                                  children: [
                                    Icon(LineIcons.phone),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5,right: 5),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("Female",style: GoogleFonts.roboto(fontSize: 12),),
                      ),
                      Text("Hosting spinster",style: GoogleFonts.roboto(fontSize: 12),),
                      Text("Place: Jaipur",style: GoogleFonts.roboto(fontSize: 12),),
                      Text("""My name is Anupriya, and I am pleased to have the opportunity to host.""",style: GoogleFonts.roboto(fontSize: 11),),


                    ],
                  ),
                ),
              ),
            );

          }),
    );
  }
}
