import 'package:flutter/material.dart';
import 'package:hospital_connect/Widget/detail_hospital/row_detail.dart';
import 'package:hospital_connect/Widget/global_widget/button_widget.dart';
import 'package:provider/provider.dart';
import '../Provider/find_hospital_provider.dart';

class DetailHospitalPage extends StatefulWidget {
  const DetailHospitalPage({super.key});

  @override
  State<DetailHospitalPage> createState() => _DetailHospitalPageState();
}

class _DetailHospitalPageState extends State<DetailHospitalPage> {
  @override
  Widget build(BuildContext context) {
    final index =
        int.parse(ModalRoute.of(context)!.settings.arguments.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Hospital',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 38, 38),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 250,
            width: 100,
            child: Image.network(
              'https://1.bp.blogspot.com/-jfrEDIlA4LY/XuZotefaHVI/AAAAAAAABDY/CEvJUw_7V1oNhuWC7-QwiHMtumYLWiwCQCK4BGAsYHg/s750/rumah+sakit.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 243, 243, 243),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<FindHospitalProvider>(
                  builder: (BuildContext context, hospital, Widget? child) {
                    return Text(
                      hospital.daftarHospital[index].name ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Consumer<FindHospitalProvider>(
                  builder: (BuildContext context, hospital, Widget? child) {
                    return Column(
                      children: [
                        RowDetailHospitalWidget(
                          data: hospital.daftarHospital[index].address ?? "",
                          icon: Icons.location_on,
                        ),
                        const SizedBox(height: 10),
                        RowDetailHospitalWidget(
                          data: "( ${hospital.daftarHospital[index].phone} )",
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 10),
                        RowDetailHospitalWidget(
                          data:
                              "${hospital.daftarHospital[index].bedAvailability} tersedia",
                          icon: Icons.hotel,
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/makeAppoinment', arguments: index);
            },
            title: 'Buat Appointment',
          ),
        ],
      ),
    );
  }
}
