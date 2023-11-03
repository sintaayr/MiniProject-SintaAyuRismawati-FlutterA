import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Provider/make_appointment_provider.dart';

class ParsingDateFormat {
  String dateFormat(DateTime dateTime) {
    return DateFormat('EEEE, dd-MM-yyyy').format(dateTime);
  }
}

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime _dueDate = DateTime.now();
  DateTime currentDate = DateTime.now();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Consumer<MakeAppointmentProvider>(
              builder: (BuildContext context, value, Widget? child) { 
                return TextField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "EEEE, dd-MM-yyyy",
                ),
                controller: value.tanggalController,
                readOnly: true,
              );
               }
            ),
          ),
          Consumer<MakeAppointmentProvider>(
            builder: (BuildContext context, value, Widget? child) { 
              return IconButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2050),
                );
                if (selectDate != null) {
                  _dueDate = selectDate;
                  currentDate = selectDate;
                  setState(() {});
          
                  value.tanggalController.text = ParsingDateFormat().dateFormat(_dueDate);
                  widget.onDateSelected(selectDate);
                }
              },
              icon: const Icon(Icons.date_range_rounded),
            );
             },
            
          ),
        ],
      ),
    );
  }
}

