class Vehicledetails {
  bool? result;
  Vehicle? vehicle;
  Vehiclespecification? vehiclespecification;
  List<Similarproducts>? similarproducts;
  List<Productimages>? productimages;
  List<Interiors>? interiors;
  List<Exteriors>? exteriors;
  List<Acs>? acs;
  List<void>? certifieds;
  List<void>? replacements;
  List<void>? oilchange;
  List<Brands>? brands;
  String? bodyImage;

  Vehicledetails(
      {this.result,
      this.vehicle,
      this.vehiclespecification,
      this.similarproducts,
      this.productimages,
      this.interiors,
      this.exteriors,
      this.acs,
      this.certifieds,
      this.replacements,
      this.oilchange,
      this.brands,
      this.bodyImage});

  Vehicledetails.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    vehicle =
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
    vehiclespecification = json['vehiclespecification'] != null
        ? Vehiclespecification.fromJson(json['vehiclespecification'])
        : null;
    if (json['similarproducts'] != null) {
      similarproducts = <Similarproducts>[];
      json['similarproducts'].forEach((v) {
        similarproducts!.add(Similarproducts.fromJson(v));
      });
    }
    if (json['productimages'] != null) {
      productimages = <Productimages>[];
      json['productimages'].forEach((v) {
        productimages!.add(Productimages.fromJson(v));
      });
    }
    if (json['interiors'] != null) {
      interiors = <Interiors>[];
      json['interiors'].forEach((v) {
        interiors!.add(Interiors.fromJson(v));
      });
    }
    if (json['exteriors'] != null) {
      exteriors = <Exteriors>[];
      json['exteriors'].forEach((v) {
        exteriors!.add(Exteriors.fromJson(v));
      });
    }
    if (json['acs'] != null) {
      acs = <Acs>[];
      json['acs'].forEach((v) {
        acs!.add(Acs.fromJson(v));
      });
    }
    // if (json['certifieds'] != null) {
    //   certifieds = <Null>[];
    //   json['certifieds'].forEach((v) {
    //     certifieds!.add(void.fromJson(v));
    //   });
    // }
    // if (json['replacements'] != null) {
    //   replacements = <Null>[];
    //   json['replacements'].forEach((v) {
    //     replacements!.add(void.fromJson(v));
    //   });
    // }
    // if (json['oilchange'] != null) {
    //   oilchange = <Null>[];
    //   json['oilchange'].forEach((v) {
    //     oilchange!.add(void.fromJson(v));
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
    if (similarproducts != null) {
      data['similarproducts'] =
          similarproducts!.map((v) => v.toJson()).toList();
    }
    if (productimages != null) {
      data['productimages'] = productimages!.map((v) => v.toJson()).toList();
    }
    if (interiors != null) {
      data['interiors'] = interiors!.map((v) => v.toJson()).toList();
    }
    if (exteriors != null) {
      data['exteriors'] = exteriors!.map((v) => v.toJson()).toList();
    }
    if (acs != null) {
      data['acs'] = acs!.map((v) => v.toJson()).toList();
    }
    // if (certifieds != null) {
    //   data['certifieds'] = certifieds!.map((v) => v.toJson()).toList();
    // }
    // if (replacements != null) {
    //   data['replacements'] = replacements!.map((v) => v.toJson()).toList();
    // }
    // if (oilchange != null) {
    //   data['oilchange'] = oilchange!.map((v) => v.toJson()).toList();
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
  String? productimage;
  String? years;
  String? months;
  // String? days;
  // String? hours;
  // String? minutes;
  // String? seconds;

  Vehicle({
    this.id,
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
    this.productimage,
    this.years,
    this.months,
    // this.days,
    // this.hours,
    // this.minutes,
    // this.seconds
  });

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
    tagIds = json['tag_ids'];
    fitnessupto = json['fitnessupto'];
    location = json['location'];
    status = json['status'];
    vehicleIdentificationNumber = json['vehicle_identification_number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productimage = json['productimage'];
    years = json['years'];
    months = json['months'];
    // days = json['days'];
    // hours = json['hours'];
    // minutes = json['minutes'];
    // seconds = json['seconds'];
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
    data['productimage'] = productimage;
    data['years'] = years;
    data['months'] = months;
    // data['days'] = days;
    // data['hours'] = hours;
    // data['minutes'] = minutes;
    // data['seconds'] = seconds;
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

class Similarproducts {
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
  void starttime;
  void endtime;
  void minimumbitamount;
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
  String? productimage;
  // String? years;
  // String? months;
  // String? days;
  // String? hours;
  // String? minutes;
  // String? seconds;

  Similarproducts({
    this.id,
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
    this.productimage,
    // this.years,
    // this.months,
    // this.days,
    // this.hours,
    // this.minutes,
    // this.seconds
  });

  Similarproducts.fromJson(Map<String, dynamic> json) {
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
    productimage = json['productimage'];
    // years = json['years'];
    // months = json['months'];
    // days = json['days'];
    // hours = json['hours'];
    // minutes = json['minutes'];
    // seconds = json['seconds'];
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
    // data['starttime'] = starttime;
    // data['endtime'] = endtime;
    // data['minimumbitamount'] = minimumbitamount;
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
    data['category_name'] = categoryName;
    data['productimage'] = productimage;
    // data['years'] = years;
    // data['months'] = months;
    // data['days'] = days;
    // data['hours'] = hours;
    // data['minutes'] = minutes;
    // data['seconds'] = seconds;
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

class Interiors {
  int? id;
  String? productId;
  String? interiorText;
  int? interiorRating;
  String? interiorImage;
  String? createdAt;
  String? updatedAt;

  Interiors(
      {this.id,
      this.productId,
      this.interiorText,
      this.interiorRating,
      this.interiorImage,
      this.createdAt,
      this.updatedAt});

  Interiors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    interiorText = json['interior_text'];
    interiorRating = json['interior_rating'];
    interiorImage = json['interior_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['interior_text'] = interiorText;
    data['interior_rating'] = interiorRating;
    data['interior_image'] = interiorImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Exteriors {
  int? id;
  String? productId;
  String? exteriorText;
  int? exteriorRating;
  String? exteriorImage;
  String? createdAt;
  String? updatedAt;

  Exteriors(
      {this.id,
      this.productId,
      this.exteriorText,
      this.exteriorRating,
      this.exteriorImage,
      this.createdAt,
      this.updatedAt});

  Exteriors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    exteriorText = json['exterior_text'];
    exteriorRating = json['exterior_rating'];
    exteriorImage = json['exterior_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['exterior_text'] = exteriorText;
    data['exterior_rating'] = exteriorRating;
    data['exterior_image'] = exteriorImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Acs {
  int? id;
  String? productId;
  String? acText;
  int? acRating;
  String? acImage;
  String? createdAt;
  String? updatedAt;

  Acs(
      {this.id,
      this.productId,
      this.acText,
      this.acRating,
      this.acImage,
      this.createdAt,
      this.updatedAt});

  Acs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    acText = json['ac_text'];
    acRating = json['ac_rating'];
    acImage = json['ac_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['ac_text'] = acText;
    data['ac_rating'] = acRating;
    data['ac_image'] = acImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
