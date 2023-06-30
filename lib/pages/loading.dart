import 'dart:math';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final randomNumber = Random().nextInt(10) + 1;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$randomNumber.png',
              height: 250,
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
