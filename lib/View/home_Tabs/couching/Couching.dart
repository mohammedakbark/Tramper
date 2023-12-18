import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tramber/View/home_Tabs/couching/tabs/Females.dart';
import 'package:tramber/View/home_Tabs/couching/tabs/Males.dart';
import 'package:tramber/View/home_Tabs/couching/tabs/Top%20Rated.dart';
import 'package:tramber/View/home_Tabs/couching/tabs/verified.dart';



class Couching extends StatefulWidget {
  const Couching({super.key});

  @override
  State<Couching> createState() => _CouchingState();
}

class _CouchingState extends State<Couching> {
  List<Map<String,dynamic>>items=[
    {
      'name':'Verified',
      'icon':Icons.verified_user_outlined


    },{
      'name':'Top Rated',

    },{
      'name':'Females',
      'icon':Icons.female
    },
    {
      'name':'Male',
      'icon':Icons.male
    },
  ];
  List<Widget> pages=[
    verified(),
    Top_rated(),
    Females(),
    Males(),



  ];
  var current =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            GestureDetector(
                                onTap: (){
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child:AnimatedContainer(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.all(5),
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: current == index?
                                    HexColor("#055C9D")
                                        :HexColor("#FFFFFF"),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: HexColor("#055C9D")),),
                                  duration:Duration() ,
                                  child: Wrap(
                                    spacing: 25,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8,top: 5,),
                                        child: Text(items[index]['name'],style: GoogleFonts.niramit(color: HexColor("#68BBE3"),fontSize:14 ,fontWeight: FontWeight.bold),),
                                      ),
                                     Padding(
                                       padding: const EdgeInsets.only(top: 4),
                                       child: Icon( items[index]['icon'],),
                                     )

                                    ],
                                  ),
                                )


                            ),

                          ],
                        );
                      }),

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5,
                      right: 5),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(),
                    child:pages[current],
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
