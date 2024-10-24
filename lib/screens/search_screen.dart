// import 'package:flutter/material.dart';
// import 'package:news_app/common/colors.dart';
// import 'package:news_app/common/common_textfield.dart';
// import 'package:news_app/common/trending_newstile.dart';

// class SearchScreen extends StatefulWidget {
//   SearchScreen({super.key});

//   bool isSearchActive = false;

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: Builder(builder: (context) {
//             return IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(Icons.arrow_back));
//           }),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     widget.isSearchActive = !widget.isSearchActive;
//                   });
//                 },
//                 icon: Icon(
//                   Icons.search,
//                   color: Colors.blue,
//                 ))
//           ],
//           elevation: 0,
//           centerTitle: true,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Search",
//                 style: TextStyle(fontWeight: FontWeight.w600),
//               ),
//               Text(
//                 "News",
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               if (widget.isSearchActive)
//                 Container(
//                   child: Column(
//                     children: [
//                       CommonTextfield(
//                           labelText: "",
//                           hintText: "Search Here",
//                           suffixIcon: Icons.search,
//                           isObscure: false),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Divider(
//                         color: CommonColor.primaryColor.withOpacity(0.5),
//                       ),
//                     ],
//                   ),
//                 ),
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return TrendingNewstile(
//                           title: "hello",
//                           description: "hello brooooooo",
//                           image: "gggg");
//                     }),
//               )
//             ],
//           ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:news_app/common/colors.dart';
import 'package:news_app/common/trending_newstile.dart';
import 'package:news_app/common/common_textfield.dart';
import 'package:news_app/services/all_news_api.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearchActive = false;
  List allNews = [];
  List filteredNews = [];
  AllNewsApi apiService = AllNewsApi();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() async {
    List news = await apiService.fetchAllNews();
    setState(() {
      allNews = news;
      filteredNews = news;
    });
  }

  void _filterNews(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredNews = allNews;
      });
    } else {
      setState(() {
        filteredNews = allNews.where((article) {
          final title = article['title'] ?? '';
          return title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back));
          }),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isSearchActive = !isSearchActive;
                  });
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ))
          ],
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Search",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "News",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              if (isSearchActive)
                Column(
                  children: [
                    CommonTextfield(
                      isObscure: false,
                      labelText: "",
                      controller: searchController,
                      onChanged: (value) {
                        _filterNews(value);
                      },
                      hintText: "Search Here",
                      suffixIcon: Icons.search,
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: CommonColor.primaryColor.withOpacity(0.5),
                    ),
                  ],
                ),
              Expanded(
                child: filteredNews.isEmpty && searchController.text.isNotEmpty
                    ? Center(
                        child: Text(
                          "News not found",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredNews.length,
                        itemBuilder: (context, index) {
                          final news = filteredNews[index];
                          return TrendingNewstile(
                              title: news['title'] ?? 'No Title',
                              description:
                                  news['description'] ?? 'No Description',
                              image: news['urlToImage'] ?? '');
                        }),
              ),
            ],
          ),
        ));
  }
}
