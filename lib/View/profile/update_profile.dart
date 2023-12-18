import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class update_profile extends StatefulWidget {
  const update_profile({super.key});

  @override
  State<update_profile> createState() => _update_profileState();
}

class _update_profileState extends State<update_profile> {
  File? _image1;
  File? _image2;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(int imageNumber) async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        if (imageNumber == 1) {
          _image1 = File(pickedFile.path);
        } else {
          _image2 = File(pickedFile.path);
        }
      }
    });
  }

  var text1=TextEditingController();
  var text2=TextEditingController();
  var text3=TextEditingController();
  var text4=TextEditingController();
  var text5=TextEditingController();
  var text6=TextEditingController();
  var text7=TextEditingController();
  var text8=TextEditingController();
  var text9=TextEditingController();
  var text10=TextEditingController();
  var text11=TextEditingController();
  var text12=TextEditingController();
  var text14=TextEditingController();
  var text15=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( onPressed: () {
          Navigator.pop(context);
        }, icon:const Icon(Icons.arrow_back,) ),

        centerTitle: true ,
        title: Text("Edit profile",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w600)),

      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Container(


                child: (_image1 != null) ?Container(height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),

                      border: Border.all(color: Colors.black),
                      image: DecorationImage(image: FileImage(_image1!,),fit: BoxFit.fill)
                  ),):
                IconButton(
                  onPressed: () {
                    _getImage(1);
                  },

                  icon: const Icon(Icons.add_a_photo),
                ),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),

                  border: Border.all(color: Colors.black),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text1,
                    decoration: InputDecoration(

                      labelText: "Full name",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text2,
                    decoration: InputDecoration(

                      labelText: "Nick name",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text3,
                    decoration: InputDecoration(

                      labelText: "Label",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text4,
                    decoration: InputDecoration(

                      labelText: "Phone number",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35,top: 20),
                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10,),
                      child: SizedBox(
                        height: 50,
                        width: 155,
                        child: TextField(

                          controller: text5,
                          decoration: InputDecoration(

                            labelText: "Genre",
                            border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                              borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                            ),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 155,
                      child: TextField(

                        controller: text6,
                        decoration: InputDecoration(

                          labelText: "Age",
                          border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                            borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 110,
                  width: 320,
                  child: TextField(

                    maxLines: 3,

                    controller: text7,
                    decoration: InputDecoration(

                      labelText: "Address",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text8,
                    decoration: InputDecoration(

                      labelText: "Message",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text9,
                    decoration: InputDecoration(

                      labelText: "Area",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text10,
                    decoration: InputDecoration(

                      labelText: "City",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text11,
                    decoration: InputDecoration(

                      labelText: "Pincode",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  width: 320,
                  child: TextField(

                    controller: text12,
                    decoration: InputDecoration(

                      labelText: "State",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 110,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color.fromRGBO(158, 158, 158, 1))
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 70,bottom: 20),
                          child: Text("ID proof (We will not take any credentials )",style: TextStyle(fontSize: 12),),
                        ),
                        Container(child: (_image2 != null) ?Container(height: 50,
                          width: 100,

                          decoration: BoxDecoration(



                              image: DecorationImage(image: FileImage(_image2!,),fit: BoxFit.fill)
                          ),):
                        TextButton(onPressed: (){_getImage(2);}, child: const Text("ADD IMAGE",style: TextStyle(color:Colors.black ),)),

                          height: 50,
                          width: 100,
                          decoration: const BoxDecoration(



                          ),),
                      ],
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 110,
                  width: 320,
                  child: TextField(
                    maxLines: 3,

                    controller: text14,
                    decoration: InputDecoration(

                      hintText: "About",
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 110,
                  width: 320,
                  child: TextField(
                    maxLines: 3,

                    controller: text15,
                    decoration: InputDecoration(


                      labelText: "Hosting Details",
                      hintText: 'Tell us about your styles, methods and restrictions',
                      border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(10)),
                        borderSide: new BorderSide(color: const Color.fromRGBO(158, 158, 158, 1)),
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 20),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan
                  ),
                  child: Text("SUBMIT",style: GoogleFonts.roboto(fontSize: 16,fontWeight: FontWeight.w500),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
