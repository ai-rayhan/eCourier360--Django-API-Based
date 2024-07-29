class Merchant {
  String merchantName;
  String businessContactInfo;
  String businessAddress;
  int user;

  Merchant({
    required this.merchantName,
    required this.businessContactInfo,
    required this.businessAddress,
    required this.user,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      merchantName: json['merchant_name'],
      businessContactInfo: json['bussiness_contact_info'],
      businessAddress: json['bussiness_address'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'merchant_name': merchantName,
      'bussiness_contact_info': businessContactInfo,
      'bussiness_address': businessAddress,
      'user': user,
    };
  }
}
