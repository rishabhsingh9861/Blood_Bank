
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/utilits/routes.dart';


class IconWidget extends StatelessWidget {
  final Bleed  ;

  const IconWidget({super.key, required this.Bleed}) : assert(Bleed != null);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent,
      shape: StadiumBorder(),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, MyRoutes.findbloodRoute);
        },
        leading: Image.network(Bleed.image),
        title: Text(
          Bleed.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
