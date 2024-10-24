// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class AllNewsApi {
//   List allNews = [];

//   Future<void> fetchallNews() async {
//     final apiKey = "de01d1727e644a86b45fbe2e810873bd";

//     final url =
//         'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

//     final response = await http.get(Uri.parse(url));
//     try {
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         allNews = data["articles"];
//       } else {
//         throw Exception("Failed to load news!");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class AllNewsApi {
  List allNews = [];

  Future<List> fetchAllNews() async {
    final apiKey =
        "de01d1727e644a86b45fbe2e810873bd"; // Replace with your actual API key
    final int pageSize = 100; // Max number of articles per page
    final int totalPages =
        10; // Number of pages to fetch (can adjust as needed)
    List newsArticles = [];

    try {
      for (int page = 1; page <= totalPages; page++) {
        final url =
            'https://newsapi.org/v2/top-headlines?country=us&pageSize=$pageSize&page=$page&apiKey=$apiKey';

        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          newsArticles.addAll(data['articles']);
        } else {
          throw Exception("Failed to load news!");
        }
      }
    } catch (e) {
      print(e);
    }

    return newsArticles;
  }
}
