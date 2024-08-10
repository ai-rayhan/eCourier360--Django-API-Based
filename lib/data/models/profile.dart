
class UserProfile {
  bool status;
  String message;
  UserDataDetails data;

  UserProfile({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      status: json['status'],
      message: json['message'],
      data: UserDataDetails.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UserDataDetails {
  String refresh;
  String access;
  int id;
  String email;
  String name;
  String phone;
  int role;
  int? merchantId;
  int? riderId;
  int? receiverId;
  String fullName;
  String address;
  String? photoUrl;
  bool isPhoneVerified;
  bool isActive;

  UserDataDetails({
    required this.refresh,
    required this.access,
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.role,
    this.merchantId,
    this.riderId,
    this.receiverId,
    required this.fullName,
    required this.address,
    this.photoUrl,
    required this.isPhoneVerified,
    required this.isActive,
  });

  factory UserDataDetails.fromJson(Map<String, dynamic> json) {
    return UserDataDetails(
      refresh: json['refresh'],
      access: json['access'],
      id: json['id']??0,
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      role: json['role'],
      merchantId: json['merchant_id'],
      riderId: json['rider_id'],
      receiverId: json['receiver_id'],
      fullName: json['full_name'],
      address: json['address']??'',
      photoUrl: json['photo_url'],
      isPhoneVerified: json['is_phone_verified'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refresh': refresh,
      'access': access,
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'role': role,
      'merchant_id': merchantId,
      'rider_id': riderId,
      'receiver_id': receiverId,
      'full_name': fullName,
      'address': address,
      'photo_url': photoUrl,
      'is_phone_verified': isPhoneVerified,
      'is_active': isActive,
    };
  }
}

// class UserProfile {
//   final bool status;
//   final String message;
//   final UserDataDetails? data;

//   UserProfile({required this.status, required this.message, this.data});

//   factory UserProfile.fromJson(Map<String, dynamic> json) {
//     return UserProfile(
//       status: json['status'] ?? false,
//       message: json['message'] ?? "",
//       data: json['data'] != null ? UserDataDetails.fromJson(json['data']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class UserDataDetails {
//   final String? refresh;
//   final String? access;
//   final String email;
//   final String name;
//   final String phone;
//   final int? role;
//   final int? id;
//   final String? fullName;
//   final String? address;
//   final String? photoUrl;
//   final bool isPhoneVerified;
//   final bool isActive;

//   UserDataDetails({
//     this.refresh,
//     this.access,
//     required this.email,
//     required this.name,
//     required this.phone,
//     this.role,
//     this.id,
//     this.fullName,
//     this.address,
//     this.photoUrl,
//     required this.isPhoneVerified,
//     required this.isActive,
//   });

//   factory UserDataDetails.fromJson(Map<String, dynamic> json) {
//     return UserDataDetails(
//       refresh: json['refresh'],
//       access: json['access'],
//       email: json['email'] ?? "",
//       name: json['name'] ?? "",
//       phone: json['phone'] ?? "",
//       role: json['role'],
//       id: json['id'],
//       fullName: json['full_name'],
//       address: json['address'],
//       photoUrl: json['photo_url'],
//       isPhoneVerified: json['is_phone_verified'] ?? false,
//       isActive: json['is_active'] ?? false,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['refresh'] = refresh;
//     data['access'] = access;
//     data['email'] = email;
//     data['name'] = name;
//     data['phone'] = phone;
//     data['role'] =role;
//     data['full_name'] = fullName;
//     data['address'] = address;
//     data['photo_url'] = photoUrl;
//     data['is_phone_verified'] = isPhoneVerified;
//     data['is_active'] = isActive;
//     return data;
//   }
// }
