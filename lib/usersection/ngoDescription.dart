import 'package:flutter/material.dart';

class ngoDescription extends StatefulWidget {
  const ngoDescription({Key? key}) : super(key: key);

  @override
  State<ngoDescription> createState() => _ngoDescriptionState();
}

class _ngoDescriptionState extends State<ngoDescription> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Column(
      children: [
        Container(
          child: Card(
            child: Image.network(
              'https://www.akshayapatra.org/apadmin/uploads/settings/tapf-logo-blue21dec.png',
              width: width,
              height: 250,
            ),
          ),
        )
      ],
    ));
  }
}
