import 'package:flutter/material.dart';
// import 'dart:convert';

class Post {
  final String? title;
  final String? date;
  final String? id_certificate;
  final String? color_valid;
  final String? date_until;
  List<StatusCertificate>? status_certificate;
  List<CertificateList>? certificate_list;

  Post({
    @required this.title,
    @required this.date,
    this.id_certificate,
    this.color_valid,
    this.date_until,
    this.status_certificate,
    this.certificate_list,
    });

    factory Post.fromJson(Map<String, dynamic> json) {
      return Post(
        date: json['date'] as String,
        title: json['title']['rendered'] as String,
        id_certificate: json['acf']['id_certificate'] as String,
        color_valid: json['acf']['color_valid'] as String,
        date_until: json['acf']['date_until'] as String,
        status_certificate: json['acf']['status_certificate'] != null ? (json['acf']['status_certificate'] as List).map((i) => StatusCertificate.fromJson(i)).toList() : null,
        certificate_list: json['acf']['certificate_list'] != null ? (json['acf']['certificate_list'] as List).map((i) => CertificateList.fromJson(i)).toList() : null,
      );
    }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['title']['rendered'] = this.title;
    data['acf']['id_certificate'] = this.id_certificate;
    data['acf']['color_valid'] = this.color_valid;
    data['acf']['date_until'] = this.date_until;
    data['acf']['status_certificate'] = this.status_certificate;
    data['acf']['certificate_list'] = this.certificate_list;
    return data;
  }
}

class CertificateList {
  final String? certificate_image;
  final String? certificate_pdf;

  CertificateList({this.certificate_image, this.certificate_pdf});

