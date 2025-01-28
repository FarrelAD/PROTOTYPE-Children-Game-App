import 'package:flutter/material.dart';

class CountingGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game page'),
      ),
      body: Text("Counting game!"),
    );
  }
}