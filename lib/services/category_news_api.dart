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

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class CategoryNewsApi {
//   final String _apiKey =
//       'de01d1727e644a86b45fbe2e810873bd'; // Replace with your News API key
//   final String _baseUrl = 'https://newsapi.org/v2/top-headlines';

//   Future<List<dynamic>> fetchCategoryNews(String category) async {
//     try {
//       final response = await http
//           .get(Uri.parse('$_baseUrl?category=$category&apiKey=$_apiKey'));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return data['articles']; // Return the list of articles
//       } else {
//         throw Exception('Failed to load category news');
//       }
//     } catch (e) {
//       print(e);
//       return []; // Return an empty list in case of an error
//     }
//   }
// }
