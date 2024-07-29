class PickupZone {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int branchId;

  PickupZone({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.branchId,
  });

  factory PickupZone.fromJson(Map<String, dynamic> json) {
    return PickupZone(
      id: json['id'] as int,
      name: json['name'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      branchId: json['branch_id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'branch_id': branchId,
    };
  }
}
