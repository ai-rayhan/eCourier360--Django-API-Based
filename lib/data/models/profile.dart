class UserProfile {
  final bool status;
  final String message;
  final UserDataDetails? data;

  UserProfile({required this.status, required this.message, this.data});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      status: json['status'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] != null ? UserDataDetails.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserDataDetails {
  final String? refresh;
  final String? access;
  final String email;
  final String name;
  final String phone;
  final int? role;
  final String? fullName;
  final String? address;
  final String? photoUrl;
  final bool isPhoneVerified;
  final bool isActive;

  UserDataDetails({
    this.refresh,
    this.access,
    required this.email,
    required this.name,
    required this.phone,
    this.role,
    this.fullName,
    this.address,
    this.photoUrl,
    required this.isPhoneVerified,
    required this.isActive,
  });

  factory UserDataDetails.fromJson(Map<String, dynamic> json) {
    return UserDataDetails(
      refresh: json['refresh'],
      access: json['access'],
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      role: json['role'],
      fullName: json['full_name'],
      address: json['address'],
      photoUrl: json['photo_url'],
      isPhoneVerified: json['is_phone_verified'] ?? false,
      isActive: json['is_active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = refresh;
    data['access'] = access;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['role'] =role;
    data['full_name'] = fullName;
    data['address'] = address;
    data['photo_url'] = photoUrl;
    data['is_phone_verified'] = isPhoneVerified;
    data['is_active'] = isActive;
    return data;
  }
}
