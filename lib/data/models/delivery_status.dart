class DeliveryStatus {
  final int id;
  final String status;
  final String? activity;
  final String? image;
  final int? totalBooking;
  final bool publish;
  final String createdAt;
  final String updatedAt;

  DeliveryStatus( {
    required this.id,
    required this.status,
    this.activity,
    this.image,
    this.totalBooking,
    required this.publish,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeliveryStatus.fromJson(Map<String, dynamic> json) {
    return DeliveryStatus(
      id: json['id'] as int,
      status: json['status'] as String,
      activity: json['activity'] as String?,
      image: json['image'] as String?,
      publish: json['publish'] as bool,
      totalBooking: 5,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
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
