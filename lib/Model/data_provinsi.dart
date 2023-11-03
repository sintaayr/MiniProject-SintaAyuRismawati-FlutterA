import 'dart:convert';
import 'package:dio/dio.dart';

class Provinsi {
  final String id;
  final String? name;

  Provinsi({
    required this.id,
    required this.name,
  });

  static Future<List<Provinsi>> getProvinsi() async {
    final response = await Dio()
        .get('https://rs-bed-covid-api.vercel.app/api/get-provinces');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.data);
      final List<dynamic> provinces = jsonResponse['provinces'];
      List<Provinsi> provinceList = [];

      for (var data in provinces) {
        final String id = data['id'];
        final String? name = data['name'];
        final Provinsi provinsi = Provinsi(id: id, name: name);
        provinceList.add(provinsi);
      }
      return provinceList;
    } else {
      return [];
    }
  }
}
