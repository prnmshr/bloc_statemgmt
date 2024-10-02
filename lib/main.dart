import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coba/bloc/color_bloc.dart';
import 'package:coba/bloc/color_event.dart';  
import 'package:coba/bloc/color_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: ColorController(),
      ),
    );
  }
}

class ColorController extends StatelessWidget {
  const ColorController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Customizer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Customize Color',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            BlocBuilder<ColorBloc, ColorState>(
              builder: (context, state) {
                return Column(
                  children: [
                    ColorSlider('R', state.red, (value) {
                      BlocProvider.of<ColorBloc>(context).add(
                        ColorChanged(
                          red: value,
                          green: state.green,
                          blue: state.blue,
                        ),
                      );
                    }),
                    SizedBox(height: 20),
                    ColorSlider('G', state.green, (value) {
                      BlocProvider.of<ColorBloc>(context).add(
                        ColorChanged(
                          red: state.red,
                          green: value,
                          blue: state.blue,
                        ),
                      );
                    }),
                    SizedBox(height: 20),
                    ColorSlider('B', state.blue, (value) {
                      BlocProvider.of<ColorBloc>(context).add(
                        ColorChanged(
                          red: state.red,
                          green: state.green,
                          blue: value,
                        ),
                      );
                    }),
                    SizedBox(height: 20),
                    Container(
                      width: 100,
                      height: 100,
                      color: state.color,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hex Color: ${getHexColor(state.red, state.green, state.blue)}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Method to convert RGB to Hex
  String getHexColor(double red, double green, double blue) {
    int r = red.toInt();
    int g = green.toInt();
    int b = blue.toInt();
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}'.toUpperCase();
  }
}

class ColorSlider extends StatelessWidget {
  final String label;
  final double value;
  final Function(double) onChanged;

  const ColorSlider(this.label, this.value, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        Expanded(
          child: Slider(
            value: value,
            min: 0,
            max: 255,
            onChanged: onChanged,
          ),
        ),
        Text(value.toStringAsFixed(0)),
      ],
    );
  }
}
