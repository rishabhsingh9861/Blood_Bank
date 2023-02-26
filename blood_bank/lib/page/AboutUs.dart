import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Column(
        children: [
          Text(
            "What is Life ?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ).py16().centered(),
          // Text(
          //   "Life is defined as any system capable of performing functions such as eating, metabolizing, excreting, breathing, moving, growing, reproducing, and responding to external stimuli.",
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          // ).px12(),
          // ignore: prefer_const_constructors
          Text(" Life in which blood play an important role, Our team has a motto that all people who need blood and a person want to donate the blood , we made this platform. ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
              .px12()
              .py12(),
          Text("Let give u a brief idea how app will work. ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
              .px12()
              .py12(),
          Text("If a user want a blood from any bank user can take from any blood bank or an user can raise a donation from any other user who has same blood by sending them notification, if a user want to donate a blood by going in donate section an user camn donate the blood to blood bank/nearby need.   ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
              .px12()
              .py12(),
          Text(" Wish u all the best from our team and have a healthy life.",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
              .px12()
              .py12(),
          Text("MEMBERS ARE :- ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
              .px12()
              .py12(),
          Text("ROHIT KARVATKAR, YASH GUNDALE RISHABH SINGH , NIVEDITA SHINDE",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))
              .px12()
              .py12()
        ],
      ),
    ).safeArea();
  }
}
