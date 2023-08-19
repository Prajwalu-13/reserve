import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserve/ngoSection/donateDetails.dart';
import 'package:reserve/usersection/locationdata.dart';
import 'package:reserve/usersection/pickup.dart';

class NGOhome extends StatefulWidget {
  const NGOhome({super.key});

  @override
  State<NGOhome> createState() => _NGOhomeState();
}

class _NGOhomeState extends State<NGOhome> {
  NGOhometofirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final User user = await auth.currentUser!;
    String uid = user.uid;
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('ngoReq')
        .doc(uid)
        .collection('ngoReqDetails')
        .doc(time.toString())
        .set({
      'title': titleController.text,
      'description': descriptionController.text,
      'time': time.toString(),
      'timestamp': time
    });
    Fluttertoast.showToast(msg: 'Data Added');
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Push Requirements to User side')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'Enter Required Items ',
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
                    NGOhometofirebase();
                    Get.to(DonateDetails());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
