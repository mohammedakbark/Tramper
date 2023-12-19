import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:tramber/Model/user_model.dart';
import 'package:tramber/View/login/sign_up.dart';
import 'package:tramber/ViewModel/firestore.dart';
import 'package:tramber/ViewModel/pick_image.dart';
import 'package:tramber/utils/variables.dart';

class update_profile extends StatefulWidget {
  const update_profile({super.key});

  @override
  State<update_profile> createState() => _update_profileState();
}

class _update_profileState extends State<update_profile> {
  // File? _image1;
  // File? _image2;

  final ImagePicker _picker = ImagePicker();

  // Future<void> _getImage(int imageNumber) async {
  //   final XFile? pickedFile =
  //       await _picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       if (imageNumber == 1) {
  //         _image1 = File(pickedFile.path);
  //       } else {
  //         _image2 = File(pickedFile.path);
  //       }
  //     }
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    var fullname =
        TextEditingController(text: storenstence.userModel?.username);
    // var email = TextEditingController();
    var phoneNumber =
        TextEditingController(text: "${storenstence.userModel?.phonenumber}");
    var gender = TextEditingController(text: storenstence.userModel?.gender);
    var hosting = TextEditingController();
    var age = TextEditingController();
    var address = TextEditingController();
    var message = TextEditingController();
    var area = TextEditingController();
    var city = TextEditingController();
    var piccode = TextEditingController();
    var state = TextEditingController();
    var about = TextEditingController();
    var lebal = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        centerTitle: true,
        title: Text("Edit profile",
            style:
                GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600)),
      ),
      body: Consumer<Firestore>(builder: (context, store, child) {
        return SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.black),
                  ),
                  child: storenstence.userModel?.profileimage != ""
                      ? Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${storenstence.userModel?.profileimage}"),
                                  fit: BoxFit.fill)
                                  ),
                        )
                      : IconButton(
                          onPressed: () {
                            selectImage(context, 1)
                              
                                .then((_) => setState(() {}));
                          },
                          icon: const Icon(Icons.add_a_photo),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 50,
                    width: 320,
                    child: TextField(
                      controller: fullname,
                      decoration: InputDecoration(
                        labelText: "Full name",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: state,
                      decoration: InputDecoration(
                        labelText: "Nick name",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: lebal,
                      decoration: InputDecoration(
                        labelText: "Label",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        labelText: "Phone number",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: SizedBox(
                          height: 50,
                          width: 155,
                          child: TextField(
                            controller: gender,
                            decoration: InputDecoration(
                              labelText: "Gender",
                              border: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                borderSide: new BorderSide(
                                    color:
                                        const Color.fromRGBO(158, 158, 158, 1)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 155,
                        child: TextField(
                          controller: age,
                          decoration: InputDecoration(
                            labelText: "Age",
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: new BorderSide(
                                  color:
                                      const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: address,
                      decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: message,
                      decoration: InputDecoration(
                        labelText: "Message",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: area,
                      decoration: InputDecoration(
                        labelText: "Area",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: city,
                      decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: piccode,
                      decoration: InputDecoration(
                        labelText: "Pincode",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: state,
                      decoration: InputDecoration(
                        labelText: "State",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                          border: Border.all(
                              color: const Color.fromRGBO(158, 158, 158, 1))),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 70, bottom: 20),
                            child: Text(
                              "ID proof (We will not take any credentials )",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: const BoxDecoration(),
                            child: storenstence.userModel?.proofimage != ""
                                ? Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      
                                        image: DecorationImage(
                                            image: NetworkImage(

                                                "${storenstence.userModel?.proofimage}"),
                                            fit: BoxFit.fill)),
                                  )
                                : TextButton(
                                    onPressed: () {
                                      selectImage(context, 2)
                                         
                                              
                                          .then((_) => setState(() {}));
                                    },
                                    child: const Text(
                                      "ADD IMAGE",
                                      style: TextStyle(color: Colors.black),
                                    )),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 110,
                    width: 320,
                    child: TextField(
                      maxLines: 3,
                      controller: about,
                      decoration: InputDecoration(
                        hintText: "About",
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
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
                      controller: hosting,
                      decoration: InputDecoration(
                        labelText: "Hosting Details",
                        hintText:
                            'Tell us about your styles, methods and restrictions',
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          borderSide: new BorderSide(
                              color: const Color.fromRGBO(158, 158, 158, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    int phone = int.parse(phoneNumber.text);
                    print(imageFileProof);
                    print(currentUID);

                    await store.updateUSerDAta(
                        currentUID,
                        UserModel(
                            email: "${storenstence.userModel?.email}",
                            gender: gender.text,
                            password: "${storenstence.userModel?.email}",
                            phonenumber: phone,
                            profileimage: "${storenstence.userModel?.profileimage}" ,
                            proofimage: "${storenstence.userModel?.proofimage}",
                            userID: "${storenstence.userModel?.email}",
                            username: fullname.text),
                        context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.cyan),
                      child: Text(
                        "SUBMIT",
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