  factory CertificateList.fromJson(Map<String, dynamic> json) {
    return CertificateList(
      certificate_image: json['certificate_image']['url'],
      certificate_pdf: json['certificate_pdf'] != false ? json['certificate_pdf'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['certificate_image']['url'] = this.certificate_image;
    data['certificate_pdf'] = this.certificate_pdf;
    return data;
  }
}

class ServicesHotels {
  final String? iconServicesHotels;
  final String? descriptionServicesHotels;

  ServicesHotels({this.iconServicesHotels, this.descriptionServicesHotels});

  factory ServicesHotels.fromJson(Map<String, dynamic> json) {
    return ServicesHotels(
      iconServicesHotels: json['icon_services_hotels']['url'],
      descriptionServicesHotels: json['description_services_hotels'] != false ? json['description_services_hotels'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon_services_hotels']['url'] = this.iconServicesHotels;
    data['description_services_hotels'] = this.descriptionServicesHotels;
    return data;
  }
}

class MuslimFriendlyStatus {
  final String? label;

  MuslimFriendlyStatus({this.label});

  factory MuslimFriendlyStatus.fromJson(Map<String, dynamic> json) {
    return MuslimFriendlyStatus(
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class StatusCertificate {
  final String? label;

  StatusCertificate({this.label});

  factory StatusCertificate.fromJson(Map<String, dynamic> json) {
    return StatusCertificate(
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class ENumbersData {
  String number;
  String name;
  String group;
  String description;
  String status;

  ENumbersData(this.number, this.name, this.group, this.description, this.status);

  ENumbersData.fromList(List<String> items) : this(items[0], items[1], items[2], items[3], items[4]);

  @override
  String toString() {
    return 'ENumbersData{number: $number, name: $name, group: $group, description: $description, status: $status}';
  }
}

class CategoriesProducts {
  final String? category_product;

  CategoriesProducts({this.category_product});

  factory CategoriesProducts.fromJson(Map<String, dynamic> json) {
    return CategoriesProducts(
      category_product: json['category_product'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_product'] = this.category_product;
    return data;
  }
}

class Product {
  List<CategoriesProducts>? categories_products;

  Product({
    this.categories_products,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      categories_products: json['acf']['categories_products'] != null ? (json['acf']['categories_products'] as List).map((i) => CategoriesProducts.fromJson(i)).toList() : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acf']['categories_products'] = this.categories_products;
    return data;
  }
}

class AddressHotels {
  String? address;
  double? lat;
  double? lng;
  double? zoom;
  String? placeId;
  String? streetNumber;
  String? streetName;
  String? city;
  String? state;
  String? postCode;
  String? country;
  String? countryShort;

  AddressHotels({
    this.address,
    this.lat,
    this.lng,
    this.zoom,
    this.placeId,
    this.streetNumber,
    this.streetName,
    this.city,
    this.state,
    this.postCode,
    this.country,
    this.countryShort,
  });

  factory AddressHotels.fromJson(Map<String, dynamic> json) =>
      AddressHotels(
        address: json["address"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        zoom: json["zoom"].toDouble(),
        placeId: json["place_id"],
        streetNumber: json["street_number"],
        streetName: json["street_name"],
        city: json["city"],
        state: json["state"],
        postCode: json["post_code"],
        country: json["country"],
        countryShort: json["country_short"],
      );

  Map<String, dynamic> toJson() =>
      {
        "address": address,
        "lat": lat,
        "lng": lng,
        "zoom": zoom,
        "place_id": placeId,
        "street_number": streetNumber,
        "street_name": streetName,
        "city": city,
        "state": state,
        "post_code": postCode,
        "country": country,
        "country_short": countryShort
      };
}

class Hotels {
  final String? idCertificate;
  final String? dateUntil;
  final String? nameOfHotels;
  final String? hotelStars;
  final String? muslimFriendly;
  final String? descriptionHotels;
  AddressHotels? addressHotels;
  LogoHotels? logoHotels;
  List<GalleryHotel>? galleryHotels;
  ContactsHotels? contactsHotels;
  List<LanguagesHotel>? languagesHotels;
  List<StatusCertificate>? statusCertificate;
  List<CertificateList>? certificateList;
  List<MuslimFriendlyStatus>? muslimFriendlyStatus;
  List<ServicesHotels>? servicesHotels;

  Hotels({
    this.idCertificate,
    this.dateUntil,
    this.nameOfHotels,
    this.hotelStars,
    this.muslimFriendly,
    this.descriptionHotels,
    this.addressHotels,
    this.logoHotels,
    this.galleryHotels,
    this.contactsHotels,
    this.languagesHotels,
    this.statusCertificate,
    this.certificateList,
    this.muslimFriendlyStatus,
    this.servicesHotels,
  });

  factory Hotels.fromJson(Map<String, dynamic> json) {
    return Hotels(
      idCertificate: json['acf']['id_certificate'] as String,
      dateUntil: json['acf']['date_until'] as String,
      nameOfHotels: json['acf']['name_of_hotel'] as String,
      hotelStars: json['acf']['hotel_stars'] as String,
      muslimFriendly: json['acf']['hotel_stars'] as String,
      descriptionHotels: json['acf']['description_hotels'] as String,
      addressHotels: json['acf']["address_hotels_"] != null ? AddressHotels.fromJson(json['acf']["address_hotels_"]) : null,
      logoHotels: json['acf']["logo_hotels"] != null ? LogoHotels.fromJson(json['acf']["logo_hotels"]) : null,
      galleryHotels: json['acf']["logo_hotels"] != null ? (json['acf']['gallery_hotels'] as List).map((i) => GalleryHotel.fromJson(i)).toList() : null,
      contactsHotels: json['acf']["contacts_hotels"] != null ? ContactsHotels.fromJson(json['acf']["contacts_hotels"]) : null,
      languagesHotels: json['acf']["languages_hotels"] != null ? (json['acf']['languages_hotels'] as List).map((i) => LanguagesHotel.fromJson(i)).toList() : null,
      statusCertificate: json['acf']["status_certificate"] != null ? (json['acf']['status_certificate'] as List).map((i) => StatusCertificate.fromJson(i)).toList() : null,
      certificateList: json['acf']['certificate_list'] != null ? (json['acf']['certificate_list'] as List).map((i) => CertificateList.fromJson(i)).toList() : null,
      muslimFriendlyStatus: json['acf']["muslim_friendly_status"] != null ? (json['acf']['muslim_friendly_status'] as List).map((i) => MuslimFriendlyStatus.fromJson(i)).toList() : null,
      servicesHotels: json['acf']['services_hotels'] != null ? (json['acf']['services_hotels'] as List).map((i) => ServicesHotels.fromJson(i)).toList() : null,

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acf']['id_certificate'] = this.idCertificate;
    data['acf']['date_until'] = this.dateUntil;
    data['acf']['name_of_hotel'] = this.nameOfHotels;
    data['acf']['hotel_stars'] = this.hotelStars;
    data['acf']['muslim_friendly'] = this.muslimFriendly;
    data['acf']['description_hotels'] = this.descriptionHotels;
    data['acf']['address_hotels_'] = this.addressHotels;
    data['acf']['logo_hotels_'] = this.logoHotels;
    data['acf']['gallery_hotels'] = this.galleryHotels;
    data['acf']['contacts_hotels'] = this.contactsHotels;
    data['acf']['languages_hotels'] = this.languagesHotels;
    data['acf']['status_certificate'] = this.statusCertificate;
    data['acf']['certificate_list'] = this.certificateList;
    data['acf']['muslim_friendly_status'] = this.muslimFriendlyStatus;

    return data;
  }
}

class GalleryHotel {
  final String? imageHotels;

  GalleryHotel({
    this.imageHotels,
  });

  factory GalleryHotel.fromJson(Map<String, dynamic> json) {
    return GalleryHotel(
      imageHotels: json['image_hotels']['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_hotels']['url'] = this.imageHotels;
    return data;
  }
}

class ContactsHotels {
  String? emailHotels;
  String? phoneHotels;
  String? additionalFieldHotels;

  ContactsHotels({
    this.emailHotels,
    this.phoneHotels,
    this.additionalFieldHotels,
  });

  factory ContactsHotels.fromJson(Map<String, dynamic> json) => ContactsHotels(
    emailHotels: json["email_hotels"],
    phoneHotels: json["phone_hotels"],
    additionalFieldHotels: json["additional_field_hotels"],
  );

  Map<String, dynamic> toJson() => {
    "email_hotels": emailHotels,
    "phone_hotels": phoneHotels,
    "additional_field_hotels": additionalFieldHotels,
  };
}

class LanguagesHotel {
  String? languageHotels;

  LanguagesHotel({
    this.languageHotels,
  });

  factory LanguagesHotel.fromJson(Map<String, dynamic> json) => LanguagesHotel(
    languageHotels: json["language_hotels"],
  );

  Map<String, dynamic> toJson() => {
    "language_hotels": languageHotels,
  };
}

class LogoHotels {
  String? url;
  int? width;
  int? height;

  LogoHotels({
    this.url,
    this.width,
    this.height,
});

  factory LogoHotels.fromJson(Map<String, dynamic> json) => LogoHotels(
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "width": width,
    "height": height,
  };
}

class AddressRestaurants {
  String? address;
  double? lat;
  double? lng;
  double? zoom;
  String? placeId;
  String? streetNumber;
  String? streetName;
  String? streetNameShort;
  String? city;
  String? state;
  String? stateShort;
  String? postCode;
  String? country;
  String? countryShort;

  AddressRestaurants({
    this.address,
    this.lat,
    this.lng,
    this.zoom,
    this.placeId,
    this.streetNumber,
    this.streetName,
    this.streetNameShort,
    this.city,
    this.state,
    this.stateShort,
    this.postCode,
    this.country,
    this.countryShort,
  });
  factory AddressRestaurants.fromJson(Map<String, dynamic> json) => AddressRestaurants(
    address: json["address"],
    lat: json["lat"].toDouble(),
    lng: json["lng"].toDouble(),
    zoom: json["zoom"].toDouble(),
    placeId: json["place_id"],

    // Need to remove fields
    streetNumber: json["street_number"],
    streetName: json["street_name"],
    streetNameShort: json["street_name_short"],
    city: json["city"],
    state: json["state"],
    stateShort: json["state_short"],
    postCode: json["post_code"],
    country: json["country"],
    countryShort: json["country_short"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "lat": lat,
    "lng": lng,
    "zoom": zoom,
    "place_id": placeId,

    // Need to remove fields
    "street_number": streetNumber,
    "street_name": streetName,
    "street_name_short": streetNameShort,
    "city": city,
    "state": state,
    "state_short": stateShort,
    "post_code": postCode,
    "country": country,
    "country_short": countryShort,
  };
}

class Restaurants {
  final String? description_restaurants;
  AddressRestaurants? address_restaurants;

  Restaurants({
    this.description_restaurants,
    this.address_restaurants,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) {
    return Restaurants(
      description_restaurants: json['acf']['description_restaurants'] as String,
      address_restaurants: json['acf']["address_restaurants"] != null ? AddressRestaurants.fromJson(json['acf']["address_restaurants"]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acf']['description_restaurants'] = this.description_restaurants;
    data['acf']['address_restaurants'] = this.address_restaurants;
    return data;
  }
}



