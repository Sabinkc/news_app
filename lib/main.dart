// import 'package:flutter/material.dart';
// import 'package:news_app/screens/home_screen.dart';
// import 'package:news_app/screens/landing_screen.dart';

// void main(List<String> args) {
//   runApp(MyApplication());
// }

// class MyApplication extends StatelessWidget {
//   const MyApplication({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(List<String> args) {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'business',
    'entertainment',
    'health',
    'science',
    'sports'
  ];
  List articles = [];
  String selectedCategory = 'business'; // Default category

  @override
  void initState() {
    super.initState();
    fetchCategoryNews(selectedCategory);
  }

  Future<void> fetchCategoryNews(String category) async {
    final apiKey =
        'de01d1727e644a86b45fbe2e810873bd'; // Replace with your NewsAPI.org API key
    final url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        articles = data['articles'];
        selectedCategory = category; // Update the selected category
      });
    } else {
      throw Exception('Failed to load news for category: $category');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "World",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    fetchCategoryNews(categories[index]);
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: Text(categories[index])),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: articles.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(articles[index]['title']),
                        subtitle: Text(articles[index]['description'] ?? ''),
                        onTap: () {
                          // You can implement navigation to a detailed news view here if needed
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
