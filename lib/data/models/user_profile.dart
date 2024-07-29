class User {
  String email;
  String username;
  String fullName;
  String? photo;
  String phoneNumber;
  String address;
  String? role;

  User({
    required this.email,
    required this.username,
    this.fullName = "",
    this.photo,
    this.phoneNumber = "",
    this.address = "",
    this.role,
  });

  // Factory constructor to create a User from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      username: json['username'],
      fullName: json['full_name'] ?? "",
      photo: json['photo'],
      phoneNumber: json['phone_number'] ?? "",
      address: json['address'] ?? "",
      role: json['role'],
    );
  }

  // Method to convert a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'full_name': fullName,
      'photo': photo,
      'phone_number': phoneNumber,
      'address': address,
      'role': role,
    };
  }
}
