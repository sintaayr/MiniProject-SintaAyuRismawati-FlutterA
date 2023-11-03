import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem<String>> items;
  final Function(String?) onChanged;

  const DropdownWidget(
      {super.key,
      required this.label,
      required this.items,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 10),
      width: 150,
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: DropdownButton<String>(
          hint: Text(label),
          isDense: true, // Mengurangi padding dalam DropdownButton
          isExpanded: true, // Membuat dropdown mengisi lebar container
          underline: Container(), // Menghilangkan garis bawah
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
