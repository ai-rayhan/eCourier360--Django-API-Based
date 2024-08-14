import 'package:intl/intl.dart';

class Payment {
  final int id;
  final DateTime date;
  final int totalParcel;
  final String voucherId;
  final int? invoiceId;
  final String paymentInfo;
  final String note;
  final double totalPayment;
  final double totalCharge;
  final double totalCod;
  final double totalParcelAmount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int merchant;
  final int paymentMethod;

  Payment({
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

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      date: DateTime.parse(json['date']),
      totalParcel: json['total_parcel'],
      voucherId: json['voucher_id'],
      invoiceId: json['invoice_id'],
      paymentInfo: json['payment_info'],
      note: json['note'],
      totalPayment: double.parse(json['total_payment']),
      totalCharge: double.parse(json['total_charge']),
      totalCod: double.parse(json['total_cod']),
      totalParcelAmount: double.parse(json['total_parcel_amount']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      merchant: json['merchant'],
      paymentMethod: json['payment_method'],
    );
  }

  Map<String, dynamic> toJson() {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final DateFormat dateTimeFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSSSSZ');
    return {
      'id': id,
      'date': dateFormatter.format(date),
      'total_parcel': totalParcel,
      'voucher_id': voucherId,
      'invoice_id': invoiceId,
      'payment_info': paymentInfo,
      'note': note,
      'total_payment': totalPayment.toStringAsFixed(2),
      'total_charge': totalCharge.toStringAsFixed(2),
      'total_cod': totalCod.toStringAsFixed(2),
      'total_parcel_amount': totalParcelAmount.toStringAsFixed(2),
      'created_at': dateTimeFormatter.format(createdAt),
      'updated_at': dateTimeFormatter.format(updatedAt),
      'merchant': merchant,
      'payment_method': paymentMethod,
    };
  }
}
