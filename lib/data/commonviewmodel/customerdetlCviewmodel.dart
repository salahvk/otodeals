class customerCommonViewModel {
  final int? id;
  final String? name;
  final String? email;
  final String? createdAt;
  final String? updatedAt;
  final String? isApproved;
  final int? userId;
  final String? deviceId;
  final String? apiToken;
  final String? apiTokenExpiry;

  customerCommonViewModel({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.isApproved,
    this.userId,
    this.deviceId,
    this.apiToken,
    this.apiTokenExpiry,
  });

  factory customerCommonViewModel.fromJson(Map<String, dynamic> json) {
    return customerCommonViewModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isApproved: json['is_approved'],
      userId: json['user_id'],
      deviceId: json['device_id'],
      apiToken: json['api_token'],
      apiTokenExpiry: json['api_token_expiry'],
    );
  }
}