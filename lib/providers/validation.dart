// Data Provider para o banco de dados local sqflite
import 'package:dio/dio.dart';
import 'dart:core';
import 'dart:async';

class RestDataProvider {
  // Atributo que irá afunilar todas as consultas
  static RestDataProvider helper = RestDataProvider._createInstance();

  // Construtor privado
  RestDataProvider._createInstance();

  final Dio _dio = Dio();

  /*String prefixUrl = "https://si7002s2022-default-rtdb.firebaseio.com";
  String suffixUrl = "/.json";*/

  String prefixUrl = "http://localhost:8000/validateuser?";
  String suffixUrl = "";


    Future<int> validateUser(String email, String password) async {
        Response response = await _dio.get(prefixUrl + "username=" + email + "&password=" + password);
        //var debug = response.data["id"]; 
        //debugPrint('PRINTPRINTPRINTPRINT: $debug');
        if(response.data['result'] == "false"){
            return 0;
        }
        else{
              try {
                return int.parse(response.data["id"].toString());
              } catch (e) {
                print('Error parsing id: $e');
                return 0; // or handle the error as needed
              }
        }
    }
}