import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled/screens/Navigation_Bar.dart';


class Welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(19, 10, 105, 0.94),
        body: Column(children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            height: 480.0,
            width: 600.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                //set border radius to 50% of square height and width
                image: DecorationImage(
                  image: AssetImage("assets/photo_2022-07-19_12-23-08.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 8,
            height: 0,
          ),
          Column(children: [
            SizedBox(width: 20, height: 10),
            Text("Find the book you ",
                style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.white))
          ]),
          SizedBox(
            width: 3,
            height: 0,
          ),
          Row(
            children: [
              SizedBox(width: 104, height: 0),
              Text("like the most",
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Colors.white))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(children: [
            SizedBox(width: 15, height: 30),
            Text(
              "It’s now easier than ever to search for popular",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white54),
            )
          ]),
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "books worldwide just open the prebook app,",
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white54),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Text("and you’re ready to read the book.",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white54))
            ],
          ),
          SizedBox(
            width: 100,
            height: 0,
          ),
          Row(
            children: [
              SizedBox(
                width: 160,
                height: 0,
              ),
              CircularPercentIndicator(
                  radius: 35,
                  percent: 70 / 100,
                  backgroundColor: Colors.white10,
                  progressColor: Color.fromRGBO(74, 43, 195, 1),
                  lineWidth: 3,
                  center: ElevatedButton(
                      child: const Icon(
                        Icons.east_outlined,
                        color: Colors.white70,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        fixedSize: Size(50, 50),
                        primary: Color.fromRGBO(74, 43, 195, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyNavigationBar()));
                      })),
            ],
          )
        ]));
  }
}
