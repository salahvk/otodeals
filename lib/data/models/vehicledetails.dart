class Vehicledetails {
  bool? result;
  Vehicle? vehicle;
  Vehiclespecification? vehiclespecification;
  // List? similarproducts;
  List<Productimages>? productimages;
  // List? interiors;
  // List? exteriors;
  // List? acs;
  // List? certifieds;
  // List? replacements;
  // List? oilchange;
  List<Brands>? brands;
  String? bodyImage;

  Vehicledetails(
      {this.result,
      this.vehicle,
      this.vehiclespecification,
      // this.similarproducts,
      this.productimages,
      // this.interiors,
      // this.exteriors,
      // this.acs,
      // this.certifieds,
      // this.replacements,
      // this.oilchange,
      this.brands,
      this.bodyImage});

  Vehicledetails.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    vehicle =
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
    vehiclespecification = json['vehiclespecification'] != null
        ?  Vehiclespecification.fromJson(json['vehiclespecification'])
        : null;
    // if (json['similarproducts'] != null) {
    //   similarproducts = <Null>[];
    //   json['similarproducts'].forEach((v) {
    //     similarproducts!.add(new fromJson(v));
    //   });
    // }
    if (json['productimages'] != null) {
      productimages = <Productimages>[];
      json['productimages'].forEach((v) {
        productimages!.add(Productimages.fromJson(v));
      });
    }
    // if (json['interiors'] != null) {
    //   interiors = <Null>[];
    //   json['interiors'].forEach((v) {
    //     interiors!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['exteriors'] != null) {
    //   exteriors = <Null>[];
    //   json['exteriors'].forEach((v) {
    //     exteriors!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['acs'] != null) {
    //   acs = <Null>[];
    //   json['acs'].forEach((v) {
    //     acs!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['certifieds'] != null) {
    //   certifieds = <Null>[];
    //   json['certifieds'].forEach((v) {
    //     certifieds!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['replacements'] != null) {
    //   replacements = <Null>[];
    //   json['replacements'].forEach((v) {
    //     replacements!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['oilchange'] != null) {
    //   oilchange = <Null>[];
    //   json['oilchange'].forEach((v) {
    //     oilchange!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
    bodyImage = json['body_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    if (vehiclespecification != null) {
      data['vehiclespecification'] = vehiclespecification!.toJson();
    }
    // if (this.similarproducts != null) {
    //   data['similarproducts'] =
    //       this.similarproducts!.map((v) => v.toJson()).toList();
    // }
    if (productimages != null) {
      data['productimages'] =
          productimages!.map((v) => v.toJson()).toList();
    }
    // if (this.interiors != null) {
    //   data['interiors'] = this.interiors!.map((v) => v.toJson()).toList();
    // }
    // if (this.exteriors != null) {
    //   data['exteriors'] = this.exteriors!.map((v) => v.toJson()).toList();
    // }
    // if (this.acs != null) {
    //   data['acs'] = this.acs!.map((v) => v.toJson()).toList();
    // }
    // if (this.certifieds != null) {
    //   data['certifieds'] = this.certifieds!.map((v) => v.toJson()).toList();
    // }
    // if (this.replacements != null) {
    //   data['replacements'] = this.replacements!.map((v) => v.toJson()).toList();
    // }
    // if (this.oilchange != null) {
    //   data['oilchange'] = this.oilchange!.map((v) => v.toJson()).toList();
    // }
    if (brands != null) {
      data['brands'] = brands!.map((v) => v.toJson()).toList();
    }
    data['body_image'] = bodyImage;
    return data;
  }
}

class Vehicle {
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
  String? productimage;
  // String? years;
  // String? months;
  // String? days;
  // int? hours;
  // int? minutes;
  // int? seconds;
  String? label;

  Vehicle(
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
      this.productimage,
      // this.years,
      // this.months,
      // this.days,
      // this.hours,
      // this.minutes,
      // this.seconds,
      this.label});

  Vehicle.fromJson(Map<String, dynamic> json) {
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
    productimage = json['productimage'];
    // years = json['years'];
    // months = json['months'];
    // days = json['days'];
    // hours = int.parse(json['hours']);
    // minutes = int.parse(json['minutes']);
    // seconds = int.parse(json['seconds']);
    label = json['label'];
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
    data['fitnessupto'] = fitnessupto;
    data['location'] = location;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['productimage'] = productimage;
    // data['years'] = this.years;
    // data['months'] = this.months;
    // data['days'] = this.days;
    // data['hours'] = this.hours.toString();
    // data['minutes'] = this.minutes.toString();
    // data['seconds'] = this.seconds.toString();
    data['label'] = label;
    return data;
  }
}

class Vehiclespecification {
  int? id;
  String? productId;
  String? frontbumper;
  String? frontbonnet;
  String? frontwindshield;
  String? roof;
  String? backwindshield;
  String? trunk;
  String? backbumper;
  String? frontlefttire;
  String? frontrighttire;
  String? frontleftdoor;
  String? frontrightdoor;
  String? backleftdoor;
  String? backrightdoor;
  String? backlefttyre;
  String? backrighttyre;
  String? createdAt;
  String? updatedAt;

  Vehiclespecification(
      {this.id,
      this.productId,
      this.frontbumper,
      this.frontbonnet,
      this.frontwindshield,
      this.roof,
      this.backwindshield,
      this.trunk,
      this.backbumper,
      this.frontlefttire,
      this.frontrighttire,
      this.frontleftdoor,
      this.frontrightdoor,
      this.backleftdoor,
      this.backrightdoor,
      this.backlefttyre,
      this.backrighttyre,
      this.createdAt,
      this.updatedAt});

  Vehiclespecification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    frontbumper = json['frontbumper'];
    frontbonnet = json['frontbonnet'];
    frontwindshield = json['frontwindshield'];
    roof = json['roof'];
    backwindshield = json['backwindshield'];
    trunk = json['trunk'];
    backbumper = json['backbumper'];
    frontlefttire = json['frontlefttire'];
    frontrighttire = json['frontrighttire'];
    frontleftdoor = json['frontleftdoor'];
    frontrightdoor = json['frontrightdoor'];
    backleftdoor = json['backleftdoor'];
    backrightdoor = json['backrightdoor'];
    backlefttyre = json['backlefttyre'];
    backrighttyre = json['backrighttyre'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['frontbumper'] = frontbumper;
    data['frontbonnet'] = frontbonnet;
    data['frontwindshield'] = frontwindshield;
    data['roof'] = roof;
    data['backwindshield'] = backwindshield;
    data['trunk'] = trunk;
    data['backbumper'] = backbumper;
    data['frontlefttire'] = frontlefttire;
    data['frontrighttire'] = frontrighttire;
    data['frontleftdoor'] = frontleftdoor;
    data['frontrightdoor'] = frontrightdoor;
    data['backleftdoor'] = backleftdoor;
    data['backrightdoor'] = backrightdoor;
    data['backlefttyre'] = backlefttyre;
    data['backrighttyre'] = backrighttyre;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Productimages {
  int? id;
  int? productId;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? productimage;

  Productimages(
      {this.id,
      this.productId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.productimage});

  Productimages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productimage = json['productimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['productimage'] = productimage;
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  Brands({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
