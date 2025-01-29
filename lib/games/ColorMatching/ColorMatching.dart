import 'package:flutter/material.dart';
import 'dart:math';
import 'package:prototye_children_game_app/games/ColorMatching/ColorOption.dart';
import 'package:prototye_children_game_app/games/ColorMatching/ColorCircle.dart';


class ColorMatching extends StatefulWidget {
  const ColorMatching({super.key});

  @override
  _ColorMatchingState createState() => _ColorMatchingState();
}



class _ColorMatchingState extends State<ColorMatching> {
  final List<ColorOption> _listColor = [
    ColorOption.red,
    ColorOption.blue,
    ColorOption.green,
    ColorOption.yellow,
    ColorOption.purple
  ];

  List<ColorOption> _initColors = [];
  ColorOption _targetColor = ColorOption.red;


  void _getRandomColors() {
    setState(() {
      _listColor.shuffle(Random());
      _initColors = _listColor.take(3).toList();
      _targetColor = _initColors[Random().nextInt(_initColors.length)];
    });
  }


  void _updateAnswer() {
    setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('You\'re correct!'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }


  @override
  void initState() {
    super.initState();
    _getRandomColors();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tebak warna'),
          backgroundColor: Color(0xFFB4D8E7),
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorCircle(
                      color: _initColors[0].color,
                      targetColor: _targetColor,
                      updateAnswer: _updateAnswer
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColorCircle(
                        color: _initColors[1].color,
                        targetColor: _targetColor,
                        updateAnswer: _updateAnswer
                    ),
                    ColorCircle(
                        color: _initColors[2].color,
                        targetColor: _targetColor,
                        updateAnswer: _updateAnswer
                    )
                  ],
                ),
                SizedBox(height: 50),
                Text(
                  'Pilih Warna',
                  style: TextStyle(
                      fontSize: 25
                  ),
                ),
                Text(
                  _targetColor.name,
                  style: TextStyle(
                      fontSize: 36,
                      color: _targetColor.color,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    onPressed: _getRandomColors,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF28A745),
                      foregroundColor: Colors.white,
                      elevation: 8,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Lanjut',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ))
              ],
            ),
          ),
        )
    );
  }

}