import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserve/about.dart';
import 'package:reserve/auth/ngoAuth.dart';
import 'package:reserve/auth/userAuth.dart';
import 'package:reserve/chatbot.dart';
import 'package:reserve/dashboard.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            "assets/i4.jpeg",
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              //backgroundColor: Colors.grey.shade800,
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 45, 0, 90),
                    child: Text(
                      "ReServe",
                      style: GoogleFonts.sahitya(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/donation2.png",
                                  height: 130,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(UserAuth());
                                },
                                icon: Icon(Icons.keyboard_arrow_right_sharp),
                                label: Text(
                                  "Donate",
                                  style: GoogleFonts.rajdhani(
                                      textStyle: TextStyle(fontSize: 25)),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(170, 50),
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/receive1.png',
                                  width: 150,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(NGOAuth());
                                },
                                icon: Icon(Icons.keyboard_arrow_right_sharp),
                                label: Text(
                                  "Receive",
                                  style: GoogleFonts.rajdhani(
                                      textStyle: TextStyle(fontSize: 25)),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(170, 50),
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 150, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/d.jpeg',
                                  width: 150,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(HomeScreen());
                                },
                                icon: Icon(Icons.keyboard_arrow_right_sharp),
                                label: Text(
                                  "Dashboard",
                                  style: GoogleFonts.rajdhani(
                                      textStyle: TextStyle(fontSize: 23)),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(170, 50),
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 150, 0, 0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/about.jpeg",
                                  height: 125,
                                  width: 100,
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(About());
                                },
                                icon: Icon(Icons.keyboard_arrow_right_sharp),
                                label: Text(
                                  "About",
                                  style: GoogleFonts.rajdhani(
                                      textStyle: TextStyle(fontSize: 25)),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(170, 50),
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
