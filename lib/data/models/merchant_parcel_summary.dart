class ParcelSummary {
  final int totalParcel;
  final int approved;
  final int delivery;
  final int partial;
  final int returnReturned;
  final double parcelPrice;
  final double cashCollection;
  final double merchantPaid;
  final double deliveryCharge;

  ParcelSummary({
    required this.totalParcel,
    required this.approved,
    required this.delivery,
    required this.partial,
    required this.returnReturned,
    required this.parcelPrice,
    required this.cashCollection,
    required this.merchantPaid,
    required this.deliveryCharge,
  });

  factory ParcelSummary.fromJson(Map<String, dynamic> json) {
    return ParcelSummary(
      totalParcel: json['total_parcel'],
      approved: json['approved'],
      delivery: json['delivery'],
      partial: json['partial'],
      returnReturned: json['return_returned'],
      parcelPrice: (json['parcel_price'] ?? 0).toDouble(),
      cashCollection: (json['cash_collection'] ?? 0).toDouble(),
      merchantPaid: (json['merchant_paid'] ?? 0).toDouble(),
      deliveryCharge: (json['delivery_charge'] ?? 0).toDouble(),
    );
  }
}
