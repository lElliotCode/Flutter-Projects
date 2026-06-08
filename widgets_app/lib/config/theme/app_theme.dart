import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.tealAccent,
  Colors.yellowAccent,
  Color.fromARGB(255, 255, 0, 0),
  Colors.purple,
  Colors.orange,
  Colors.black,
  Colors.limeAccent,
  Colors.deepOrangeAccent,
  Colors.brown,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = true})
    : assert(selectedColor >= 0, 'Select color must be greather than or zero'),
      assert(
        selectedColor < colorList.length,
        'Select color must be less than ${colorList.length}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(centerTitle: false),
  );
}
