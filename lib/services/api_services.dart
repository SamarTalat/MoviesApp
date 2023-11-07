import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movieapp/core/consts/api_const.dart';
import 'package:movieapp/models/categoryResponce.dart';
import 'package:movieapp/models/movieModel.dart';
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
  static Future<CategoryResponce> getCategoryMovies() async{
    Uri url = Uri.https(ApiConstant.baseUrl, ApiConstant.sourceApi,
        {'apiKey': '698cae66a50e0eeead2b85ccae8ff93f'});
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoryResponce.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
  static Future<MovieModel> getMoveByGenerId(String categoryId)async{
    Uri url =Uri.https(ApiConstant.baseUrl,ApiConstant.movieApi,{
      'apiKey': '698cae66a50e0eeead2b85ccae8ff93f',
      'results':categoryId
    });
    try{
      var response=await http.get(url);
      var bodyString=response.body;
      var json=jsonDecode(bodyString);
      return MovieModel.fromJson(json);
    }catch (e) {
      throw e;
    }

  }


}
