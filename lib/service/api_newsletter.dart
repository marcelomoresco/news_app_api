import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class ApiNewsletter {
  final client = http.Client();

  final api_url = Uri.parse('SUACHAVEAPI');

  Future<List<Article>> getDataFromApi() async {
    http.Response response = await client.get(api_url);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Não foi possivel retornar os dados!");
    }
  }
}
