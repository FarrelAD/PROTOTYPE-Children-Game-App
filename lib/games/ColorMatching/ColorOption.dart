import 'package:flutter/material.dart';

enum ColorOption {
  red('MERAH', Colors.red),
  blue('BIRU', Colors.blue),
  green('HIJAU', Colors.green),
  yellow('KUNING', Colors.yellow),
  purple('UNGU', Colors.purple);

  final String name;
  final Color color;

  const ColorOption(this.name, this.color);
}