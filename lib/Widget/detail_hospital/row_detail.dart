import 'package:flutter/material.dart';

class RowDetailHospitalWidget extends StatelessWidget {
  final String data;
  final IconData icon;
  const RowDetailHospitalWidget({super.key, required this.data, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 20),
        Expanded(
          child: Text(data),
        ),
      ],
    );
  }
}
