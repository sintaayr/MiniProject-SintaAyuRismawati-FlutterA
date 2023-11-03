import 'package:flutter/material.dart';
import '../Widget/dashboard/card_menu.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    // int selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 38, 38),
        title: const Center(
          child: Text(
            "Hospital Connect",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          Center(
            child: SizedBox(
              height: 153,
              width: 115,
              child: Image.asset(
                'assets/doctor.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Temukan dan pesan pelayanan kesehatan dengan mudah. Prioritaskan kesehatan anda dengan layanan kami.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CardMenuWidget(
            onTap: () {
              Navigator.of(context).pushNamed('/findHospital');
            },
            title: "FIND A HOSPITAL",
            desc:
                'Cari lokasi dan informasi rumah sakit. Temukan Fasilitas perawatan kesehatan yang tepat.',
            imageAsset: "assets/map.png",
          ),
          const SizedBox(height: 10),
          CardMenuWidget(
              key: const Key("appointmentSchedule"),
              onTap: () {
                Navigator.of(context).pushNamed('/appointmentSchedule');
              },
              title: "APPOINTMENT SCHEDULE",
              desc: 'Lihat jadwal appointmentmu jangan sampai terlewat',
              imageAsset: "assets/schedule.png")
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: 'Healt Care')
        ],
        selectedItemColor: const Color.fromARGB(255, 207, 38, 38),
        unselectedItemColor: const Color.fromARGB(255, 207, 38, 38),
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/healthCare');
          }
        },
      ),
    );
  }
}
