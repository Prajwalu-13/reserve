import 'package:blur/blur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserve/usersection/ngolist.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({super.key});

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  final _formkey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _username = '';
  bool isLoginPage = false;

  startauthentication() {
    final validity = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (validity) {
      _formkey.currentState!.save();
      submitform(_email, _password, _username);
    }
  }

  submitform(String email, String password, String username) async {
    Get.to(NGOList(
      title: "k",
      description: 'k',
    ));

    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    try {
      if (isLoginPage) {
        authResult = await auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = authResult.user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          "username": username,
          "email": email,
          "password": password,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occured';
      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        children: [
          Image.asset(
            "assets/i6.png",
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (!isLoginPage)
                          TextFormField(
                            keyboardType: TextInputType.name,
                            key: ValueKey('username'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Invalid Username';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _username = value!;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide:
                                      new BorderSide(color: Colors.white)),
                              labelText: 'Username',
                              labelStyle:
                                  GoogleFonts.rajdhani(color: Colors.white),
                            ),
                          ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide()),
                            labelText: 'Email',
                            labelStyle:
                                GoogleFonts.rajdhani(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          key: ValueKey('password'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Invalid password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide()),
                            labelText: 'Password',
                            labelStyle:
                                GoogleFonts.rajdhani(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            startauthentication();
                          },
                          child: isLoginPage
                              ? Text(
                                  'Login',
                                  style: GoogleFonts.rajdhani(fontSize: 15),
                                )
                              : Text(
                                  'SignUp',
                                  style: GoogleFonts.rajdhani(fontSize: 15),
                                ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 2,
                            minimumSize: Size(120, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.grey),
                            onPressed: () {
                              setState(() {
                                isLoginPage = !isLoginPage;
                              });
                            },
                            child: isLoginPage
                                ? Text(
                                    'Not a member',
                                    style: TextStyle(color: Colors.black),
                                  )
                                : Text(
                                    'Already a member?',
                                    style: TextStyle(color: Colors.black),
                                  ),
                          ),
                        )
                      ],
                    )),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
