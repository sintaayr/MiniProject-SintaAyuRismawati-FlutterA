import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../Model/data_hospital.dart';
import '../Model/data_kota.dart';
import '../Model/data_provinsi.dart';

class FindHospitalProvider extends ChangeNotifier {
  String _labelDdProvinsi = 'Provinsi';
  String _labelDdKota = 'Kota';
  String _provinceId = "";
  String _cityId = "";
  String _hospitalId = "";
  String _hospitalName = "";
  String _hospitalAddress = "";
  String _hospitalPhone = "";
  bool _isSelected = false;

  List<Provinsi> _daftarProvinsi = [];
  List<Kota> _daftarKota = [];
  List<Hospital> _daftarHospital = [];

  String get labelDdProvinsi => _labelDdProvinsi;
  String get labelDdKota => _labelDdKota;
  String get provinceId => _provinceId;
  String get cityId => _cityId;
  String get hospitalId => _hospitalId;
  String get hospitalName => _hospitalName;
  String get hospitalAddress => _hospitalAddress;
  String get hospitalPhone => _hospitalPhone;
  bool get isSelected => _isSelected;

  List<Provinsi> get daftarProvinsi => _daftarProvinsi;
  List<Kota> get daftarKota => _daftarKota;
  List<Hospital> get daftarHospital => _daftarHospital;

  getProvinsi() async {
    final provinsi = await Provinsi.getProvinsi();
    _daftarProvinsi = provinsi;
    notifyListeners();
  }

  Future<List<Kota>> getKota() async {
    final response = await Dio().get(
        'https://rs-bed-covid-api.vercel.app/api/get-cities?provinceid=$_provinceId');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.data);
      final List<dynamic> cities = jsonResponse['cities'];

      List<Kota> cityList = [];

      for (var data in cities) {
        cityList.add(Kota.fromJson(data));
      }
      _daftarKota = cityList;
      notifyListeners();
      return daftarKota;
    } else {
      return [];
    }
  }

  Future<List<Hospital>> getHospital() async {
    final response = await Dio().get(
        'https://rs-bed-covid-api.vercel.app/api/get-hospitals?provinceid=$_provinceId&cityid=$_cityId&type=1');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.data);
      final List<dynamic> hospitals = jsonResponse['hospitals'];

      List<Hospital> hospitalList = [];

      for (var data in hospitals) {
        hospitalList.add(Hospital.fromJson(data));
      }
      _daftarHospital = hospitalList;
      notifyListeners();
      return daftarHospital;
    } else {
      return [];
    }
  }

  set provinceId(String id) {
    _provinceId = id;
    notifyListeners();
  }

  set cityId(String id) {
    _cityId = id;
    notifyListeners();
  }

  set hospitalId(String id) {
    _hospitalId = id;
    notifyListeners();
  }

  set hospitalPhone(String phone) {
    _hospitalPhone = phone;
    notifyListeners();
  }

  set labelDdProvinsi(String labelDdProvinsi) {
    _labelDdProvinsi = labelDdProvinsi;
    notifyListeners();
  }

  set labelDdKota(String labelDdKota) {
    _labelDdKota = labelDdKota;
    notifyListeners();
  }

  set hospitalName(String hospitalName) {
    _hospitalName = hospitalName;
    notifyListeners();
  }

  set hospitalAddress(String hospitalAddress) {
    _hospitalAddress = hospitalAddress;
    notifyListeners();
  }

  set isSelected(bool isSelected){
    _isSelected=isSelected;
    notifyListeners();
  }
}