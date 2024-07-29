class Receiver {
  final int id;
  final String name;
  final String? email;
  final String phone;
  final String address;
  final String createdAt;
  final String updatedAt;
  final int? user;
  final int? merchant;

  Receiver({
    required this.id,
    required this.name,
    this.email,
    required this.phone,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
    this.user,
    this.merchant,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) {
    return Receiver(
      id: json['id'],
      name: json['name']??"",
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: json['user'],
      merchant: json['merchant'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user': user,
      'merchant': merchant,
    };
  }
}
