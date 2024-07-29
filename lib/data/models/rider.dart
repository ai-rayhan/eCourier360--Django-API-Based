class Rider {
  int id;
  String fullName;
  String email;
  String phone;
  String address;
  String vehicleType;
  String registrationNumber;
  dynamic riderCommission;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic user;

  Rider({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.address,
    required this.vehicleType,
    required this.registrationNumber,
    this.riderCommission,
    required this.createdAt,
    required this.updatedAt,
    this.user,
  });

  factory Rider.fromJson(Map<String, dynamic> json) {
    return Rider(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      vehicleType: json['vehicle_type'],
      registrationNumber: json['registration_number'],
      riderCommission: json['rider_commission'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'vehicle_type': vehicleType,
      'registration_number': registrationNumber,
      'rider_commission': riderCommission,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user,
    };
  }
}
