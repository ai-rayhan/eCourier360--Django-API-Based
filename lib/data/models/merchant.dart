import 'package:e_courier_360/data/models/common/bank_information.dart';
import 'package:e_courier_360/data/models/common/user.dart';

class Merchant {
  final int id;
  final String shopName;
  final String pickupPhone;
  final String shopAddress;
  final String? pickupAddress;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;
  final User? userdetails;
  final List<BankInformation>? bankInformation;

  Merchant({
    required this.id,
    required this.shopName,
    required this.pickupPhone,
    required this.shopAddress,
    this.pickupAddress,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    this.userdetails,
    this.bankInformation,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      id: json['id'],
      shopName: json['shop_name'],
      pickupPhone: json['pickup_phone'],
      shopAddress: json['shop_address'],
      pickupAddress: json['pickup_address'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'],
      userdetails: json['userdetails'] != null ? User.fromJson(json['userdetails']) : null,
      bankInformation: json['bank_information'] != null
          ? (json['bank_information'] as List).map((item) => BankInformation.fromJson(item)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shop_name': shopName,
      'pickup_phone': pickupPhone,
      'shop_address': shopAddress,
      'pickup_address': pickupAddress,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user,
      'userdetails': userdetails?.toJson(),
      'bank_information': bankInformation?.map((item) => item.toJson()).toList(),
    };
  }
}
