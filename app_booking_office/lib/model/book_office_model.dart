import 'dart:convert';

import 'package:flutter/cupertino.dart';

class Message {
  String text;
  DateTime date;
  bool isSentByMe;

  Message({required this.text, required this.date, required this.isSentByMe});
}

class BuildingOffice {
  String picture;
  String name;
  String location;
  int capacity;
  int toilet;
  int stairs;
  int rating;
  String price;
  String desciption;

  BuildingOffice({
    required this.picture,
    required this.name,
    required this.price,
    required this.location,
    required this.capacity,
    required this.toilet,
    required this.stairs,
    required this.rating,
    required this.desciption,
  });
}

class Complex {
  String? timestamp;
  StatusComplex? status;
  List<DataComplex>? data;

  Complex({this.timestamp, this.status, this.data});

  Complex.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status =
        json['status'] != null ? StatusComplex.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <DataComplex>[];
      json['data'].forEach((v) {
        data!.add(DataComplex.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusComplex {
  String? code;
  String? message;

  StatusComplex({this.code, this.message});

  StatusComplex.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class DataComplex {
  int? id;
  String? complexName;
  CityComplex? city;

  DataComplex({this.id, this.complexName, this.city});

  DataComplex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    complexName = json['complexName'];
    city = json['city'] != null ? CityComplex.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['complexName'] = complexName;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class CityComplex {
  int? id;
  String? cityName;

  CityComplex({this.id, this.cityName});

  CityComplex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cityName'] = cityName;
    return data;
  }
}

//---------------------------------------------------------
//----------------------------------------------------------

Building floorFromJson(String str) => Building.fromJson(json.decode(str));

String floorToJson(Building data) => json.encode(data.toJson());

class Floor {
  Floor({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  StatusFloor status;
  List<DataFloor> data;

  factory Floor.fromJson(Map<String, dynamic> json) => Floor(
        timestamp: json["timestamp"],
        status: StatusFloor.fromJson(json["status"]),
        data: List<DataFloor>.from(
            json["data"].map((x) => DataFloor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataFloor {
  DataFloor({
    required this.id,
    required this.name,
    required this.type,
    required this.floorSize,
    required this.maxCapacity,
    required this.startingPrice,
    required this.image,
  });

  int? id;
  String? name;
  String? type;
  String? floorSize;
  int? maxCapacity;
  int? startingPrice;
  String? image;

  factory DataFloor.fromJson(Map<String, dynamic> json) => DataFloor(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        floorSize: json["floor_size"],
        maxCapacity: json["max_capacity"],
        startingPrice: json["starting_price"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "floor_size": floorSize,
        "max_capacity": maxCapacity,
        "starting_price": startingPrice,
        "image": image,
      };
}

class StatusFloor {
  StatusFloor({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusFloor.fromJson(Map<String, dynamic> json) => StatusFloor(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

//-------------------------------------------------------------
//------------------------------------------------------------
class City {
  String? timestamp;
  StatusCity? status;
  List<DataCity>? data;

  City({this.timestamp, this.status, this.data});

  City.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    status =
        json['status'] != null ? StatusCity.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <DataCity>[];
      json['data'].forEach((v) {
        data!.add(DataCity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StatusCity {
  String? code;
  String? message;

  StatusCity({this.code, this.message});

  StatusCity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class DataCity {
  int? id;
  String? cityName;

  DataCity({this.id, this.cityName});

  DataCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cityName'] = cityName;
    return data;
  }
}

//--------------------------------------------------------------
//--------------------------------------------------------------

Building buildingFromJson(String str) => Building.fromJson(json.decode(str));

String buildingToJson(Building data) => json.encode(data.toJson());

class Building {
  Building({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  StatusBuilding status;
  List<DataBuilding> data;

  factory Building.fromJson(Map<String, dynamic> json) => Building(
        timestamp: json["timestamp"],
        status: StatusBuilding.fromJson(json["status"]),
        data: List<DataBuilding>.from(
            json["data"].map((x) => DataBuilding.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataBuilding {
  DataBuilding({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    required this.officeType,
    required this.buildingSize,
    required this.floorCount,
    required this.capacity,
    required this.images,
    required this.complex,
    required this.facilities,
  });

  int id;
  String name;
  String address;
  String description;
  double rating;
  List<String> officeType;
  String buildingSize;
  int floorCount;
  int capacity;
  List<ImageBuilding> images;
  ComplexBuilding complex;
  List<dynamic> facilities;

  factory DataBuilding.fromJson(Map<String, dynamic> json) => DataBuilding(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        description: json["description"],
        rating: json["rating"],
        officeType: List<String>.from(json["office_type"].map((x) => x)),
        buildingSize: json["building_size"],
        floorCount: json["floor_count"],
        capacity: json["capacity"],
        images: List<ImageBuilding>.from(
            json["images"].map((x) => ImageBuilding.fromJson(x))),
        complex: ComplexBuilding.fromJson(json["complex"]),
        facilities: List<dynamic>.from(json["facilities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "description": description,
        "rating": rating,
        "office_type": List<dynamic>.from(officeType.map((x) => x)),
        "building_size": buildingSize,
        "floor_count": floorCount,
        "capacity": capacity,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "complex": complex.toJson(),
        "facilities": List<dynamic>.from(facilities.map((x) => x)),
      };
}

class ComplexBuilding {
  ComplexBuilding({
    required this.id,
    required this.complexName,
    required this.city,
  });

  int id;
  String complexName;
  City city;

  factory ComplexBuilding.fromJson(Map<String, dynamic> json) =>
      ComplexBuilding(
        id: json["id"],
        complexName: json["complex_name"],
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "complex_name": complexName,
        "city": city.toJson(),
      };
}

class CityBuilding {
  CityBuilding({
    required this.id,
    required this.cityName,
  });

  int id;
  String cityName;

  factory CityBuilding.fromJson(Map<String, dynamic> json) => CityBuilding(
        id: json["id"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
      };
}

class ImageBuilding {
  ImageBuilding({
    required this.fileName,
  });

  String fileName = '';

  factory ImageBuilding.fromJson(Map<String, dynamic> json) => ImageBuilding(
        fileName: json["fileName"],
      );

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
      };
}

class StatusBuilding {
  StatusBuilding({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusBuilding.fromJson(Map<String, dynamic> json) => StatusBuilding(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
//---------------------------------------------------------
//--------------------------------------------------------

GetReview getReviewFromJson(String str) => GetReview.fromJson(json.decode(str));

String getReviewToJson(GetReview data) => json.encode(data.toJson());

class GetReview {
  GetReview({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  StatusGetReview status;
  List<DataGetReview> data;

  factory GetReview.fromJson(Map<String, dynamic> json) => GetReview(
        timestamp: json["timestamp"],
        status: StatusGetReview.fromJson(json["status"]),
        data: List<DataGetReview>.from(
            json["data"].map((x) => DataGetReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataGetReview {
  DataGetReview({
    required this.user,
    required this.review,
    required this.rating,
    required this.reviewDate,
  });

  UserGetReview user;
  String review;
  int rating;
  String reviewDate;

  factory DataGetReview.fromJson(Map<String, dynamic> json) => DataGetReview(
        user: UserGetReview.fromJson(json["user"]),
        review: json["review"],
        rating: json["rating"],
        reviewDate: json["review_date"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "review": review,
        "rating": rating,
        "review_date": reviewDate,
      };
}

class UserGetReview {
  UserGetReview({
    required this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
  });

  int id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;

  factory UserGetReview.fromJson(Map<String, dynamic> json) => UserGetReview(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
      };
}

class StatusGetReview {
  StatusGetReview({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusGetReview.fromJson(Map<String, dynamic> json) =>
      StatusGetReview(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

//------------------------------------------------------------
//----------------------------------------------------------

class RatingData {
  double rating = 0;
  RatingData({required this.rating});
}

class CaroselComplex {
  String id;
  String image;
  String title;

  CaroselComplex({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<CaroselComplex> complexCarosel = [
  CaroselComplex(
      id: '3',
      image:
          'https://lampungpro.co/laravel-filemanager/photos/17/BARU3/IMG_20200406_080722.jpg',
      title: 'Tanah Abang'),
  CaroselComplex(
      id: '4',
      image:
          'https://pict.sindonews.net/dyn/620/content/2017/09/25/179/1242880/manajemen-bantah-mal-senayan-city-dijual-rp5-5-triliun-HBT-thumb.jpg',
      title: 'Senayan City'),
  CaroselComplex(
      id: '11',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjxDGdqLTtAgbfXqN5x53gzp0ham9OlmYpz0dBUF2Nyn71nDCamCTOAS3SNrRlhmgFOqQ&usqp=CAU',
      title: 'Kuningan'),
  CaroselComplex(
      id: '5',
      image:
          'http://assets.kompasiana.com/items/album/2022/01/03/3764246768-61d256db4b660d3a3b61ccc2.jpg?t=o&v=770',
      title: 'SCBD'),
  CaroselComplex(
      id: '10',
      image:
          'https://cdn.antaranews.com/cache/800x533/2020/06/03/20200603_172512.jpg',
      title: 'Sudirman'),
  CaroselComplex(
      id: '2',
      image:
          'https://cdn1-production-images-kly.akamaized.net/E1Bzjr7fnxJiXjUEaMoGvnrUNDg=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2726919/original/065948600_1549973574-20190212-Aplikasi-MOS-Pelabuhan-Tekan-Biaya-Lebih-Hemat-Johan4.jpg',
      title: 'Tanjung Priok'),
  CaroselComplex(
      id: '1',
      image:
          'https://media-cdn.tripadvisor.com/media/photo-s/23/d5/08/c8/holiday-inn-express-jakarta.jpg',
      title: 'Pluit'),
  CaroselComplex(
      id: '9',
      image:
          'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/t_htl-dskt/tix-hotel/images-web/2020/10/31/0078c537-9ec0-4643-a002-3d57cb2057fe-1604162939502-8e090269f6534acf3fe0946593ac8c45.jpg',
      title: 'Cengkareang'),
  CaroselComplex(
      id: '8',
      image:
          'https://ik.imagekit.io/tvlk/apr-asset/dgXfoyh24ryQLRcGq00cIdKHRmotrWLNlvG-TxlcLxGkiDwaUSggleJNPRgIHCX6/hotel/asset/20023265-de9931e266080ac88064ed37af8cd877.jpeg?_src=imagekit&tr=c-at_max,h-488,q-40,w-768',
      title: 'Kebon Jeruk'),
  CaroselComplex(
      id: '7',
      image: 'https://kfmap.asia/thumbs/photos/ID.JKT.HT.I6/ID.JKT.HT.I6_1.jpg',
      title: 'Cawang'),
  CaroselComplex(
      id: '6',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2V85ra9SKW_S6OuBIaF8622vqnN5b2RGo9gJ-OIoe_rWPRRJiVef_FPb5v8S1Okgnq8M&usqp=CAU',
      title: 'Rawamangun')
];

class PostReview {
  String buildingId;
  String review;
  int rating;

  PostReview({
    required this.buildingId,
    required this.review,
    required this.rating,
  });
}

class Reservation {
  String? startReservation;
  String? company;

  String? phone;
  String? participant;
  String? note;

  Reservation(
      {required this.startReservation,
      required this.company,
      required this.phone,
      required this.participant,
      required this.note});
}

//--------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------

GetFavorite getFavoriteFromJson(String str) =>
    GetFavorite.fromJson(json.decode(str));

String getFavoriteToJson(GetFavorite data) => json.encode(data.toJson());

class GetFavorite {
  GetFavorite({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  StatusFavorite status;
  List<DataFavorite> data;

  factory GetFavorite.fromJson(Map<String, dynamic> json) => GetFavorite(
        timestamp: json["timestamp"],
        status: StatusFavorite.fromJson(json["status"]),
        data: List<DataFavorite>.from(
            json["data"].map((x) => DataFavorite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataFavorite {
  DataFavorite({
    required this.building,
  });

  BuildingFavorite building;

  factory DataFavorite.fromJson(Map<String, dynamic> json) => DataFavorite(
        building: BuildingFavorite.fromJson(json["building"]),
      );

  Map<String, dynamic> toJson() => {
        "building": building.toJson(),
      };
}

class BuildingFavorite {
  BuildingFavorite(
      {required this.id,
      required this.name,
      required this.address,
      required this.description,
      required this.rating,
      required this.officeType,
      required this.buildingSize,
      required this.floorCount,
      required this.capacity,
      required this.images,
      required this.complex,
      required this.facilities});

  int? id;
  String? name;
  String? address;
  String? description;
  double? rating;
  List<String> officeType;
  String? buildingSize;
  int? floorCount;
  int? capacity;
  List<ImageFavorite> images;
  Complex complex;
  bool isFavorite = true;
  List<String> facilities;

  factory BuildingFavorite.fromJson(Map<String, dynamic> json) =>
      BuildingFavorite(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        description: json["description"],
        rating: json["rating"],
        officeType: List<String>.from(json["office_type"].map((x) => x)),
        buildingSize: json["building_size"],
        floorCount: json["floor_count"],
        capacity: json["capacity"],
        images: List<ImageFavorite>.from(
            json["images"].map((x) => ImageFavorite.fromJson(x))),
        complex: Complex.fromJson(json["complex"]),
        facilities: List<String>.from(json["facilities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "description": description,
        "rating": rating,
        "office_type": List<dynamic>.from(officeType.map((x) => x)),
        "building_size": buildingSize,
        "floor_count": floorCount,
        "capacity": capacity,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "complex": complex.toJson(),
        "facilities": List<dynamic>.from(facilities.map((x) => x)),
      };
}

class ComplexFavorite {
  ComplexFavorite({
    required this.id,
    required this.complexName,
    required this.city,
  });

  int id;
  String complexName;
  City city;

  factory ComplexFavorite.fromJson(Map<String, dynamic> json) =>
      ComplexFavorite(
        id: json["id"],
        complexName: json["complex_name"],
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "complex_name": complexName,
        "city": city.toJson(),
      };
}

class CityFavorite {
  CityFavorite({
    required this.id,
    required this.cityName,
  });

  int id;
  String cityName;

  factory CityFavorite.fromJson(Map<String, dynamic> json) => CityFavorite(
        id: json["id"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
      };
}

class ImageFavorite {
  ImageFavorite({
    required this.fileName,
  });

  String fileName;

  factory ImageFavorite.fromJson(Map<String, dynamic> json) => ImageFavorite(
        fileName: json["fileName"],
      );

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
      };
}

class StatusFavorite {
  StatusFavorite({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusFavorite.fromJson(Map<String, dynamic> json) => StatusFavorite(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
  GetUser({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  StatusGetUser status;
  GetUserData data;

  factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
        timestamp: json["timestamp"],
        status: StatusGetUser.fromJson(json["status"]),
        data: GetUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": data.toJson(),
      };
}

class GetUserData {
  GetUserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.image,
  });

  int id = 0;
  String firstName = '';
  String lastName = '';
  String phone = '';
  String email = '';
  dynamic image;

  factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "image": image,
      };
}

class StatusGetUser {
  StatusGetUser({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusGetUser.fromJson(Map<String, dynamic> json) => StatusGetUser(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
//-------------------------------------------------------------------------------
//---------------------------------------------------------------------------------

GetReservation getReservationFromJson(String str) =>
    GetReservation.fromJson(json.decode(str));

String getReservationToJson(GetReservation data) => json.encode(data.toJson());

class GetReservation {
  GetReservation({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  StatusReservation status;
  List<DataReservation> data;

  factory GetReservation.fromJson(Map<String, dynamic> json) => GetReservation(
        timestamp: json["timestamp"],
        status: StatusReservation.fromJson(json["status"]),
        data: List<DataReservation>.from(
            json["data"].map((x) => DataReservation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataReservation {
  DataReservation({
    required this.id,
    required this.user,
    required this.floor,
    required this.building,
    required this.startReservation,
    required this.company,
    required this.price,
    required this.phone,
    required this.participant,
    required this.note,
    this.image,
    required this.status,
  });

  int id;
  UserReservation user;
  FloorReservation floor;
  BuildingReservation building;
  String startReservation;
  String company;
  int price;
  String phone;
  int participant;
  String note;
  dynamic image;
  String status;

  factory DataReservation.fromJson(Map<String, dynamic> json) =>
      DataReservation(
        id: json["id"],
        user: UserReservation.fromJson(json["user"]),
        floor: FloorReservation.fromJson(json["floor"]),
        building: BuildingReservation.fromJson(json["building"]),
        startReservation: json["start_reservation"],
        company: json["company"],
        price: json["price"],
        phone: json["phone"],
        participant: json["participant"],
        note: json["note"],
        image: json["image"] ?? '',
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "floor": floor.toJson(),
        "building": building.toJson(),
        "start_reservation": startReservation,
        "company": company,
        "price": price,
        "phone": phone,
        "participant": participant,
        "note": note,
        "image": image,
        "status": status,
      };
}

class BuildingReservation {
  BuildingReservation({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.rating,
    this.officeType,
    required this.buildingSize,
    required this.floorCount,
    required this.capacity,
    required this.images,
    required this.complex,
    required this.facilities,
  });

  int id;
  String name;
  String address;
  String description;
  double rating;
  dynamic officeType;
  String buildingSize;
  int floorCount;
  int capacity;
  List<ImageReservation> images;
  ComplexReservation complex;
  List<String> facilities;

  factory BuildingReservation.fromJson(Map<String, dynamic> json) =>
      BuildingReservation(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        description: json["description"],
        rating: json["rating"],
        officeType: json["office_type"] ?? '',
        buildingSize: json["building_size"],
        floorCount: json["floor_count"],
        capacity: json["capacity"],
        images: List<ImageReservation>.from(
            json["images"].map((x) => ImageReservation.fromJson(x))),
        complex: ComplexReservation.fromJson(json["complex"]),
        facilities: List<String>.from(json["facilities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "description": description,
        "rating": rating,
        "office_type": officeType,
        "building_size": buildingSize,
        "floor_count": floorCount,
        "capacity": capacity,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "complex": complex.toJson(),
        "facilities": List<dynamic>.from(facilities.map((x) => x)),
      };
}

class ComplexReservation {
  ComplexReservation({
    required this.id,
    required this.complexName,
    required this.city,
  });

  int id;
  String complexName;
  CityReservation city;

  factory ComplexReservation.fromJson(Map<String, dynamic> json) =>
      ComplexReservation(
        id: json["id"],
        complexName: json["complex_name"],
        city: CityReservation.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "complex_name": complexName,
        "city": city.toJson(),
      };
}

class CityReservation {
  CityReservation({
    required this.id,
    required this.cityName,
  });

  int id;
  String cityName;

  factory CityReservation.fromJson(Map<String, dynamic> json) =>
      CityReservation(
        id: json["id"],
        cityName: json["city_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city_name": cityName,
      };
}

class ImageReservation {
  ImageReservation({
    required this.fileName,
  });

  String? fileName;

  factory ImageReservation.fromJson(Map<String, dynamic> json) =>
      ImageReservation(
        fileName: json["fileName"],
      );

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
      };
}

class FloorReservation {
  FloorReservation({
    required this.id,
    required this.name,
    required this.type,
    required this.floorSize,
    required this.maxCapacity,
    required this.startingPrice,
    required this.image,
  });

  int id;
  String name;
  String type;
  String floorSize;
  int maxCapacity;
  int startingPrice;
  String image;

  factory FloorReservation.fromJson(Map<String, dynamic> json) =>
      FloorReservation(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        floorSize: json["floor_size"],
        maxCapacity: json["max_capacity"],
        startingPrice: json["starting_price"],
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "floor_size": floorSize,
        "max_capacity": maxCapacity,
        "starting_price": startingPrice,
        "image": image,
      };
}

class UserReservation {
  UserReservation({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    this.image,
  });

  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  dynamic image;

  factory UserReservation.fromJson(Map<String, dynamic> json) =>
      UserReservation(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "image": image,
      };
}

class StatusReservation {
  StatusReservation({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusReservation.fromJson(Map<String, dynamic> json) =>
      StatusReservation(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
//-------------------------------------------------------------
//--------------------------------------------------------------

class DataMessage {
  String buildingId;
  String pesan;

  DataMessage({required this.buildingId, required this.pesan});
}
//---------------------------------------------------------
//-------------------------------------------------------------

GetMessage getMessageFromJson(String str) =>
    GetMessage.fromJson(json.decode(str));

String getMessageToJson(GetMessage data) => json.encode(data.toJson());

class GetMessage {
  GetMessage({
    required this.data,
  });

  DataChat data;

  factory GetMessage.fromJson(Map<String, dynamic> json) => GetMessage(
        data: DataChat.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class DataChat {
  DataChat({
    required this.getDataByUser,
  });

  List<GetDataByUser> getDataByUser;

  factory DataChat.fromJson(Map<String, dynamic> json) => DataChat(
        getDataByUser: List<GetDataByUser>.from(
            json["getDataByUser"].map((x) => GetDataByUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getDataByUser":
            List<dynamic>.from(getDataByUser.map((x) => x.toJson())),
      };
}

class GetDataByUser {
  GetDataByUser({
    required this.id,
    required this.message,
    required this.sendByUser,
    required this.timestamp,
  });

  String id;
  String message;
  bool sendByUser;
  DateTime timestamp;

  factory GetDataByUser.fromJson(Map<String, dynamic> json) => GetDataByUser(
        id: json["id"],
        message: json["message"],
        sendByUser: json["sendByUser"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "sendByUser": sendByUser,
        "timestamp": timestamp.toIso8601String(),
      };
}
//------------------------------------------------------------
//----------------------------------------------------------------

GetListMessage getListMessageFromJson(String str) =>
    GetListMessage.fromJson(json.decode(str));

String getListMessageToJson(GetListMessage data) => json.encode(data.toJson());

class GetListMessage {
  GetListMessage({
    required this.timestamp,
    required this.status,
    required this.data,
  });

  String timestamp;
  StatusLIstMessage status;
  List<DataListMessage> data;

  factory GetListMessage.fromJson(Map<String, dynamic> json) => GetListMessage(
        timestamp: json["timestamp"],
        status: StatusLIstMessage.fromJson(json["status"]),
        data: List<DataListMessage>.from(
            json["data"].map((x) => DataListMessage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "status": status.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataListMessage {
  DataListMessage({
    required this.id,
    required this.buildingName,
    required this.latestMessageTimestamp,
    required this.latestMessage,
    required this.buildingImages,
  });

  int id;
  String buildingName;
  String latestMessageTimestamp;
  String latestMessage;
  String buildingImages;

  factory DataListMessage.fromJson(Map<String, dynamic> json) =>
      DataListMessage(
        id: json["id"],
        buildingName: json["building_name"],
        latestMessageTimestamp: json["latest_message_timestamp"],
        latestMessage: json["latest_message"],
        buildingImages: json["building_images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "building_name": buildingName,
        "latest_message_timestamp": latestMessageTimestamp,
        "latest_message": latestMessage,
        "building_images": buildingImages,
      };
}

class StatusLIstMessage {
  StatusLIstMessage({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory StatusLIstMessage.fromJson(Map<String, dynamic> json) =>
      StatusLIstMessage(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

//--------------------------------------------------
//---------------------------------------------------
class EditProfile {
  String firstName;
  String lastName;
  String phone;
  String email;

  EditProfile({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });
}

class Login {
  String? email;
  String? password;
  BuildContext? context;
  Login({this.email, this.password, this.context});
}

//------------------------------------------------
class AddMessageSchema {
  static String addMessageJson = '''
mutation(\$message: String!, \$buildingId: String! ){
  userSendMessage(
    message: \$message, buildingId: \$buildingId
  ){
    id
    message
    sentByUser
    timestamp
  }
}
''';
}
