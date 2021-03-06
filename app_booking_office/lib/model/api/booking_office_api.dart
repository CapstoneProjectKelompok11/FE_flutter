import 'dart:convert';
import 'dart:io';
import 'package:app_booking_office/model/book_office_model.dart';
import 'package:app_booking_office/property/show_dialog/token_expired.dart';
import 'package:dio/dio.dart';

import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookOfficeAPI {
  Dio? dio;
  static Future<List<DataComplex>?> getComplex(String cityName) async {
    try {
      var uri = Uri.https(
          'c2-18-206-213-94.compute-1.amazonaws.com', '/api/complex', {
        'city': cityName,
      });
      final response = await Dio().getUri(uri,
          options: Options(headers: {"Content-Type": "application/json"}));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('SuccesFull Fetching data Complex');
        return Complex.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<DataFloor>?> getFloor(String buildingId) async {
    try {
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/floor/', {"buildingId": buildingId});
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            "Content-Type": "application/json",
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data Floor');

        return Floor.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<DataCity>?> getCity() async {
    try {
      final response = await Dio()
          .get('http://ec2-18-206-213-94.compute-1.amazonaws.com/api/city');

      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data City');
        return City.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<DataBuilding>?> getBuilding(
    String complexId,
    String page,
    String limit,
  ) async {
    try {
      var uri = Uri.http(
          'ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/buildings/',
          {'complexId': complexId, 'page': page, 'limit': limit});
      final response = await Dio().getUri(uri,
          options: Options(headers: {"Content-Type": "application/json"}));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data Building');
        return Building.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> postReview(
      PostReview postReview, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      debugPrint(token);
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/review/', {'buildingId': postReview.buildingId});
      var dataReview = {
        'review': postReview.review,
        'rating': postReview.rating
      };
      var dataMap = jsonEncode(dataReview);
      var response = await Dio().postUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }),
          data: dataMap);

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Sending Review');
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }

  static Future<List<DataGetReview>> getReview(
      String buildingId, String page, String limit) async {
    try {
      var uri = Uri.http(
          'ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/review',
          {'buildingId': buildingId, 'page': page, 'limit': limit});
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Get Review');
        return GetReview.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> reservation(
      Reservation reservation, String floorId, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/reservation/', {'floorId': floorId});
      var dataReservation = {
        'start_reservation': reservation.startReservation,
        'company': reservation.company,
        'phone': reservation.phone,
        'participant': reservation.participant,
        'note': reservation.note
      };
      var dataMap = jsonEncode(dataReservation);
      final response = await Dio().postUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }),
          data: dataMap);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Sending Request Booking');
      }
    } catch (e) {
      debugPrint(e.toString());

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }

  static Future<List<DataBuilding>> searchBuilding(String nameBuilding) async {
    try {
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/building/search/', {'name': nameBuilding});
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching Result Search');
        return Building.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> postFavorite(
      String buildingId, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/building/favorite', {'buildingId': buildingId});
      final response = await Dio().postUri(
        uri,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        }),
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Adding to Favorite');
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }

  static Future<List<DataFavorite>> getFavorite(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/building/favorite/');
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        return GetFavorite.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
    return [];
  }

  static Future<void> deleteFavorite(
      String buildingId, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/building/unfavorite', {'buildingId': buildingId});
      final response = await Dio().deleteUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes UnFavorite the Building');
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }

  static Future<GetUserData> getDataUser() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http(
          'ec2-18-206-213-94.compute-1.amazonaws.com', '/api/auth/profile/');
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching Data User');
        return GetUser.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return GetUserData(
        id: 0,
        firstName: '',
        lastName: '',
        phone: '',
        email: '',
        image: 'https://180dc.org/wp-content/uploads/2018/05/empty.png');
  }

  static Future<void> postProfilePicture(File image) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path,
            filename: fileName, contentType: MediaType('image', 'jpg')),
        "type": "image/jpg"
      });
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/profile/image');

      // var dataMap = jsonEncode(dataReservation);
      final response = await Dio().postUri(uri,
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          }),
          data: formData);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Upload Picture');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<DataReservation>?> getReservation(
      BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http(
          'ec2-18-206-213-94.compute-1.amazonaws.com', '/api/auth/reservation');
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data Reservation');
        return GetReservation.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
    return [];
  }

  static Future<void> postPaymentReceipt(
      String reservationId, File imageReceipt) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String fileName = imageReceipt.path.split('/').last;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imageReceipt.path,
            filename: fileName, contentType: MediaType('image', 'jpg')),
        "type": "image/jpg"
      });
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/reservation/payment', {'reservationId': reservationId});
      final response = await Dio().postUri(uri,
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
          }),
          data: formData);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Upload Receipt');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> sendMessage(DataMessage dataMessage) async {}

  static Future<List<GetDataByUser>> getDataMessage(String buildingId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri =
          Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com', '/api/graphql');
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data Message');
        return DataChat.fromJson(data).getDataByUser;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<DataListMessage>> getListMessage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http(
          'ec2-18-206-213-94.compute-1.amazonaws.com', '/api/auth/chat/list');
      final response = await Dio().getUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      var jsonString = jsonEncode(response.data);
      var data = jsonDecode(jsonString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Fetching data List Message');
        return GetListMessage.fromJson(data).data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<void> cancelRequestBooking(String reservationId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/reservation/cancel', {'reservationId': reservationId});
      final response = await Dio().putUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes Cancel Request Booking');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> editProfile(
      EditProfile editProfile, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var dataUser = {
        'first_name': editProfile.firstName,
        'last_name': editProfile.lastName,
        'phone': editProfile.phone,
        'email': editProfile.email,
      };
      var dataMap = jsonEncode(dataUser);
      var uri = Uri.http('ec2-18-206-213-94.compute-1.amazonaws.com',
          '/api/auth/profile/edit');
      final response = await Dio().putUri(uri,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          }),
          data: dataMap);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202 ||
          response.statusCode == 203) {
        debugPrint('Succes edit data user');
      }
    } catch (e) {
      debugPrint(e.toString());
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => const TokenExpired());
    }
  }
}
