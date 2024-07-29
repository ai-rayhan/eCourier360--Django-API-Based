class Category {
  final int id;
  final String title;
  final int? parent;
  final List<Category>? children;
  final String createdAt;
  final String updatedAt;

  Category({
    required this.id,
    required this.title,
    this.parent,
    this.children,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int,
    title: json['title']??'',
    parent: json['parent'] as int?,
    children: (json['children'] as List<dynamic>?)
        ?.map((childJson) => Category.fromJson(childJson as Map<String, dynamic>))
        .toList(),
    createdAt: json['created_at'] as String, 
    updatedAt: json['updated_at'] as String 
  );
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'title': title,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
    if (parent != null) {
      data['parent'] = parent;
    }
    if (children != null) {
      data['children'] = children!.map((child) => child.toJson()).toList();
    }
    return data;
  }
}
