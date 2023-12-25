import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tramber/utils/image.dart';

class ReviewAndFeedback extends StatelessWidget {
  const ReviewAndFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Review & Feedback",
          style: GoogleFonts.poppins(fontSize: 30),
        ),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: ListView.builder(
          itemBuilder: (context, index) {
            // return Container(
            //   margin: EdgeInsets.all(20),
            //   height: height * .2,
            //   width: width,
            //   child: Row(
            //     children: [
            //       Container(
            //         color: Colors.amber,
            //         height: height * .15,
            //         width: width / 2,
            //       ),
            //       Column(
            //         children: [
            //           Text("username"),
            //           SizedBox(
            //               height: height * .10,
            //               width: height * .10,
            //               child: Image(
            //                 image: imageNotFound,
            //                 fit: BoxFit.fill,
            //               )),
            //         ],
            //       )
            //     ],
            //   ),
            // );
            return ListTile(
              title: Container(
                color: Colors.amber,
                height: height * .15,
                width: width / 2,
                child: Text("message"),
              ),
              trailing: Text("${TimeOfDay.now()}"),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
