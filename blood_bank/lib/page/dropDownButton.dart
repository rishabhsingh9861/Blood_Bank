// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';






class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}


final BloodGroup = [
  "A+",
  "A-",
  "B+",
  "B-",
  "AB+",
  "AB-",
  "O+",
  "O-",
  "A1+",
  "A1-",
  "A2+",
  "A2-",
  "A1B+",
  "A1B-",
  "A2B+",
  "A2B-"
];
String? selectedBloodgroup = "AB+";


loadData() async{

}

class _DropDownButtonState extends State<DropDownButton> {
  @override


  Widget build(BuildContext context) {
    return Center(
      child: GridView(children: [ 
Text(" Select Blood Group",style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20.0
                      )),

          DropdownButtonFormField(
            dropdownColor: Color.fromARGB(255, 228, 141, 135),
              value: selectedBloodgroup,
              items: BloodGroup.map((e) => DropdownMenuItem(
                    
                      child: Text(e,
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20.0
                      ),),
                    
                    value: e,
                  )).toList(),
              onChanged: (value) {
                setState(() {
                  selectedBloodgroup = value as String;
                });
              }
              )
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      
      ).expand(),
    ).px24();
  }
}







/*
class GetLocation extends StatefulWidget {
  @override
  State<GetLocation> createState() => _GetLocationState();
}

 class _GetLocationState extends State<GetLocation> {
 static String currentAdress = 'My Adress';
  late Position currentposition = rish();
  Position rish() {
    return  rish() ;
  }

  Future<Position> _detectPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please Keep Location On');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      Fluttertoast.showToast(msg: 'Location permission is denied');
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Location is required');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        currentposition = position;
        currentAdress = "${place.locality}, ${place.postalCode}";
      });
    } catch (e) {
      print(e);
    }
    throw '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
          child: Column(
        children: [
          Text(currentAdress),
          currentposition != null
              ? Text('latitude =' + currentposition.latitude.toString())
              : Container(),
          currentposition != null
              ? Text('longitude =' + currentposition.longitude.toString())
              : Container(),
          TextButton(
              onPressed: (() {
                _detectPosition();
              }),
              child: Text("Current Location"))
        ],
      )),
    );
  }
}

*/
