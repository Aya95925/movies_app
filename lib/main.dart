import 'package:flutter/material.dart';
import 'package:movies_app/ui/screens/home/home_tabs.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeTabs());
  }
}
