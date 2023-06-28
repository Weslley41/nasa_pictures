import 'dart:math';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final void Function() onTryAgain;
  const ErrorPage({super.key, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    final randomNumber = Random().nextInt(10) + 1;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$randomNumber.jpg',
            height: 250,
          ),
          const SizedBox(height: 20),
          Text(
            'Something went wrong. Please try again.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            onPressed: onTryAgain,
            child: const Text('Try again')
          )
        ],
      ),
    );
  }
}
