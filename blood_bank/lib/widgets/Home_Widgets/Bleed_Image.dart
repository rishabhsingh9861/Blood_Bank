import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class BleedImage extends StatelessWidget {
  final String image;

  const BleedImage({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(image).px24().py16().h15(context);
  }
}