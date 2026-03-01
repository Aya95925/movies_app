import 'package:flutter/material.dart';

class MoviesHome extends StatelessWidget {
  const MoviesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Welcome to Movies Home!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
