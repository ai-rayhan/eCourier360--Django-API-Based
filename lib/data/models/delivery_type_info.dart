class DeliveryInfo {
  final int? id;
  final String deliveryType;
  final String? timeSlot;
  final String estimatedDays;
  final double basicCharge;
  final double perKgWeight;
  final double perHeight;
  final double perWidth;
  final double cashCollectionChargePercent;
  final String? createdAt;
  final String? updatedAt;

  DeliveryInfo({
    this.id,
    required this.deliveryType,
    this.timeSlot,
    required this.estimatedDays,
    required this.basicCharge,
    required this.perKgWeight,
    required this.perHeight,
    required this.perWidth,
    required this.cashCollectionChargePercent,
     this.createdAt,
     this.updatedAt,
  });

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) {
    return DeliveryInfo(
      id: json['id'],
      deliveryType: json['delivery_type']??'',
      timeSlot: json['time_slot']??'',
      estimatedDays: json['estimated_days']??'',
      basicCharge:  double.tryParse(json['basic_charge']??'')??0 ,
      perKgWeight: double.tryParse(json['per_kg_weight']??'')??0 ,
      perHeight: double.tryParse(json['per_inch_height']??'')??0,
      perWidth:  double.tryParse(json['per_inch_width']??'') ??0,
      cashCollectionChargePercent: double.tryParse(json['cash_collection_charge_percent']??'')??0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'delivery_type': deliveryType,
      'time_slot': timeSlot,
      'estimated_days': estimatedDays,
      'basic_charge': basicCharge.toString(),
      'per_kg_weight': perKgWeight.toString(),
      'per_inch_height': perHeight.toString(),
      'per_inch_width': perWidth.toString(),
      'cash_collection_charge_percent': cashCollectionChargePercent.toString(),
    };
  }
}
