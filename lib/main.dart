import 'package:flutter/material.dart';
import 'game_screen.dart';

void main() {
  runApp(const MathPlayApp());
}

class MathPlayApp extends StatelessWidget {
  const MathPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Play',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'ComicNeue',
      ),
      home: const GameScreen(),
    );
  }
}
