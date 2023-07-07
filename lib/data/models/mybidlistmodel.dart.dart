class Bidhistory {
  bool? result;
  List<BidHistory>? bidHistory;

  Bidhistory({this.result, this.bidHistory});

  Bidhistory.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['bid_history'] != null) {
      bidHistory = <BidHistory>[];
      json['bid_history'].forEach((v) {
        bidHistory!.add(new BidHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.bidHistory != null) {
      data['bid_history'] = this.bidHistory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BidHistory {
  int? id;
  String? userId;
  int? bidprice;
  int? productId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? vehicletype;
  int? categoryId;
  int? brandId;
  String? vehicleName;
  String? description;
  String? fueltype;
  int? owner;
  int? modelyear;
  int? mileage;
  String? gearshift;
  int? price;
  String? starttime;
  String? endtime;
  int? minimumbitamount;
  String? seoUrl;
  String? registration;
  String? insurance;
  String? rto;
  String? taxupto;
  String? tagIds;
  String? fitnessupto;
  String? location;
  int? vehicleIdentificationNumber;
  String? image;
  int? highestBidprice;
  String? label;
  int? years;
  int? months;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;

  BidHistory(
      {this.id,
      this.userId,
      this.bidprice,
      this.productId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.vehicletype,
      this.categoryId,
      this.brandId,
      this.vehicleName,
      this.description,
      this.fueltype,
      this.owner,
      this.modelyear,
      this.mileage,
      this.gearshift,
      this.price,
      this.starttime,
      this.endtime,
      this.minimumbitamount,
      this.seoUrl,
      this.registration,
      this.insurance,
      this.rto,
      this.taxupto,
      this.tagIds,
      this.fitnessupto,
      this.location,
      this.vehicleIdentificationNumber,
      this.image,
      this.highestBidprice,
      this.label,
      this.years,
      this.months,
      this.days,
      this.hours,
      this.minutes,
      this.seconds});

  BidHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bidprice = json['bidprice'];
    productId = json['product_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    vehicletype = json['vehicletype'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    vehicleName = json['vehicle_name'];
    description = json['description'];
    fueltype = json['fueltype'];
    owner = json['owner'];
    modelyear = json['modelyear'];
    mileage = json['mileage'];
    gearshift = json['gearshift'];
    price = json['price'];
    starttime = json['starttime'];
    endtime = json['endtime'];
    minimumbitamount = json['minimumbitamount'];
    seoUrl = json['seo_url'];
    registration = json['registration'];
    insurance = json['insurance'];
    rto = json['rto'];
    taxupto = json['taxupto'];
    tagIds = json['tag_ids'];
    fitnessupto = json['fitnessupto'];
    location = json['location'];
    vehicleIdentificationNumber = json['vehicle_identification_number'];
    image = json['image'];
    highestBidprice = json['highest_bidprice'];
    label = json['label'];
    years = json['years'];
    months = json['months'];
    days = json['days'];
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['bidprice'] = this.bidprice;
    data['product_id'] = this.productId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    data['vehicletype'] = this.vehicletype;
    data['category_id'] = this.categoryId;
    data['brand_id'] = this.brandId;
    data['vehicle_name'] = this.vehicleName;
    data['description'] = this.description;
    data['fueltype'] = this.fueltype;
    data['owner'] = this.owner;
    data['modelyear'] = this.modelyear;
    data['mileage'] = this.mileage;
    data['gearshift'] = this.gearshift;
    data['price'] = this.price;
    data['starttime'] = this.starttime;
    data['endtime'] = this.endtime;
    data['minimumbitamount'] = this.minimumbitamount;
    data['seo_url'] = this.seoUrl;
    data['registration'] = this.registration;
    data['insurance'] = this.insurance;
    data['rto'] = this.rto;
    data['taxupto'] = this.taxupto;
    data['tag_ids'] = this.tagIds;
    data['fitnessupto'] = this.fitnessupto;
    data['location'] = this.location;
    data['vehicle_identification_number'] = this.vehicleIdentificationNumber;
    data['image'] = this.image;
    data['highest_bidprice'] = this.highestBidprice;
    data['label'] = this.label;
    data['years'] = this.years;
    data['months'] = this.months;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    return data;
  }
}
