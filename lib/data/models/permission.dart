class Permission {
  final int id;
  final String codename;
  final String contentTypeAppLabel;
  final String contentTypeModel;
  bool isSelected;

  Permission({
    required this.id,
    required this.codename,
    required this.contentTypeAppLabel,
    required this.contentTypeModel,
    this.isSelected = false,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'],
      codename: json['codename'],
      contentTypeAppLabel: json['content_type_app_label'],
      contentTypeModel: json['content_type_model'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'codename': codename,
      'content_type_app_label': contentTypeAppLabel,
      'content_type_model': contentTypeModel,
      'isSelected': isSelected,
    };
  }
}
