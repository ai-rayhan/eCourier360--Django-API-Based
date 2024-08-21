class MerchantSettlement {
  final int id;
  final String date;
  final int totalParcel;
  final String voucherId;
  final String? invoiceId;
  final String paymentInfo;
  final String note;
  final String totalPayment;
  final String totalCharge;
  final String totalCod;
  final String totalParcelAmount;
  final String createdAt;
  final String updatedAt;
  final int merchant;
  final int paymentMethod;

  MerchantSettlement({
    required this.id,
    required this.date,
    required this.totalParcel,
    required this.voucherId,
    this.invoiceId,
    required this.paymentInfo,
    required this.note,
    required this.totalPayment,
    required this.totalCharge,
    required this.totalCod,
    required this.totalParcelAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.merchant,
    required this.paymentMethod,
  });

  factory MerchantSettlement.fromJson(Map<String, dynamic> json) {
    return MerchantSettlement(
      id: json['id'],
      date: json['date'],
      totalParcel: json['total_parcel'],
      voucherId: json['voucher_id'],
      invoiceId: json['invoice_id'],
      paymentInfo: json['payment_info'],
      note: json['note'],
      totalPayment: json['total_payment'],
      totalCharge: json['total_charge'],
      totalCod: json['total_cod'],
      totalParcelAmount: json['total_parcel_amount'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      merchant: json['merchant'],
      paymentMethod: json['payment_method'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'total_parcel': totalParcel,
      'voucher_id': voucherId,
      'invoice_id': invoiceId,
      'payment_info': paymentInfo,
      'note': note,
      'total_payment': totalPayment,
      'total_charge': totalCharge,
      'total_cod': totalCod,
      'total_parcel_amount': totalParcelAmount,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'merchant': merchant,
      'payment_method': paymentMethod,
    };
  }
}
