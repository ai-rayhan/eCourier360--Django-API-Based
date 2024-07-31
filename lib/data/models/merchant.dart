
class User {
  final int id;
  final String username;
  final String email;
  final String phoneNumber;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone_number': phoneNumber,
    };
  }
}

class Merchant {
  final int id;
  final User user;
  final String shopName;
  final String pickupPhone;
  final String shopAddress;
  final String? pickupAddress;
  final DateTime createdAt;
  final DateTime updatedAt;

  Merchant({
    required this.id,
    required this.user,
    required this.shopName,
    required this.pickupPhone,
    required this.shopAddress,
    this.pickupAddress,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      id: json['id'],
      user: User.fromJson(json['user']),
      shopName: json['shop_name'],
      pickupPhone: json['pickup_phone'],
      shopAddress: json['shop_address'],
      pickupAddress: json['pickup_address'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'shop_name': shopName,
      'pickup_phone': pickupPhone,
      'shop_address': shopAddress,
      'pickup_address': pickupAddress,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
