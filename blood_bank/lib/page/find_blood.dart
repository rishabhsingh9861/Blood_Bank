import 'package:flutter/material.dart';
import 'package:flutter_cataloge/page/GetLocation.dart';

class FindBlood extends StatefulWidget {
  const FindBlood({super.key});

  @override
  State<FindBlood> createState() => _FindBloodState();
}

class _FindBloodState extends State<FindBlood> {
  @override
  Widget build(BuildContext context) {
    return const GetLocation();
  }
} 
