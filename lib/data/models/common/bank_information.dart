
class BankInformation {
  final int id;
  final String bankName;
  final String accountNumber;
  final String accountName;
  final String branch;
  final String mobileNo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;
  final int paymentMethod;

  BankInformation({
    required this.id,
    required this.bankName,
    required this.accountNumber,
    required this.accountName,
    required this.branch,
    required this.mobileNo,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
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
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'],
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
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user,
      'payment_method': paymentMethod,
    };
  }
}
