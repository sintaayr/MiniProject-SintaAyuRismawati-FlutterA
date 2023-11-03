import 'package:shared_preferences/shared_preferences.dart';

// int angkaId = 1;

class SharedPreference{
Future<void> addAngkaId(int angkaId) async {
   SharedPreferences sharedPreference = await SharedPreferences.getInstance();
   sharedPreference.setInt('angkaId', angkaId);
}

Future<int> readAngkaId() async{
   SharedPreferences sharedPreference = await SharedPreferences.getInstance();
   return sharedPreference.getInt('angkaId') ?? 0;
}
}