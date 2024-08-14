import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key, required this.loaderText});
  final String loaderText;

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10,),
        Text("$loaderText...")
      ],
    ),);
  }
}