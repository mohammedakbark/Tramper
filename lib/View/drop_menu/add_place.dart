// import 'dart:html';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tramber/View/home.dart';
import 'package:tramber/View/profile/profile.dart';


class add_place extends StatefulWidget {
  const add_place({super.key});

  @override
  State<add_place> createState() => _add_placeState();
}

class _add_placeState extends State<add_place> {
  var text=TextEditingController();

  File? _image1;


  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    try{final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image1 = File(pickedFile!.path);

    });}catch(e){print(e);}

  }
  var selection;
  List main=[
   'About',
    'Hosting details',
    'Contact'
  ];
  List sampleList = [
    'CATEGORY',
    'FAMILY DESTINATION',
    'TOP CATEGORY',
    'ADVENTURES',

  ];
  // File? _image;
  // final picker=ImagePicker();
  // Future ChoiceImage() async{
  //   final pickedImage=await picker.pickImage(source:ImageSource.gallery);
  //   setState(() {
  //     // _image = File(pickedImage!.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter,
            end:Alignment.bottomCenter ,

            colors: [Colors.blue.shade100.withOpacity(0.4),Colors.blue.shade300],)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 335),
                          child:

                          PopupMenuButton(
                            icon: Icon(CupertinoIcons.list_dash),  //don't specify icon if you want 3 dot menu
                            color:  HexColor("#055C9D"),
                            itemBuilder: (context) => [
                              PopupMenuItem<int>(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));

                                },
                                value: 0,
                                child: Text("Home",style: GoogleFonts.niramit(color: Colors.white,fontSize: 16,),),
                              ),
                              PopupMenuItem<int>(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));

                                },
                                value: 1, child: Row(
                                children: [
                                  Text("Bucket List    ",style: GoogleFonts.niramit(color: Colors.white,fontSize: 16,),),
                                  Icon(CupertinoIcons.bookmark,color: Colors.white,size: 18,)
                                ],
                              ),
                              ),
                              PopupMenuItem<int>(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>add_place()));

                                  },
                                  value: 2,
                                  child: Text("Add a Place",style: GoogleFonts.niramit(color: Colors.white,fontSize: 16,),)
                              ),
                              PopupMenuItem<int>(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));

                                  },
                                  value: 3,
                                  child: Text("Help",style: GoogleFonts.niramit(color: Colors.white,fontSize: 16,),)
                              ),
                            ],
                            onSelected: (item) => {print(item)},
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 125,top: 10),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.placemark,size: 16,),
                              Text("Bangalore",style: GoogleFonts.niramit(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                              Text(","),
                              Text("India",style: GoogleFonts.niramit(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 345,top: 10),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("asset/img_5.png")
                                  )
                              ),
                            ),
                          ),
                        )


                      ],
                    )


                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 10),
                child: Container(

                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: DropdownButtonHideUnderline(
                        child: ButtonTheme(
                            alignedDropdown: true,
                            child:DropdownButton(
                                isExpanded: true,
                                isDense: true,
                                value: selection,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.brown,
                                ),
                                iconSize: 40,
                                underline: Container(
                                  height: 1,
                                  color: Colors.transparent,
                                ),
                                onChanged: ( val) => setState(() => selection = val),
                                items: sampleList.map((option) {
                                  return DropdownMenuItem(
                                    value: option,
                                    child: Container(
                                        width:double.infinity,
                                        alignment:Alignment.centerLeft,

                                        child:Text(option,style:TextStyle(color:Colors.black),),
                                        decoration:BoxDecoration(
                                            border:Border(top:BorderSide(color:Colors.grey,width:1))
                                        )
                                    ),
                                  );
                                }).toList(),
                                hint: Text("CATEGORY",style: GoogleFonts.niramit(color: Colors.grey),),
                                selectedItemBuilder:(con){
                                  return sampleList.map((m){
                                    return Text(m,style: TextStyle(color: Colors.blue),);
                                  }).toList();
                                }
                            )
                        ),
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height/4.8,
                  width: MediaQuery.of(context).size.width/1.13,
                  decoration: BoxDecoration( color: _image1 ==null?Color.fromRGBO(104, 187, 227, 0.5):
                       Colors.transparent,
                      image: DecorationImage(  image:_image1 !=null? FileImage(_image1!):AssetImage('asset/images.jpeg') as ImageProvider<Object>,fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                  color: Colors.black,style: BorderStyle.solid),

                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: InkWell(
                      onTap: (){
                        _getImage();
                      },
                      child: Row(
                        children: [

                          Icon(Icons.add_photo_alternate_outlined),
                          Text("ADD IMAGE"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Container(
              //   height:MediaQuery.of(context).size.height/3.8,
              //   width: MediaQuery.of(context).size.width/1.13,
              //   decoration: BoxDecoration(
              //     color: Colors.cyan,
              //     borderRadius: BorderRadius.circular(12)
              //   ),
              //
              // )
              SizedBox(
                height: MediaQuery.of(context).size.height/4.8,
                width: MediaQuery.of(context).size.width/1.13,
                child: TextField(
                  maxLines: 7,

                  controller: text,
                  decoration: InputDecoration(

                    hintText: "Tell us something about this place",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: new BorderSide(color: Color.fromRGBO(5, 92, 157, 0)),
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,right: 190,bottom: 20),
                child: Container(
                  alignment: Alignment.center,
                  height:  MediaQuery.of(context).size.height/27,
                  width:  MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                  color: HexColor("#0E86D4")),

                  child: Text("GET CURRENT LOCATION",style: GoogleFonts.habibi(fontSize: 10,color: Colors.white),),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height:  MediaQuery.of(context).size.height/27,
                width:  MediaQuery.of(context).size.width/3.5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                    color: HexColor("#0E86D4")),

                child: Text("SEND",style: GoogleFonts.habibi(fontSize: 10,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  alignment: Alignment.topLeft,
                  height:  MediaQuery.of(context).size.height/4,
                  width:  MediaQuery.of(context).size.width,

                  decoration: BoxDecoration(color: Colors.blue.shade100.withOpacity(0.9)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Once again, thank you for your dedication to making our travel experiences more enjoyable and memorable. Your efforts are greatly appreciated, and I look forward to seeing more exciting additions in the future."),
                        Text("TRAMPER",style: GoogleFonts.niramit(fontSize: 18,fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                ),
              )



      ]

          ),
        ),
      ),

    );
  }
}
