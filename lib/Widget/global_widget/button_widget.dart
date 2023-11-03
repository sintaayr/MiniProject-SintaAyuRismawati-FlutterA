import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  const ButtonWidget({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 207, 38, 38)),
      onPressed: onPressed,
      child: Text(title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
