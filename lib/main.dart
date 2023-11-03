import 'package:flutter/material.dart';
import 'package:hospital_connect/Provider/health_care_provider.dart';
import 'package:provider/provider.dart';
import 'Page/appoinment_schedule.dart';
import 'Page/health_care.dart';
import 'Page/dashboard.dart';
import 'Page/detail_appointment.dart';
import 'Page/detail_hospital.dart';
import 'Page/find_hospital.dart';
import 'Page/make_appoinment.dart';
import 'Provider/db_manager.dart';
import 'Provider/find_hospital_provider.dart';
import 'Provider/make_appointment_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FindHospitalProvider()),
        ChangeNotifierProvider(create: (_) => MakeAppointmentProvider()),
        ChangeNotifierProvider(create: (_) => DbManager()),
        ChangeNotifierProvider(create: (_) => HealthCareProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(),
        '/findHospital': (context) => const FindHospitalPage(),
        '/detailHospital': (context) => const DetailHospitalPage(),
        '/makeAppoinment': (context) => const MakeAppointmentPage(),
        '/appointmentSchedule': (context) => const AppointmentSchedulePage(),
        '/detailAppointment': (context) => const DetailAppointmentPage(),
        '/askMe': (context) => const AskMePage()
      },
    );
  }
}
