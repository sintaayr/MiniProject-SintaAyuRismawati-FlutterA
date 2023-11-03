// import 'package:flutter/material.dart';
// import 'package:hospital_connect/Provider/detail_appointment.dart';
// import 'package:hospital_connect/Widget/detail_appointment/row_data_appointment.dart';
// import 'package:provider/provider.dart';

// import '../../Provider/db_manager.dart';

// class DetailDataPasienWidget extends StatefulWidget {
//   const DetailDataPasienWidget({super.key});

//   @override
//   State<DetailDataPasienWidget> createState() => _DetailDataPasienWidgetState();
// }

// class _DetailDataPasienWidgetState extends State<DetailDataPasienWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<DbManager, DetailAppointmenProvider>(
//       builder: (BuildContext context, db, detail, Widget? child) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Data Pasien',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   decoration: TextDecoration.underline),
//             ),
//             DataAppointmentWidget(
//               judulData: "Nama                : ",
//               dataAppointment:
//                   db.dataAppointment[detail.index].namaPasien ?? "",
//             ),
//             DataAppointmentWidget(
//               judulData: "Alamat             : ",
//               dataAppointment:
//                   db.dataAppointment[detail.index].alamatPasien ?? "",
//             ),
//             DataAppointmentWidget(
//               judulData: "Umur               : ",
//               dataAppointment:
//                   db.dataAppointment[detail.index].umurPasien ?? "",
//             ),
//             DataAppointmentWidget(
//               judulData: "Keluhan           : ",
//               dataAppointment:
//                   db.dataAppointment[detail.index].keluhanPasien ?? "",
//             )
//           ],
//         );
//       },
//     );
//   }
// }
