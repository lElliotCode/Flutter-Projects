import 'package:flutter/material.dart';

const colorLists = <Color>[
  Colors.blue,
  Colors.tealAccent,
  Colors.yellowAccent,
  Color.fromARGB(255, 255, 0, 0),
  Colors.purple,
  Colors.orange,
  Colors.black38,
  Colors.limeAccent,
  Colors.deepOrangeAccent,
  Colors.brown,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0, 'Select color must be greather than or zero'),
      assert(
        selectedColor < colorLists.length,
        'Select color must be less than ${colorLists.length}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorLists[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
