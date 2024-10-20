import 'dart:convert';

import 'package:http/http.dart' as http;

class BreakingNewsApi {
  List<dynamic> breakingNews = [];

  Future<void> fetchBreakingNews() async {
    final apiKey = "de01d1727e644a86b45fbe2e810873bd";
    final url =
        "https://newsapi.org/v2/top-headlines?language=en&pageSize=5&apiKey=$apiKey";
    // final url =
    //     "https://newsapi.org/v2/top-headlines?category=sport&apiKey=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      breakingNews = data["articles"];
    } else {
      throw Exception("Failed to load news!");
    }
  }
}
