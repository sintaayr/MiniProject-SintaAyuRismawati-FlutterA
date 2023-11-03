import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/db_manager.dart';
import '../Widget/detail_appointment/row_data_appointment.dart';

class DetailAppointmentPage extends StatefulWidget {
  const DetailAppointmentPage({super.key});

  @override
  State<DetailAppointmentPage> createState() => _DetailAppointmentPageState();
}

class _DetailAppointmentPageState extends State<DetailAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    final index =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Appointment",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 38, 38),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Consumer<DbManager>(
              builder: (BuildContext context, db, Widget? child) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_month_outlined),
                        Text(
                          db.dataAppointment[index].tanggalAppointment ?? "",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    Text("ID : ${db.dataAppointment[index].id}")
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<DbManager>(
              builder: (BuildContext context, db, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Data Pasien',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    DataAppointmentWidget(
                      judulData: "Nama                : ",
                      dataAppointment:
                          db.dataAppointment[index].namaPasien ?? "",
                    ),
                    DataAppointmentWidget(
                      judulData: "Alamat             : ",
                      dataAppointment:
                          db.dataAppointment[index].alamatPasien ?? "",
                    ),
                    DataAppointmentWidget(
                      judulData: "Umur               : ",
                      dataAppointment:
                          db.dataAppointment[index].umurPasien ?? "",
                    ),
                    DataAppointmentWidget(
                      judulData: "Keluhan           : ",
                      dataAppointment:
                          db.dataAppointment[index].keluhanPasien ?? "",
                    )
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            Consumer<DbManager>(
              builder: (BuildContext context, db, Widget? child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Data Rumah Sakit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    DataAppointmentWidget(
                      judulData: "Rumah Sakit     : ",
                      dataAppointment: db.dataAppointment[index].namaRS ?? "",
                    ),
                    DataAppointmentWidget(
                      judulData: "Alamat             : ",
                      dataAppointment: db.dataAppointment[index].alamatRS ?? "",
                    ),
                    DataAppointmentWidget(
                      judulData: "Telepon           : ",
                      dataAppointment: db.dataAppointment[index].telpRS ?? "",
                    )
                  ],
                );
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
