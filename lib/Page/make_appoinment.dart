import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/data_apoinment.dart';
import '../Provider/db_manager.dart';
import '../Provider/find_hospital_provider.dart';
import '../Provider/make_appointment_provider.dart';
import '../Utils/shared_preference.dart';
import '../Widget/global_widget/button_widget.dart';
import '../Widget/make_appointment/date_picker.dart';
import '../Widget/make_appointment/form_data.dart';

class MakeAppointmentPage extends StatefulWidget {
  const MakeAppointmentPage({super.key});

  @override
  State<MakeAppointmentPage> createState() => _MakeAppointmentPageState();
}

class _MakeAppointmentPageState extends State<MakeAppointmentPage> {
  void loadAngkaId() async {
    Provider.of<MakeAppointmentProvider>(context, listen: false).angkaId =
        await SharedPreference().readAngkaId();
  }

  @override
  void initState() {
    loadAngkaId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final index =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Make Appoinment",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 38, 38),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          Row(
            children: [
              const Text(
                "Rumah Sakit     :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Consumer<FindHospitalProvider>(
                  builder: (BuildContext context, hospital, Widget? child) {
                    return Text(
                      hospital.daftarHospital[index].name ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),
              )
            ],
          ),
          Consumer<MakeAppointmentProvider>(
            builder: (BuildContext context, appointment, Widget? child) {
              return Column(
                children: [
                  DataFormWidget(
                    judulData: "Nama                :",
                    hintText: "Nama pasien",
                    controller: appointment.namaController,
                  ),
                  DataFormWidget(
                    judulData: "Alamat             :",
                    hintText: "Alamat pasien",
                    controller: appointment.alamatController,
                  ),
                  DataFormWidget(
                    judulData: "Umur                :",
                    hintText: "Umur pasien",
                    controller: appointment.umurController,
                  )
                ],
              );
            },
          ),
          Row(
            children: [
              const SizedBox(height: 50),
              const Text(
                "Tanggal           :",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              DatePickerWidget(onDateSelected: (DateTime selectedDate) {})
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Keluhan           :",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Consumer<MakeAppointmentProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return TextField(
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Keluhan yang pasien rasakan",
                ),
                controller: value.keluhanController,
              );
            },
          ),
          const SizedBox(height: 50),
          Consumer3<MakeAppointmentProvider, FindHospitalProvider, DbManager>(
            builder: (BuildContext context, appointment, hospital, db,
                Widget? child) {
              return ButtonWidget(
                onPressed: () async {
                  appointment.cekTextField();
                  if (appointment.isComplete) {
                    db.addAppointment(
                      DataAppointment(
                        id: "APMN${appointment.angkaId}",
                        namaRS: hospital.daftarHospital[index].name,
                        alamatRS: hospital.daftarHospital[index].address,
                        telpRS: hospital.daftarHospital[index].phone,
                        namaPasien: appointment.namaController.text,
                        alamatPasien: appointment.alamatController.text,
                        umurPasien: appointment.umurController.text,
                        tanggalAppointment: appointment.tanggalController.text,
                        keluhanPasien: appointment.keluhanController.text,
                      ),
                    );
                    appointment.clear();
                    Navigator.of(context)
                        .pushReplacementNamed('/appointmentSchedule');
                    appointment.tambahAngkaId();
                    await SharedPreference().addAngkaId(appointment.angkaId);
                  } else {
                    return showDialog(
                      context: context,
                      builder: ((context) {
                        return AlertDialog(
                          backgroundColor:
                              const Color.fromARGB(255, 219, 199, 199),
                          content: const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Maaf, data belum lengkap',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            )
                          ],
                        );
                      }),
                    );
                  }
                },
                title: 'Ajukan Appointment',
              );
            },
          )
        ],
      ),
    );
  }
}
