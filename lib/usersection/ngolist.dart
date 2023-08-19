import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserve/chatbot.dart';
import 'package:reserve/usersection/ngoDescription.dart';
import 'package:reserve/usersection/pickup.dart';

import 'customwidget.dart';
import 'donate.dart';

class Data {
  String name;
  String info;
  String link;
  String req;
  String img;

  Data(
      {required this.name,
      required this.info,
      required this.link,
      required this.req,
      required this.img});
}

List<Data> _data = [
  Data(
      name: 'Akshaya Patra Foundation',
      info:
          'The Akshaya Patra Foundation is an NGO in India headquartered in Bengaluru. Our organisation strives to eliminate classroom hunger by implementing the Mid-Day Meal Scheme in the government schools and government-aided schools. Alongside, Akshaya Patra also aims at countering malnutrition and supporting the right to education of socio-economically disadvantaged children.',
      link: "https://www.akshayapatra.org/",
      req: '3 kg rice',
      img:
          'https://www.akshayapatra.org/apadmin/uploads/settings/tapf-logo-blue21dec.png'),
  Data(
      name: 'Goonj',
      info:
          'Goonj aims to build an equitable relationship of strength, sustenance, and dignity between the cities and villages, using under-utilized material as a tool to trigger development with dignity. We envision growing as an idea across regions, economies, and countries using urban surplus material as a tool to address basic but neglected issues of the financially and materially poor, involving them in designing and implementing their own solutions, with their own efforts, knowledge, and dignity, and material as a reward for their participation.',
      link: "https://goonj.org/",
      req: '4 kg rice',
      img:
          'https://tse1.mm.bing.net/th?id=OIP.CQiFU88ePg0_Ay12MXMWtwAAAA&pid=Api&P=0'),
  Data(
      name: 'Annamrita Foundation',
      info:
          'Founded in 2004, Annamrita Foundation has always believed that the intake of food not only sustains a person, it also paves a way for a healthy future. We strive to deliver nutritious meals to people who need it the most.',
      link: "https://annamrita.org/",
      req: '2 kg rice',
      img:
          'https://media.licdn.com/dms/image/C5103AQENijRtAzTiJw/profile-displayphoto-shrink_800_800/0/1516851813092?e=2147483647&v=beta&t=b1HUqVrBx66hnpoiE_QylQVRIhmC_EKTsYIsgkGHuGw'),
  Data(
      name: 'Feeding India',
      info:
          'Feeding India is a non-profit organization dedicated to eradicate hunger and improve malnutrition outcomes in India.We work toward this mission by supporting large-scale systemic interventions as well as providing essential food support to underserved communities in the form of raw grains and freshly cooked food.',
      link: "https://www.feedingindia.org/",
      req: '5 kg rice',
      img:
          'https://b.zmtcdn.com/data/o2_assets/dd42e0e1a7b173d6dd61638a880156c71677662656.png'),
  Data(
      name: 'Roti Bank',
      info:
          'Mumbai Roti Bank is a non-profit, hunger relief organisation with the mission to eliminate hunger and malnutrition. Started in December 2017 under the able mentorship of former Director General of Police, Maharashtra, Mr. D. Sivanandhan, our initial objective was to reduce the gap between hunger and the excess food. Initially, we used to pick up excess food from weddings, events, hotels, cafeterias, housing societies and deliver it to thousands of hungry people who live in slums or on the footpath. Everyday, we served beneficiaries which primarily include children and also others who are most in need.',
      link: "https://rotibankfoundation.org/",
      req: '3 kg rice',
      img:
          'https://rotibankfoundation.org/wp-content/uploads/2019/10/Rotibank-dev.png'),
];

class NGOList extends StatefulWidget {
  const NGOList({super.key, required this.title, required this.description});

  final String title, description;

  @override
  State<NGOList> createState() => _NGOListState();
}

class _NGOListState extends State<NGOList> {
  bool displayAnswer = false;

  Widget buttonReq(String req, String name) {
    print(widget.title);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        "Requirements",
        style: GoogleFonts.rajdhani(
            textStyle: TextStyle(fontSize: 15),
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        setState(() {
          Get.defaultDialog(
            title: name,
            middleText: req,
            backgroundColor: Color(0xffFFD700),
            titlePadding: const EdgeInsets.all(30),
            onConfirm: () {
              Get.to(WebViewExample(
                name: name,
                req: req,
              ));
            },
            textConfirm: 'Ask a question',
            buttonColor: Colors.black,
            confirmTextColor: Colors.white,
            content: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    "Donate",
                    style: GoogleFonts.rajdhani(
                        textStyle: TextStyle(fontSize: 15),
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    Get.to(Pickup());
                  },
                ),
                Text(
                  req,
                  style: GoogleFonts.rajdhani(
                      textStyle: TextStyle(fontSize: 15),
                      color: Colors.black,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Widget buttonDon(String req, String name) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        "Donate",
        style: GoogleFonts.rajdhani(
            textStyle: TextStyle(fontSize: 15),
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Get.to(Donate());
      },
    );
  }

  Widget NGOReq() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Custom(
            question: _data[index].name,
            answer: _data[index].info,
            videoLink: _data[index].link,
            isVisible: true,
            customRaisedButton: buttonReq(
              _data[index].req,
              _data[index].name,
            ),
            img: _data[index].img,
          );
        });
  }

  Widget NGODonate() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Custom(
              question: _data[index].name,
              answer: _data[index].info,
              videoLink: _data[index].link,
              isVisible: true,
              customRaisedButton:
                  buttonDon(_data[index].req, _data[index].name),
              img: _data[index].img);
        });
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [NGOReq(), NGODonate()];

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        title: const Text('NGO Lists'),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 50,
      ),
      body: pages[_index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.grey.shade700,
        backgroundColor: Colors.grey.shade900,
        items: <Widget>[
          Icon(
            Icons.food_bank_outlined,
            size: 30,
            color: Color(0xffFFD700),
          ),
          Icon(Icons.add_card, size: 30, color: Color(0xffFFD700)),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
          //Handle button tap
        },
      ),
    );
  }
}

class Pal extends StatelessWidget {
  final String title, description;
  const Pal({super.key, required this.title, required this.description});

  // String palJr(){
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
