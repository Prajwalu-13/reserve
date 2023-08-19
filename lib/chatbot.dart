import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reserve/usersection/pickup.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  WebViewExample({required this.name, required this.req});

  String name;
  String req;

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  WebViewController? controller;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        children: [
          WebView(
            initialUrl: "https://aromatic-knobbly-presentation.anvil.app/",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller = webViewController;
            },
          ),
          Container(
            width: width,
            height: 60,
            //color: Colors.white,
            child: AppBar(
              backgroundColor: Colors.red,
              title: Text("Bot"),
              centerTitle: true,
            ),
          ),
          Positioned(
            bottom: 50,
            left: width / 4,
            child: Card(
              elevation: 10,
              color: Colors.transparent,
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.defaultDialog(
                      title: widget.name,
                      middleText: 'Donation details : ${widget.req}',
                      backgroundColor: Colors.amber,
                      titlePadding: const EdgeInsets.all(30),
                      onConfirm: () {
                        Get.to(Pickup());
                      },
                      textConfirm: 'Confirm',
                      buttonColor: Colors.black);
                },
                label: Text("Confirm your donation"),
                icon: Icon(Icons.check_circle),
              ),
            ),
          )
        ],
      ),
    );
  }
}
