import 'package:dio/dio.dart';

class RestRegisterProvider {
  static RestRegisterProvider helper = RestRegisterProvider._createInstance();
  RestRegisterProvider._createInstance();

  final Dio _dio = Dio();
  String baseUrl = "http://localhost:8000/createuser"; // Replace with your actual API base URL

  Future<bool> createUser(String username, String password) async {
    try {
      Response response = await _dio.post(
        "$baseUrl/createuser",
        data: {
          "username": username,
          "password": password,
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