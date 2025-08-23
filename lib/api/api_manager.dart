import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/model/news_response/news_response.dart';
import 'package:news_app/model/source_responce/source_responce.dart';

class ApiManager {
  static Future<SourceResponce?> getSources(String categoryId) async {
    Uri url = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.endpointSources,
      {
        'apiKey': ApiConstant.apikey,
        'category': categoryId,
      },
    );
    try {
      var response = await http.get(url);
      var bodyString = response.body; //string
      var json = jsonDecode(bodyString); // json
      return SourceResponce.fromJson(json); //object
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySources(
    String sourceId,
  ) async {
    Uri url = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.endpointnews,
      {
        'apiKey': ApiConstant.apikey,
        'sources': sourceId,
      },
    );
    try {
      var responce = await http.get(url);
      var bodyString = responce.body; //string
      var json = jsonDecode(bodyString); //json
      return NewsResponse.fromJson(json); //object
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> search(String quary) async {
    Uri url = Uri.https(
      ApiConstant.baseUrl,
      ApiConstant.endpointnews,
      {
        "apikey": ApiConstant.apikey,
        "q": quary,
      },
    );
    try {
      var response = await http.get(url);
      var bodyString = response.body; // string
      var json = jsonDecode(bodyString); // json
      return NewsResponse.fromJson(json); //object}
    } catch (e) {
      throw e;
    }
  }
}
