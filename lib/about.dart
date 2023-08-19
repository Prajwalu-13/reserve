import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
        child: SafeArea(
      child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us:',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('St. John College of Engineering and Management'),
                subtitle: Text('Palghar,Maharashtra'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('9032840934'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('dummy@gmail.com'),
              ),
            ],
          )),
    ));
  }
}
