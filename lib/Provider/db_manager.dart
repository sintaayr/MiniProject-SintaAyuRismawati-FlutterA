import 'package:flutter/foundation.dart';

import '../Helper/db_helper.dart';
import '../Model/data_apoinment.dart';

class DbManager extends ChangeNotifier {
  List<DataAppointment> _dataAppoitment = [];
  List<DataAppointment> get dataAppointment => _dataAppoitment;

  late DatabaseHelper _databaseHelper;

  DbManager(){
    _databaseHelper = DatabaseHelper();
    _getAllAppointment();
  }

  void _getAllAppointment() async {
    _dataAppoitment = await _databaseHelper.getAppointmentData();
    notifyListeners();
  }

  Future<void> addAppointment(DataAppointment dataAppointment) async{
    await _databaseHelper.addAppointment(dataAppointment);
    _getAllAppointment();
  }

  // void updateAppointment(DataAppointment dataAppointment) async{
  //   await _databaseHelper.updateAppointment(dataAppointment);
  //   _getAllAppointment();
  // }

  void deleteAppointmentById(String id) async{
    await _databaseHelper.deleteAppointmentById(id);
    _getAllAppointment();
  }
}