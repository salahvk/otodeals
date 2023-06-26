class Home {
  bool? result;
  NextAccutionTime? nextAccutionTime;
  List<CurrentlyRunning>? currentlyRunning;
  List<SaleVehicles>? saleVehicles;
  List<BidVehicles>? bidVehicles;

  Home(
      {this.result,
      this.nextAccutionTime,
      this.currentlyRunning,
      this.saleVehicles,
      this.bidVehicles});

  Home.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    nextAccutionTime = json['next_accution_time'] != null
        ? new NextAccutionTime.fromJson(json['next_accution_time'])
        : null;
    if (json['currently_running'] != null) {
      currentlyRunning = <CurrentlyRunning>[];
      json['currently_running'].forEach((v) {
        currentlyRunning!.add(new CurrentlyRunning.fromJson(v));
      });
    }
    if (json['sale_vehicles'] != null) {
      saleVehicles = <SaleVehicles>[];
      json['sale_vehicles'].forEach((v) {
        saleVehicles!.add(new SaleVehicles.fromJson(v));
      });
    }
    if (json['bid_vehicles'] != null) {
      bidVehicles = <BidVehicles>[];
      json['bid_vehicles'].forEach((v) {
        bidVehicles!.add(new BidVehicles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.nextAccutionTime != null) {
      data['next_accution_time'] = this.nextAccutionTime!.toJson();
    }
    if (this.currentlyRunning != null) {
      data['currently_running'] =
          this.currentlyRunning!.map((v) => v.toJson()).toList();
    }
    if (this.saleVehicles != null) {
      data['sale_vehicles'] =
          this.saleVehicles!.map((v) => v.toJson()).toList();
    }
    if (this.bidVehicles != null) {
      data['bid_vehicles'] = this.bidVehicles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NextAccutionTime {
  String? years;
  String? months;
  String? days;
  String? hours;
  String? minutes;
  String? seconds;
  String? label;

  NextAccutionTime(
      {this.years,
      this.months,
      this.days,
      this.hours,
      this.minutes,
      this.seconds,
      this.label});

  NextAccutionTime.fromJson(Map<String, dynamic> json) {
    years = json['years'];
    months = json['months'];
    days = json['days'];
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['years'] = this.years;
    data['months'] = this.months;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    data['label'] = this.label;
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
  String? fitnessupto;
  String? location;
  String? status;
  String? createdAt;
  String? updatedAt;
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
      this.fitnessupto,
      this.location,
      this.status,
      this.createdAt,
      this.updatedAt,
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
    fitnessupto = json['fitnessupto'];
    location = json['location'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
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
    data['fitnessupto'] = this.fitnessupto;
    data['location'] = this.location;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
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
  Null starttime;
  Null endtime;
  Null minimumbitamount;
  String? seoUrl;
  String? registration;
  String? insurance;
  String? rto;
  String? taxupto;
  String? fitnessupto;
  String? location;
  String? status;
  String? createdAt;
  String? updatedAt;
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
      this.fitnessupto,
      this.location,
      this.status,
      this.createdAt,
      this.updatedAt,
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
    fitnessupto = json['fitnessupto'];
    location = json['location'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
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
    data['fitnessupto'] = this.fitnessupto;
    data['location'] = this.location;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
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
  String? fitnessupto;
  String? location;
  String? status;
  String? createdAt;
  String? updatedAt;
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
      this.fitnessupto,
      this.location,
      this.status,
      this.createdAt,
      this.updatedAt,
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
    fitnessupto = json['fitnessupto'];
    location = json['location'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
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
    data['fitnessupto'] = this.fitnessupto;
    data['location'] = this.location;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['years'] = this.years;
    data['months'] = this.months;
    data['days'] = this.days;
    data['hours'] = this.hours;
    data['minutes'] = this.minutes;
    data['seconds'] = this.seconds;
    return data;
  }
}
