class Shop {
  final int id;
  final String shopName;
  final String shopEmail;
  final String shopAddress;
  final String pickupPhone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;
  final int? pickupZone;

  Shop({
    required this.id,
    required this.shopName,
    required this.shopEmail,
    required this.shopAddress,
    required this.pickupPhone,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    this.pickupZone,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      shopName: json['shop_name'],
      shopEmail: json['shop_email'],
      shopAddress: json['shop_address'],
      pickupPhone: json['pickup_phone'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'],
      pickupZone: json['pickup_zone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shop_name': shopName,
      'shop_email': shopEmail,
      'shop_address': shopAddress,
      'pickup_phone': pickupPhone,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user,
      'pickup_zone': pickupZone,
    };
  }
}
