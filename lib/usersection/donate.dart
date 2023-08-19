import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserve/usersection/locationdata.dart';
import 'package:reserve/usersection/pickup.dart';

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  addtasktofirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    print(user.email);
    String uid = user.uid;
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('donation')
        .doc(uid)
        .collection('donationDetails')
        .doc(time.toString())
        .set({
      'item': itemController.text,
      'description': descriptionController.text,
      'time': time.toString(),
      'phone': phoneController.text,
      'timestamp': time
    });
    Fluttertoast.showToast(msg: 'Data Added');
  }

  TextEditingController itemController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donate As per wish')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                controller: itemController,
                decoration: InputDecoration(
                    labelText: 'Enter Items to donate',
                    hintText: '(Eg Rice : 10kg)',
                    labelStyle: GoogleFonts.patrickHand(),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide())),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: GoogleFonts.patrickHand(),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide())),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'Phone number',
                    labelStyle: GoogleFonts.patrickHand(),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide())),
              ),
            ),
            SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.patrickHand(fontSize: 18),
                  ),
                  onPressed: () {
                    addtasktofirebase();
                    Get.to(Pickup());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
