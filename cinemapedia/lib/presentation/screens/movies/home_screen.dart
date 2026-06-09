// import 'package:cinemapedia/config/constants/environment.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

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
        child: Placeholder(),
      ),
    );
  }
}