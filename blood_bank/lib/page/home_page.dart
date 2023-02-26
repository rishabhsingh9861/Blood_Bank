// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/utilits/routes.dart';
import 'package:flutter_cataloge/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/Home_Widgets/Blood_Icon_Grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 156, 151),
        title: const Text(
          "LIFE",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: (() {
                    Navigator.pushNamed(context, MyRoutes.Notification);

                    setState(() {
                      counter = 0;
                    });
                  })),
              counter != 0
                  ? Positioned(
                      right: 10,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6)),
                        constraints:
                            const BoxConstraints(minHeight: 14, minWidth: 14),
                        child: Text(
                          '$counter',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Container()
            ],
          )
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          const Expanded(child: BloodIconGrid()),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 3, 2, 2),
            child: Container(
                color: const Color.fromARGB(255, 164, 138, 136),
                child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          "Your blood is made up of liquid and solids. The liquid part, called plasma, is made of water, salts, and protein. Over half of your blood is plasma. The solid part of your blood contains red blood cells, white blood cells, and platelets.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )))).cornerRadius(20),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 3, 2, 2),
            child: Container(
                color: Colors.blue,
                child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          "Your blood is made up of liquid and solids. The liquid part, called plasma, is made of water, salts, and protein. Over half of your blood is plasma. The solid part of your blood contains red blood cells, white blood cells, and platelets.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )))).cornerRadius(20),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 3, 2, 2),
            child: Container(
                color: const Color.fromARGB(255, 246, 182, 182),
                child: SizedBox(
                    height: 95,
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          "Your blood is made up of liquid and solids. ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        )))).cornerRadius(20),
          ),
        ],
      ),
    );
  }
}
