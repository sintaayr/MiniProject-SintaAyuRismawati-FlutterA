class Hospital {
  final String id;
  final String? name;
  final String? address;
  final String? phone;
  final int? bedAvailability;

  Hospital(
      {required this.id,
      required this.name,
      required this.address,
      required this.phone,
      required this.bedAvailability});

  factory Hospital.fromJson(Map<String, dynamic> data) {
    final String id = data['id'];
    final String? name = data['name'];
    final String? address = data['address'];
    final String? phone = data['phone'];
    final int? bedAvailability = data['bed_availability'];
    return Hospital(
        id: id,
        name: name,
        address: address,
        phone: phone,
        bedAvailability: bedAvailability);
  }
}
