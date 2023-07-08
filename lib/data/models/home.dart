class Home {
  bool? result;
  NextAccutionTime? nextAccutionTime;
  List<CurrentlyRunning>? currentlyRunning;
  List<SaleVehicles>? saleVehicles;
  List<BidVehicles>? bidVehicles;
  List<Tags>? tags;

  Home(
      {this.result,
      this.nextAccutionTime,
      this.currentlyRunning,
      this.saleVehicles,
      this.bidVehicles,
      this.tags});

  Home.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    nextAccutionTime = json['next_accution_time'] != null
        ? NextAccutionTime.fromJson(json['next_accution_time'])
        : null;
    if (json['currently_running'] != null) {
      currentlyRunning = <CurrentlyRunning>[];
      json['currently_running'].forEach((v) {
        currentlyRunning!.add(CurrentlyRunning.fromJson(v));
      });
    }
    if (json['sale_vehicles'] != null) {
      saleVehicles = <SaleVehicles>[];
      json['sale_vehicles'].forEach((v) {
        saleVehicles!.add(SaleVehicles.fromJson(v));
      });
    }
    if (json['bid_vehicles'] != null) {
      bidVehicles = <BidVehicles>[];
      json['bid_vehicles'].forEach((v) {
        bidVehicles!.add(BidVehicles.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (nextAccutionTime != null) {
      data['next_accution_time'] = nextAccutionTime!.toJson();
    }
    if (currentlyRunning != null) {
      data['currently_running'] =
          currentlyRunning!.map((v) => v.toJson()).toList();
    }
    if (saleVehicles != null) {
      data['sale_vehicles'] = saleVehicles!.map((v) => v.toJson()).toList();
    }
    if (bidVehicles != null) {
      data['bid_vehicles'] = bidVehicles!.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextAccutionTime {
  String? nextStartTime;
  String? nextEndTime;
  String? years;
  String? months;
  String? days;
  String? hours;
  String? minutes;
  String? seconds;
  String? label;

  NextAccutionTime(
      {this.nextStartTime,
      this.nextEndTime,
      this.years,
      this.months,
      this.days,
      this.hours,
      this.minutes,
      this.seconds,
      this.label});

  NextAccutionTime.fromJson(Map<String, dynamic> json) {
    nextStartTime = json['next_start_time'];
    nextEndTime = json['next_end_time'];
    years = json['years'];
    months = json['months'];
    days = json['days'];
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next_start_time'] = nextStartTime;
    data['next_end_time'] = nextEndTime;
    data['years'] = years;
    data['months'] = months;
    data['days'] = days;
    data['hours'] = hours;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
    data['label'] = label;
    return data;
  }
}

class CurrentlyRunning {
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
  String? image;

  CurrentlyRunning(
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
      this.image});

  CurrentlyRunning.fromJson(Map<String, dynamic> json) {
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
    image = json['image'];
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
    data['image'] = image;
    return data;
  }
}

class SaleVehicles {
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
  var starttime;
  var endtime;
  var minimumbitamount;
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
  String? image;

  SaleVehicles(
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
      this.image});

  SaleVehicles.fromJson(Map<String, dynamic> json) {
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
    image = json['image'];
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
    data['image'] = image;
    return data;
  }
}

class BidVehicles {
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
  String? image;
  int? years;
  int? months;
  int? days;
  int? hours;
  int? minutes;
  int? seconds;

  BidVehicles(
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
      this.image,
      this.years,
      this.months,
      this.days,
      this.hours,
      this.minutes,
      this.seconds});

  BidVehicles.fromJson(Map<String, dynamic> json) {
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
    image = json['image'];
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
    data['image'] = image;
    data['years'] = years;
    data['months'] = months;
    data['days'] = days;
    data['hours'] = hours;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
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
