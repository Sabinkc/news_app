import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoryNewsApi {
  List categoryNews = [];

  Future<void> fetchCategoryNews(String category) async {
    final apiKey = "de01d1727e644a86b45fbe2e810873bd";
    final url =
        "https://newsapi.org/v2/top-headlines?category=$category&apiKey=$apiKey";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      categoryNews = data["articles"];
    } else {
      throw Exception("Failed to load data!");
    }
  }
}
