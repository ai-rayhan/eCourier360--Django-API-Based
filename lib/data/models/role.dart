class Role {
  final int id;
  final String name;
  final DateTime createdAt;
  final List<int> permissions;

  Role({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.permissions,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      permissions: List<int>.from(json['permissions']),
      // permissions: [112,114]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'permissions': permissions,
    };
  }
}
