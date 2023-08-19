import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatelessWidget {
  final String title, description;
  const Description(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Description')),
        body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Items',
                          style: GoogleFonts.rajdhani(
                            textStyle: TextStyle(
                                color: Color(0xffF5F5F5),
                                //fontWeight: FontWeight.bold,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                  child: Text(
                    title,
                    style: GoogleFonts.rajdhani(
                      textStyle: TextStyle(
                        fontSize: 32.0,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Description',
                          style: GoogleFonts.rajdhani(
                            textStyle: TextStyle(
                                color: Color(0xffF5F5F5),
                                //fontWeight: FontWeight.bold,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                  child: Text(
                    description,
                    style: GoogleFonts.rajdhani(
                      textStyle: TextStyle(
                        fontSize: 32.0,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
