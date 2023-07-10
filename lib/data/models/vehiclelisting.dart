class VehicleListing {
  bool? result;
  List<Tags>? tags;
  Products? products;
  Products? upcomingbid;

  VehicleListing({this.result, this.tags, this.products, this.upcomingbid});

  VehicleListing.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
    products =
        json['products'] != null ? Products.fromJson(json['products']) : null;
    upcomingbid = json['upcomingbid'] != null && json['upcomingbid'].isNotEmpty
        ? Products.fromJson(json['upcomingbid'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.toJson();
    }
    if (upcomingbid != null) {
      data['upcomingbid'] = upcomingbid!.toJson();
    }
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Tags({this.id, this.name, this.createdAt, this.updatedAt});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
  var prevPageUrl;
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
      this.prevPageUrl,
      this.to,
      this.total});

  Products.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
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
  int? interiorRating;
  int? exteriorRating;
  int? engineRating;
  int? damageRating;
  int? acRating;
  int? otherRating;
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
      this.interiorRating,
      this.exteriorRating,
      this.engineRating,
      this.damageRating,
      this.acRating,
      this.otherRating,
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
    interiorRating = json['interior_rating'];
    exteriorRating = json['exterior_rating'];
    engineRating = json['engine_rating'];
    damageRating = json['damage_rating'];
    acRating = json['ac_rating'];
    otherRating = json['other_rating'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['vehicletype'] = vehicletype;
    data['category_id'] = categoryId;
    data['brand_id'] = brandId;
    data['vehicle_name'] = vehicleName;
    data['description'] = description;
    data['fueltype'] = fueltype;
    data['owner'] = owner;
    data['modelyear'] = modelyear;
    data['mileage'] = mileage;
    data['gearshift'] = gearshift;
    data['price'] = price;
    data['starttime'] = starttime;
    data['endtime'] = endtime;
    data['minimumbitamount'] = minimumbitamount;
    data['seo_url'] = seoUrl;
    data['registration'] = registration;
    data['insurance'] = insurance;
    data['rto'] = rto;
    data['taxupto'] = taxupto;
    data['tag_ids'] = tagIds;
    data['fitnessupto'] = fitnessupto;
    data['location'] = location;
    data['status'] = status;
    data['vehicle_identification_number'] = vehicleIdentificationNumber;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['interior_rating'] = interiorRating;
    data['exterior_rating'] = exteriorRating;
    data['engine_rating'] = engineRating;
    data['damage_rating'] = damageRating;
    data['ac_rating'] = acRating;
    data['other_rating'] = otherRating;
    data['category_name'] = categoryName;
    data['image'] = image;
    data['name'] = name;
    data['years'] = years;
    data['months'] = months;
    data['days'] = days;
    data['hours'] = hours;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
