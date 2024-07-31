class DeliveryStatus {
  final int id;
  final String status;
  final String? activity;
  final String? image;
  final int? parcelCount;
  final bool? publish;
  final String? createdAt;
  final String? updatedAt;

  DeliveryStatus( {
    required this.id,
    required this.status,
    this.activity,
    this.image,
    this.parcelCount,
    required this.publish,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeliveryStatus.fromJson(Map<String, dynamic> json) {
    return DeliveryStatus(
      id: json['id'],
      status: json['status'],
      activity: json['activity'] as String?,
      image: json['image'] as String?,
      publish: json['publish']??true,
      parcelCount: json['parcel_count'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['status'] = status;
    data['activity'] = activity;
    data['image'] = image;
    data['publish'] = publish;
    data['created_at'] =createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
