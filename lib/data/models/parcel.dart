class Parcel {
  final int id;
  final dynamic issue;
  final int paymentStatus;
  final int driverPaymentStatus;
  final String voucherId;
  final String deliveryCharge;
  final String deliveryAddress;
  final String pickupAddress;
  final String date;
  final dynamic cashCollection;
  final dynamic partialCashCollection;
  final String cod;
  final String parcelEquivalentPrice;
  final dynamic payment;
  final dynamic merchantInvoiceId;
  final dynamic pickupDate;
  final dynamic deliveryDate;
  final dynamic returnDate;
  final dynamic issueNote;
  final dynamic paymentDate;
  final dynamic note;
  final DateTime createdAt;
  final String updatedAt;
  final int merchant;
  final dynamic user;
  final int receiver;
  final dynamic pickupDriver;
  final dynamic driver;
  final dynamic returnDriver;
  final int deliveryStatus;
   int pickupZone;
  final int deliveryZone;
  final int deliveryType;

  Parcel({
    required this.id,
    this.issue,
    required this.paymentStatus,
    required this.driverPaymentStatus,
    required this.voucherId,
    required this.deliveryCharge,
    required this.deliveryAddress,
    required this.pickupAddress,
    required this.date,
    this.cashCollection,
    this.partialCashCollection,
    required this.cod,
    required this.parcelEquivalentPrice,
    this.payment,
    this.merchantInvoiceId,
    this.pickupDate,
    this.deliveryDate,
    this.returnDate,
    this.issueNote,
    this.paymentDate,
    this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.merchant,
    this.user,
    required this.receiver,
    this.pickupDriver,
    this.driver,
    this.returnDriver,
    required this.deliveryStatus,
    required this.pickupZone,
    required this.deliveryZone,
    required this.deliveryType,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) {
    return Parcel(
      id: json['id'] as int,
      issue: json['issue'],
      paymentStatus: json['payment_status'] as int,
      driverPaymentStatus: json['driver_payment_status'] as int,
      voucherId: json['voucher_id'] as String,
      deliveryCharge: json['delivery_charge'] as String,
      deliveryAddress: json['delivery_address'] as String,
      pickupAddress: json['pickup_address']??'1',
      date: json['date'] as String,
      cashCollection: json['cash_collection'],
      partialCashCollection: json['partial_cash_collection'],
      cod: json['cod'].toString(),
      parcelEquivalentPrice: json['parcel_equivalent_price'] as String,
      payment: json['payment'],
      merchantInvoiceId: json['merchant_invoice_id'],
      pickupDate: json['pickup_date'],
      deliveryDate: json['delivery_date'],
      returnDate: json['return_date'],
      issueNote: json['issue_note'],
      paymentDate: json['payment_date'],
      note: json['note'],
      createdAt: DateTime.tryParse(json['created_at'])??DateTime(1999),
      updatedAt: json['updated_at'] as String,
      merchant: json['merchant'] as int,
      user: json['user'],
      receiver: json['receiver'] as int,
      pickupDriver: json['pickup_driver'],
      driver: json['driver'],
      returnDriver: json['return_driver'],
      deliveryStatus: json['delivery_status'] as int,
      pickupZone: json['pickup_zone'] as int,
      deliveryZone: json['delivery_zone'] as int,
      deliveryType: 2,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['issue'] = issue;
    data['payment_status'] = paymentStatus;
    data['driver_payment_status'] = driverPaymentStatus;
    data['voucher_id'] = voucherId;
    data['delivery_charge'] = deliveryCharge;
    data['delivery_address'] = deliveryAddress;
    data['pickup_address'] = pickupAddress;
    data['date'] = date;
    data['cash_collection'] = cashCollection;
    data['partial_cash_collection'] = partialCashCollection;
    data['cod'] = cod;
    data['parcel_equivalent_price'] = parcelEquivalentPrice;
    data['payment'] = payment;
    data['merchant_invoice_id'] = merchantInvoiceId;
    data['pickup_date'] = pickupDate;
    data['delivery_date'] = deliveryDate;
    data['return_date'] = returnDate;
    data['issue_note'] = issueNote;
    data['payment_date'] = paymentDate;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['merchant'] = merchant;
    data['user'] = user;
    data['receiver'] = receiver;
    data['pickup_driver'] = pickupDriver;
    data['driver'] = driver;
    data['return_driver'] = returnDriver;
    data['delivery_status'] = deliveryStatus;
    data['pickup_zone'] = pickupZone;
    data['delivery_zone'] = deliveryZone;
    data['delivery_zone'] = deliveryType;
    return data;
  }
}
