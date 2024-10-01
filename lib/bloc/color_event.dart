import 'package:equatable/equatable.dart';

abstract class ColorEvent extends Equatable {
  const ColorEvent();

  @override
  List<Object> get props => [];
}

// Event untuk mengubah warna berdasarkan nilai RGB
class ColorChanged extends ColorEvent {
  final double red;
  final double green;
  final double blue;

  const ColorChanged({required this.red, required this.green, required this.blue});

  @override
  List<Object> get props => [red, green, blue];
}
