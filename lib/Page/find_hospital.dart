import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/find_hospital_provider.dart';
import '../Widget/find_hospital/row_dropdown.dart';

class FindHospitalPage extends StatefulWidget {
  const FindHospitalPage({super.key});

  @override
  State<FindHospitalPage> createState() => _FindHospitalPageState();
}

class _FindHospitalPageState extends State<FindHospitalPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<FindHospitalProvider>(context, listen: false).getProvinsi();
  }

  @override
  Widget build(BuildContext context) {
    // final findHospitalProvider = Provider.of<FindHospitalProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find Hospital',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 38, 38),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih provinsi dan kota dimana anda berada lalu temukan rumah sakit yang sesuai.',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const RowDropDownWidget(),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<FindHospitalProvider>(
                builder: (BuildContext context, hospital, Widget? child) {
                  if (hospital.daftarHospital.isNotEmpty) {
                    return ListView.builder(
                      itemCount: hospital.daftarHospital.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.location_city_rounded),
                              title: Text(
                                  hospital.daftarHospital[index].name ?? ""),
                              subtitle: Row(
                                children: [
                                  Text(hospital
                                      .daftarHospital[index].bedAvailability
                                      .toString()),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.hotel),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.open_in_new),
                                onPressed: () {
                                  // hospital.hospitalPhone = hospital.phone ?? "";
                                  Navigator.of(context).pushNamed(
                                      '/detailHospital',
                                      arguments: index);
                                },
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                            )
                          ],
                        );
                      }),
                    );
                  } else {
                    return hospital.isSelected == true
                        ? const Center(
                            child: Text("Maaf, rumah sakit tidak ditemukan."),
                          )
                        : const Center(child: Text("No one selected."));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
