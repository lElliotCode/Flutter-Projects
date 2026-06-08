import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static final name = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Cinemapedia'),
      ),
    );
  }
}