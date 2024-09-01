class RiderSettlement {
  final int id;
  final String date;
  final int totalParcel;
  final String voucherId;
  final String? invoiceId;
  final String paymentInfo;
  final String? note;
  final String totalPayment;
  final String totalCod;
  final String totalDeliveryCharge;
  final String totalCommission;
  final String createdAt;
  final String updatedAt;
  final int rider;
  final int paymentMethod;
  final String createdBy;

  RiderSettlement({
    required this.id,
    required this.date,
    required this.totalParcel,
    required this.voucherId,
    this.invoiceId,
    required this.paymentInfo,
    this.note,
    required this.totalPayment,
    required this.totalCod,
    required this.totalDeliveryCharge,
    required this.totalCommission,
    required this.createdAt,
    required this.updatedAt,
    required this.rider,
    required this.paymentMethod,
    required this.createdBy,
  });

  factory RiderSettlement.fromJson(Map<String, dynamic> json) {
    return RiderSettlement(
      id: json['id'],
      date: json['date'],
      totalParcel: json['total_parcel'],
      voucherId: json['voucher_id'],
      invoiceId: json['invoice_id'],
      paymentInfo: json['payment_info'],
      note: json['note'],
      totalPayment: json['total_payment'],
      totalCod: json['total_cod'],
      totalDeliveryCharge: json['total_delivery_charge'],
      totalCommission: json['total_commission'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      rider: json['rider'],
      paymentMethod: json['payment_method'],
      createdBy: json['created_by'],
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
      'total_cod': totalCod,
      'total_delivery_charge': totalDeliveryCharge,
      'total_commission': totalCommission,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'rider': rider,
      'payment_method': paymentMethod,
      'created_by': createdBy,
    };
  }
}
