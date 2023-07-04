class VehicleListing {
  bool? result;
  Products? products;
  Products? upcomingbid;

  VehicleListing({this.result, this.products, this.upcomingbid});

  VehicleListing.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
    upcomingbid = json['upcomingbid'] != null
        ? new Products.fromJson(json['upcomingbid'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    if (this.upcomingbid != null) {
      data['upcomingbid'] = this.upcomingbid!.toJson();
    }
    return data;
  }
}

class Products {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  // Null? prevPageUrl;
  int? to;
  int? total;

  Products(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      // this.prevPageUrl,
      this.to,
      this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    // prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    // data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
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
  String? status;
  int? vehicleIdentificationNumber;
  String? createdAt;
  String? updatedAt;
  String? categoryName;
  String? image;
  String? name;
  int? years;
  int? months;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;

  Data(
      {this.id,
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
      this.status,
      this.vehicleIdentificationNumber,
      this.createdAt,
      this.updatedAt,
      this.categoryName,
      this.image,
      this.name,
      this.years,
      this.months,
      this.days,
      this.hours,
      this.minutes,
      this.seconds});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    status = json['status'];
    vehicleIdentificationNumber = json['vehicle_identification_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryName = json['category_name'];
    image = json['image'];
    name = json['name'];
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
    data['status'] = this.status;
    data['vehicle_identification_number'] = this.vehicleIdentificationNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['category_name'] = this.categoryName;
    data['image'] = this.image;
    data['name'] = this.name;
    data['years'] = this.years;
    data['months'] = this.months;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
