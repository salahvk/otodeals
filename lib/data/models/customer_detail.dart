class CustomerDDetails {
  int? id;
  String? name;
  String? email;
  
  String? createdAt;
  String? updatedAt;

  String? isApproved;
  int? userId;
  String? deviceId;
  String? apiToken;
  String? apiTokenExpiry;

  CustomerDDetails(
      {this.id,
      this.name,
      this.email,
     
      this.createdAt,
      this.updatedAt,
    
      this.isApproved,
      this.userId,
      this.deviceId,
      this.apiToken,
      this.apiTokenExpiry});

  CustomerDDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
 
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
 
    isApproved = json['is_approved'];
    userId = json['user_id'];
    deviceId = json['device_id'];
    apiToken = json['api_token'];
    apiTokenExpiry = json['api_token_expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
   
    data['is_approved'] = isApproved;
    data['user_id'] = userId;
    data['device_id'] = deviceId;
    data['api_token'] = apiToken;
    data['api_token_expiry'] = apiTokenExpiry;
    return data;
  }
}
