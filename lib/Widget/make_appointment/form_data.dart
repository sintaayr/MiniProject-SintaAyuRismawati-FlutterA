import 'package:flutter/material.dart';

class DataFormWidget extends StatelessWidget {
  final String judulData;
  final String? hintText;
  final TextEditingController? controller;

  const DataFormWidget({super.key,required this.judulData, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Text(
                judulData,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: hintText,
                  ),
                  controller: controller,
                ),
              )
            ],
          );
  }
}