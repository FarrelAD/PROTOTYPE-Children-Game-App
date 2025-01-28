import 'package:flutter/material.dart';

class ColorMatching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tebak warna'),
        backgroundColor: Color(0xFFB4D8E7),
      ),
      body: Text("Color matching game"),
    );
  }
}