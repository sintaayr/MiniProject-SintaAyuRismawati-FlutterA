class Kota {
  final String id;
  final String? name;

  Kota({
    required this.id,
    required this.name,
  });

  factory Kota.fromJson(Map<String, dynamic> data) {
    final String id = data['id'];
    final String? name = data['name'];
    return Kota(id: id, name: name);
  }
}
