class User {
  int id;
  String username;
  String email;
  String phoneNumber;

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

class BankInformation {
  int id;
  String bankName;
  String accountNumber;
  String accountName;
  String branch;
  String mobileNo;
  int userId;
  int paymentMethod;

  BankInformation({
    required this.id,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.branch,
    required this.mobileNo,
    required this.userId,
    required this.paymentMethod,
  });

  factory BankInformation.fromJson(Map<String, dynamic> json) {
    return BankInformation(
      id: json['id'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      accountName: json['account_name'],
      branch: json['branch'],
      mobileNo: json['mobile_no'],
      userId: json['user'],
      paymentMethod: json['payment_method'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bank_name': bankName,
      'account_number': accountNumber,
      'account_name': accountName,
      'branch': branch,
      'mobile_no': mobileNo,
      'user': userId,
      'payment_method': paymentMethod,
    };
  }
}

class Merchant {
  int id;
  User user;
  String shopName;
  String pickupPhone;
  String shopAddress;
  String pickupAddress;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<BankInformation> bankInformation;

  Merchant({
    required this.id,
    required this.user,
    required this.shopName,
    required this.pickupPhone,
    required this.shopAddress,
    required this.pickupAddress,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.bankInformation,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      id: json['id'],
      user: User.fromJson(json['user']),
      shopName: json['shop_name'],
      pickupPhone: json['pickup_phone'],
      shopAddress: json['shop_address'],
      pickupAddress: json['pickup_address'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      bankInformation: (json['bank_information'] as List)
          .map((i) => BankInformation.fromJson(i))
          .toList(),
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
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'bank_information':
          bankInformation.map((bankInfo) => bankInfo.toJson()).toList(),
    };
  }
}
