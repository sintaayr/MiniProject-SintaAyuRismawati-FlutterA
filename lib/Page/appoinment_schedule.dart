import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/db_manager.dart';

class AppointmentSchedulePage extends StatefulWidget {
  const AppointmentSchedulePage({super.key});

  @override
  State<AppointmentSchedulePage> createState() =>
      _AppointmentSchedulePageState();
}

class _AppointmentSchedulePageState extends State<AppointmentSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Appointment Schedule",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 207, 38, 38),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<DbManager>(
            builder: (context, db, Widget? child) {
              if (db.dataAppointment.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: db.dataAppointment.length,
                  itemBuilder: (context, index) {
                    final data = db.dataAppointment[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                '/detailAppointment',
                                arguments: index);
                          },
                          child: ListTile(
                            leading: const Icon(Icons.calendar_month_outlined),
                            title: Text(
                              data.tanggalAppointment ?? "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ID : ${data.id}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 30, 94, 146),
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(data.namaRS ?? ""),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                db.deleteAppointmentById(data.id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 207, 38, 38),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        )
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Anda tidak memiliki jadwal appointment."),
                );
              }
            },
          ),
        ));
  }
}
