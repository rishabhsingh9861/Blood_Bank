import 'package:flutter/material.dart';
import 'package:flutter_cataloge/organization/patientrequest.dart';
import 'package:flutter_cataloge/utilits/routes.dart';

class homePageOrganization extends StatefulWidget {
  const homePageOrganization({super.key});

  @override
  State<homePageOrganization> createState() => _homePageOrganizationState();
}

class _homePageOrganizationState extends State<homePageOrganization> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 236, 180, 176),
        title: Text("Life",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: (() {
                    //   Navigator.pushNamed(context, MyRoutes.Notification);

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
      body: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Color.fromARGB(255, 236, 187, 184),
                height: 40,
                child: TextButton(
                    onPressed: () {},
                    child: Text("Update",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0))),
              ),
            ),
            SizedBox(
              width: 50,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Color.fromARGB(255, 235, 195, 192),
                height: 40,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => patientRequest()),
                      );
                    },
                    child: Text("Patient Request",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0))),
              ),
            )

            // ElevatedButton(onPressed: (){

            // }, child: Text("Update")), 
            // SizedBox(width: 50,),
            // ElevatedButton(onPressed: () {}, child: Text("Patient Request"))
          ],
        ),
      ),
    );
  }
}
