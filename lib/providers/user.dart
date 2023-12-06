import 'package:dio/dio.dart';

class UserProvider {
  static UserProvider helper = UserProvider._createInstance();
  UserProvider._createInstance();

  final Dio _dio = Dio();
  String baseUrl = "http://localhost:8000"; // Replace with your actual API base URL

Future <List> getUser(int id) async {
    try {
      //vou sair daqui
      //aquele abraço e uma ótima noite
      
      Response response = await _dio.get(
        "$baseUrl/getUser",
        queryParameters: {
          "id": id,
        },
      );

      if (response.statusCode == 200) {
        // Assuming the API responds with a success status code
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      print('Error getting user: $e');
      return []; // or handle the error as needed
    }
  }
}