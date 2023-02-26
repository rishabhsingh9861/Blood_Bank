import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/page/dropDownButton.dart';
import 'package:flutter_cataloge/read%20data/a_positive.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({super.key});

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  static String currentAdress = 'My Adress';
  late Position currentposition;
  bool _isLoading = false;

  @override
  void initState() {
    _detectPosition();
    super.initState();
  }

  Future<void> _detectPosition() async {
    setState(() {
      _isLoading = true;
    });
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
    try {
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .then((value) async {
        List<Placemark> placemarks =
            await placemarkFromCoordinates(value.latitude, value.longitude);
        Placemark place = placemarks[0];
        setState(() {
          currentposition = value;
          currentAdress =
              " ${place.street},${place.locality}, ${place.postalCode}";
          print(currentposition);
          _isLoading = false;
        });
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  //  document Ids
  List<String> docIds = [];

  // get DocIds

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('organizationusers')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (_isLoading) {
          return const Scaffold(
              body: Center(
            child: SizedBox(
                height: 30, width: 30, child: CircularProgressIndicator()),
          ));
        } else {
          return buildWidget(context);
        }
      },
    );
  }

  Widget buildWidget(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(currentAdress)),
            ),
            //     Text('latitude =${currentposition.latitude}'),
            //    Text('longitude =${currentposition.longitude}'),
            // TextButton(
            //     onPressed: () async {
            //       // _detectPosition();
            //     },
            //     child: const Text("Current Location")),

            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: DropDownButton(),
              ),
            ),

            Expanded(
              child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: docIds.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: GetAPositive(documentId: docIds[index]),
                             tileColor: Color.fromARGB(255, 243, 210, 207),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
