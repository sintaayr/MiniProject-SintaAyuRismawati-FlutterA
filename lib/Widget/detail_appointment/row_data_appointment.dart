import 'package:flutter/material.dart';

class DataAppointmentWidget extends StatelessWidget {
  final String judulData;
  final String dataAppointment;
  const DataAppointmentWidget(
      {super.key, required this.judulData, required this.dataAppointment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(judulData),
        Expanded(
          child: Text(dataAppointment),
        ),
      ],
    );
  }
}
