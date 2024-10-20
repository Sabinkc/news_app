import 'dart:convert';

import 'package:http/http.dart' as http;

class TrendingNewsApi {
  List trendingNews = [];

  Future<void> fetchTrendingNews() async {
    final apiKey = "de01d1727e644a86b45fbe2e810873bd";

    final url =
        'https://newsapi.org/v2/top-headlines?country=us&sortBy=popularity&pageSize=20&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      trendingNews = data["articles"];
    } else {
      throw Exception("Failed to load news!");
    }
  }
}
