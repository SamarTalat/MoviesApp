import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movieapp/core/consts/api_const.dart';
import 'package:movieapp/models/respons_popular/respons_poular.dart';

class ApiService {
  static Future<ResponsPopular> getPopularMovies() async {
    try {
      Uri url = Uri.https(
        ApiConstant.baseUrl,
        ApiConstant.popular,
        {
          "api_key": ApiConstant.apiKey,
        },
      );
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var responseData = ResponsPopular.fromJson(json);
      return responseData;
    } on SocketException catch (e) {
      throw "No internet connection.";
    } catch (e) {
      throw "there was an error , try again later";
    }
  }

  static Future<ResponsPopular> getNewReleases() async {
    try {
      Uri url = Uri.https(
        ApiConstant.baseUrl,
        ApiConstant.upcoming,
        {
          "api_key": ApiConstant.apiKey,
        },
      );
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      var responseData = ResponsPopular.fromJson(jsonData);

      return responseData;
    } on SocketException catch (e) {
      throw "No internet connection.";
    } catch (e) {
      throw "There was an error, try again later";
    }
  }

  static Future<ResponsPopular> getrRecomend() async {
    try {
      Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.topRated, {
        "api_key": ApiConstant.apiKey,
      });
      var response = await http.get(url);

      Map<String, dynamic> jsonData = jsonDecode(response.body);

      var responseData = ResponsPopular.fromJson(jsonData);

      return responseData;
    } on SocketException catch (e) {
      throw "No internet connection.";
    } catch (e) {
      throw "There was an error, try again later";
    }
  }
}
