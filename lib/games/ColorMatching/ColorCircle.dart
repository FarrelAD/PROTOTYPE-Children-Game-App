import 'package:flutter/material.dart';
import 'package:prototye_children_game_app/games/ColorMatching/ColorOption.dart';

class ColorCircle extends StatelessWidget {
  final Color color;
  final ColorOption targetColor;
  final Function() updateAnswer;

  const ColorCircle({super.key, required this.color, required this.targetColor, required this.updateAnswer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (color == targetColor.color) {
          updateAnswer();
        }
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
      ),
    );
  }

}