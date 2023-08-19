import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Custom extends StatelessWidget {
  Custom({
    required this.answer,
    required this.videoLink,
    required this.question,
    required this.customRaisedButton,
    required this.isVisible,
    required this.img,
  });

  String videoLink;
  String question;
  String answer;
  bool isVisible;
  Widget customRaisedButton;
  String img;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        color: Color(0xffFFD700),
        elevation: 20,
        shadowColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: ExpansionTileCard(
          baseColor: Colors.black,
          expandedColor: Colors.black,
          expandedTextColor: Colors.white,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 35,
            child: Image.network(
              img,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          //elevation: 20,
          shadowColor: Colors.white,
          title: Text(
            question,
            style: TextStyle(color: Color(0xffFFD700)),
          ),
          children: [
            Divider(thickness: 1),
            ListTile(
              leading: ElevatedButton.icon(
                icon: Icon(Icons.web, color: Colors.black),
                label: const Text("Website"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  textStyle: GoogleFonts.rajdhani(
                      textStyle: TextStyle(fontSize: 15),
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide()),
                ),
                onPressed: () {
                  _launchInBrowser(Uri.parse(videoLink));
                },
              ),
              trailing: customRaisedButton,
            ),
            Divider(thickness: 1),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  answer,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.rajdhani(
                      textStyle: TextStyle(fontSize: 16, color: Colors.white),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
