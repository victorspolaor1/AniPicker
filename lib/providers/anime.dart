import 'package:dio/dio.dart';

class AnimeWatchProvider {
  static AnimeWatchProvider helper = AnimeWatchProvider._createInstance();
  AnimeWatchProvider._createInstance();

  final Dio _dio = Dio();
  String baseUrl = "http://localhost:8000"; // Replace with your actual API base URL

  Future<int> watchAnime(String animeName, int idUser) async {
    try {
      Response response = await _dio.post(
        "$baseUrl/watchAnime",
        data: {
          "animeName": animeName,
          "idUser": idUser,
        },
      );

      if (response.statusCode == 200) {
        // Assuming the API responds with a success status code
        return response.data["insertId"];
      } else {
        return -1;
      }
    } catch (e) {
      print('Error creating user: $e');
      return -1; // or handle the error as needed
    }
  }
  //Future with a list that contains all anime watched by the user
  Future <List> getWatchedAnime(int idUser) async {
    try {
      Response response = await _dio.get(
        "$baseUrl/getWatchedAnime",
        queryParameters: {
          "idUser": idUser,
        },
      );

      if (response.statusCode == 200) {
        // Assuming the API responds with a success status code
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      print('Error creating user: $e');
      return []; // or handle the error as needed
    }
  }
  //Make request to delete anime from the list of watched anime
  Future <bool> deleteWatchedAnime(int idAnime) async {
    try {
      Response response = await _dio.delete(
        "$baseUrl/deleteWatchedAnime",
        data: {
          "idAnime": idAnime,
        },
      );

      if (response.statusCode == 200) {
        // Assuming the API responds with a success status code
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error creating user: $e');
      return false; // or handle the error as needed
    }
  }
}