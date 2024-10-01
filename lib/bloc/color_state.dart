import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ColorState extends Equatable {
  final double red;
  final double green;
  final double blue;
  final Color color;

  ColorState({
    required this.red,
    required this.green,
    required this.blue,
  }) : color = Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1);

  @override
  List<Object> get props => [red, green, blue, color];
}
