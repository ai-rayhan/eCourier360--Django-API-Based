class Status {
  final int id;
  final String status;
  final String activity;
  final String image;
  final bool publish;
  final DateTime createdAt;
  final DateTime updatedAt;

  Status({
    required this.id,
    required this.status,
    required this.activity,
    required this.image,
    required this.publish,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      status: json['status'],
      activity: json['activity'],
      image: json['image'],
      publish: json['publish'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'activity': activity,
      'image': image,
      'publish': publish,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class ParcelStatus {
  final int id;
  final Status status;
  final String? note;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int parcel;

  ParcelStatus({
    required this.id,
    required this.status,
    this.note,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.parcel,
  });

  factory ParcelStatus.fromJson(Map<String, dynamic> json) {
    return ParcelStatus(
      id: json['id'],
      status: Status.fromJson(json['status']),
      note: json['note'],
      createdBy: json['created_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      parcel: json['parcel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status.toJson(),
      'note': note,
      'created_by': createdBy,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'parcel': parcel,
    };
  }
}
