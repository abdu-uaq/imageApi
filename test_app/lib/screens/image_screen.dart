import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {

  final String img;

  ImageScreen({this.img});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.network(img),
      onTap: (){
        Navigator.pop(context);
      },
    );
  }
}
