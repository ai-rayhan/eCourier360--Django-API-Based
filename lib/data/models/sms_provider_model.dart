class SmsProvider {
  final int id;
  final String smsProvider;
  final String? accountSid;
  final String? authToken;
  final String? fromNumber;
  final String? apiKey;
  final String? senderId;
  final bool status;

  SmsProvider({
    required this.id,
    required this.smsProvider,
    this.accountSid,
    this.authToken,
    this.fromNumber,
    this.apiKey,
    this.senderId,
    required this.status,
  });

  factory SmsProvider.fromJson(Map<String, dynamic> json) {
    return SmsProvider(
      id: json['id'],
      smsProvider: json['sms_provider'],
      accountSid: json['account_sid'],
      authToken: json['auth_token'],
      fromNumber: json['from_number'],
      apiKey: json['api_key'],
      senderId: json['sender_id'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sms_provider': smsProvider,
      'account_sid': accountSid,
      'auth_token': authToken,
      'from_number': fromNumber,
      'api_key': apiKey,
      'sender_id': senderId,
      'status': status,
    };
  }
}
