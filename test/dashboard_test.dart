import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_connect/Page/dashboard.dart';
import 'package:hospital_connect/Widget/dashboard/card_menu.dart';

void main() {
  testWidgets("Judul appbar : Hospital Connect", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    expect(find.widgetWithText(AppBar, "Hospital Connect"), findsOneWidget);
  });

  testWidgets("Gambar di atas deskripsi dashboard sesuai", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    expect(
        find.widgetWithImage(SizedBox, const AssetImage("assets/doctor.png")),
        findsOneWidget);
  });

  testWidgets("Deskripsi dashboard sesuai", (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    expect(
        find.text(
            "Temukan dan pesan pelayanan kesehatan dengan mudah. Prioritaskan kesehatan anda dengan layanan kami."),
        findsOneWidget);
  });

  testWidgets("Judul, deskripsi dan gambar card menu find hospital sesuai",
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );

    final cardMenu = tester.widget<CardMenuWidget>(
        find.widgetWithText(CardMenuWidget, "FIND A HOSPITAL"));
    expect(cardMenu.imageAsset, "assets/map.png");
    expect(cardMenu.desc,
        "Cari lokasi dan informasi rumah sakit. Temukan Fasilitas perawatan kesehatan yang tepat.");
  });

  testWidgets(
      "Judul, deskripsi dan gambar card menu appointment schedule sesuai",
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardPage(),
    ));

    await tester.fling(find.byType(ListView), const Offset(0, -200), 3000);
    await tester.pump();

    final cardMenu = tester.widget<CardMenuWidget>(
        find.widgetWithText(CardMenuWidget, "APPOINTMENT SCHEDULE"));
    expect(cardMenu.imageAsset, "assets/schedule.png");
    expect(cardMenu.desc, "Lihat jadwal appointmentmu jangan sampai terlewat");
  });

  testWidgets(
      "Terdapat icon home dan chat pada bottomnavigationbar dengan label sesuai",
      (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DashboardPage(),
    ));

    expect(
        find.widgetWithIcon(BottomNavigationBar, Icons.home), findsOneWidget);
    expect(find.widgetWithIcon(BottomNavigationBar, Icons.question_answer),
        findsOneWidget);
  });
}
