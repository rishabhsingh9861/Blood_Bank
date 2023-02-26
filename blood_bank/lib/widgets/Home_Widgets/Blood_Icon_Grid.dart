import 'package:flutter/material.dart';
import 'package:flutter_cataloge/page/Neaby_hospital.dart';
import 'package:flutter_cataloge/page/find_blood.dart';
import 'package:flutter_cataloge/utilits/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class BloodIconGrid extends StatelessWidget {
  const BloodIconGrid({super.key});

  @override
  Widget build(BuildContext context) {
//  find blood icon url
    // ignore: constant_identifier_names
    const FindBloodUrl =
        "https://cdn-icons-png.flaticon.com/128/2069/2069755.png";

    // nearby hospital url
    const NearHospitalUrl =
        "https://cdn-icons-png.flaticon.com/128/3999/3999584.png";

    return Scaffold(
      body: GridView(
        children: [
          Container(
            color: Color.fromARGB(255, 142, 185, 221),
            child: InkWell(
              onTap: () {
               Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FindBlood()),
  );
              },
              child: Column(
                children: [
                  Image.network(FindBloodUrl).py4(),
                  Text(" Find Blood / Blood Bank / Platelets ",
                          style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 15.0
                          ))
                      .py4()
                      .px8()
                ],
              ),
            ),
          ).px2().py2().cornerRadius(20),
          Container(
            color: Color.fromARGB(255, 160, 206, 244),
            child: InkWell(
              onTap: () {
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NearbyHospital()),
  );
              },
              child: Column(
                children: [
                  Image.network(NearHospitalUrl).py4(),
                  Text(
                    "Nearby Hospital",
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                  ).py4().px8()
                ],
              ),
            ),
          ).px2().py2().cornerRadius(20),
        ],
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}





/*
class BloodIconGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: BloodIcon.icons.length,
        itemBuilder: ((context, index) {
          final Blood = BloodIcon.icons[index];
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.findbloodRoute);
              },
              child: BloodItem(Blood: Blood));
        }));
  }
}


*/
/*
class GridIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
         children: [
        Container(color:Colors.red),
         Container(color:Colors.orange),
          Container(color:Colors.green),
           Container(color:Colors.blue),
        ],
        )),
     


    );
  }
}

class BloodItem extends StatelessWidget {
  final Bleed Blood;
  const BloodItem({
    Key? key,
    required this.Blood,
  })  : assert(Blood != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VxBox(
          child: Column(
        children: [
          Hero(
            tag: Key(Blood.name.toString()),
            child: BleedImage(
              image: Blood.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              verticalDirection: VerticalDirection.down,
              textDirection: TextDirection.ltr,
              children: [Blood.name.text.bold.base.make().py12().px12()],
            ),
          )
        ],
      )).red500.roundedLg.make().p4(),
    );
  }
}
*/