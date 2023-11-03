import 'package:flutter/material.dart';

class MakeAppointmentProvider extends ChangeNotifier {
  int _angkaId = 0;

  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _umurController = TextEditingController();
  final _tanggalController = TextEditingController();
  final _keluhanController = TextEditingController();
  bool _isComplete = true;

  int get angkaId => _angkaId;

  TextEditingController get namaController => _namaController;
  TextEditingController get alamatController => _alamatController;
  TextEditingController get umurController => _umurController;
  TextEditingController get tanggalController => _tanggalController;
  TextEditingController get keluhanController => _keluhanController;
  bool get isComplete => _isComplete;

  void clear() {
    _namaController.clear();
    _alamatController.clear();
    _umurController.clear();
    _tanggalController.clear();
    _keluhanController.clear();
    notifyListeners();
  }

  void cekTextField() {
    _namaController.text.isEmpty ||
            _alamatController.text.isEmpty ||
            _umurController.text.isEmpty ||
            _tanggalController.text.isEmpty ||
            _keluhanController.text.isEmpty
        ? isComplete = false
        : isComplete = true;
  }

  void tambahAngkaId() {
    _angkaId = _angkaId + 1;
    notifyListeners();
  }

  set angkaId(int angkaId) {
    _angkaId = angkaId;
    notifyListeners();
  }

  set isComplete(bool isComplete) {
    _isComplete = isComplete;
    notifyListeners();
  }
}
