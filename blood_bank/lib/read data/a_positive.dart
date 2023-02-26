// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetAPositive extends StatelessWidget {
  final String documentId;
  GetAPositive({
    required this.documentId,
  });

  @override
  Widget build(BuildContext context) {
// get the collection

    CollectionReference user =
        FirebaseFirestore.instance.collection('organizationusers');

    return FutureBuilder<DocumentSnapshot>(
      future:  user.doc(documentId).get(),
      builder: ((context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['name']} '+'  ' '${data['User name']}');
      }
      return Text('Loading....');
    }));
  }
}





//     Future getDocId() async {
//       await FirebaseFirestore.instance
//           .collection('organizationusers')
//           .get()
//           .then((snapshot) => snapshot.docs.forEach((document) {
//                 FirebaseFirestore.instance
//                     .collection('organizationusers')
//                     .doc(document.id)
//                     .collection('Blood')
//                     .get()
//                     .then(
//                   (subcollection) {
//                     subcollection.docs.forEach((element) {
//                       print(element.reference);
//                       docIds.add(element.reference.id);
//                     });
//                   },
//                 );

//    //  print(document.reference);
//  //    docIds.add(document.reference.id);
//     }));
//   }