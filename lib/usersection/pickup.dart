import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'locationdata.dart';
import 'dart:math';

class Pickup extends StatefulWidget {
  const Pickup({Key? key}) : super(key: key);

  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  bool loading = false;
  bool showWidget = false;

  bool jhol = false;

  String number() {
    // Define the length of the alphanumeric string
    int length = 10;

    // Define the list of characters to choose from
    String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';

    // Create a new random number generator
    var rng = new Random();

    // Generate the random alphanumeric string
    String randomString = '';
    for (int i = 0; i < length; i++) {
      randomString += chars[rng.nextInt(chars.length)];
    }

    // Print the random alphanumeric string
    String a = randomString;
    return a;
  }

  @override
  Widget build(BuildContext context) {
    addtasktofirebase() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      final User user = await auth.currentUser!;
      print(user.email);
      String uid = user.uid;
      var time = DateTime.now();
      await FirebaseFirestore.instance
          .collection('locationRelated')
          .doc(uid)
          .collection('locationDetails')
          .doc(time.toString())
          .set({
        'latitude': '19.7094968',
        'longitude': '72.7924497',
      });
      Fluttertoast.showToast(msg: 'Data Added');
    }

    return SafeArea(
        child: Material(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 20.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                //controller: descriptionController,
                enabled: false,
                decoration: InputDecoration(
                    labelText: 'Order ID : ${number()}',
                    labelStyle: GoogleFonts.patrickHand(),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide())),
              ),
            ),
            SizedBox(height: 25),
            Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    'Fetch your location',
                    style: GoogleFonts.patrickHand(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      jhol = true;
                      loading = true;
                    });
                    Future.delayed(Duration(seconds: 4), () {
                      setState(() {
                        loading = false;
                        showWidget = true;
                      });
                    });
                    //Get.to(Location());
                  },
                )),
            SizedBox(
              height: 25,
            ),
            loading
                ? Visibility(
                    child: CircularProgressIndicator(),
                    visible: jhol,
                  )
                : Visibility(
                    visible: jhol,
                    child: Container(
                      width: 300,
                      height: 300,
                      child: Location(),
                    ),
                  ),
            SizedBox(
              height: 35,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              child: Text(
                'Submit',
                style: GoogleFonts.patrickHand(fontSize: 18),
              ),
              onPressed: () {
                addtasktofirebase();
              },
            )
          ],
        ),
      ),
    ));
  }
}

class showLocation extends StatefulWidget {
  const showLocation({Key? key}) : super(key: key);

  @override
  State<showLocation> createState() => _showLocationState();
}

class _showLocationState extends State<showLocation> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      // context can be used here...
      show = false;
    });
    return show
        ? CircularProgressIndicator()
        : Container(
            width: 300,
            height: 300,
            child: Location(),
          );
  }
}
