import 'package:e_courier_360/data/models/common/bank_information.dart';
import 'package:e_courier_360/data/models/common/user.dart';

class Rider {
  int id;
  String fullName;
  String email;
  String phone;
  String address;
  String vehicleType;
  String registrationNumber;
  dynamic riderCommission;
  String? status;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic user;
  final User? userdetails;
  final List<BankInformation>? bankInformation;

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
    this.status,
    this.userdetails,
    this.bankInformation,
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
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'vehicle_type': vehicleType,
      'registration_number': registrationNumber,
      'rider_commission': riderCommission,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user,
       'userdetails': userdetails?.toJson(),
      'bank_information': bankInformation?.map((item) => item.toJson()).toList(),
    };
  }
}
