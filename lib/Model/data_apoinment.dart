class DataAppointment {
  late String id;
  String? namaRS;
  String? alamatRS;
  String? telpRS;
  String? namaPasien;
  String? alamatPasien;
  String? umurPasien;
  String? tanggalAppointment;
  String? keluhanPasien;

  DataAppointment({
    required this.id,
    required this.namaRS,
    required this.alamatRS,
    required this.telpRS,
    required this.namaPasien,
    required this.alamatPasien,
    required this.umurPasien,
    required this.tanggalAppointment,
    required this.keluhanPasien,
  });

  Map<String, dynamic> toMap(){
    return{
      'id' : id,
      'namaRS' : namaRS,
      'alamatRS' : alamatRS,
      'telpRS' : telpRS,
      'namaPasien' : namaPasien,
      'alamatPasien' : alamatPasien,
      'umurPasien' : umurPasien,
      'tanggalAppointment' : tanggalAppointment,
      'keluhanPasien' : keluhanPasien
    };
  }

  DataAppointment.fromMap(Map<String, dynamic> map){
    id = map['id'];
    namaRS = map['namaRS'];
    alamatRS = map['alamatRS'];
    telpRS = map['telpRS'];
    namaPasien = map['namaPasien'];
    alamatPasien = map['alamatPasien'];
    umurPasien = map['umurPasien'];
    tanggalAppointment = map['tanggalAppointment'];
    keluhanPasien = map['keluhanPasien'];
  }
}
