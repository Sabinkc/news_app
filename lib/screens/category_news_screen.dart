import 'package:flutter/material.dart';
import 'package:news_app/common/trending_newstile.dart';
import 'package:news_app/services/category_news_api.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String category;
  const CategoryNewsScreen({super.key, required this.category});

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  bool isCatLoading = true;
  CategoryNewsApi categoryNewsApi = CategoryNewsApi();

  @override
  void initState() {
    fetchCategoryNews();
    super.initState();
  }

  Future<void> fetchCategoryNews() async {
    await categoryNewsApi.fetchCategoryNews(widget.category);
    setState(() {
      isCatLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
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
                "${widget.category}",
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
        body: isCatLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: categoryNewsApi.categoryNews.length,
                itemBuilder: (context, index) {
                  return TrendingNewstile(
                      title: categoryNewsApi.categoryNews[index]["title"] ??
                          "No title",
                      description: categoryNewsApi.categoryNews[index]
                              ["description"] ??
                          "No description",
                      image: categoryNewsApi.categoryNews[index]
                              ["urlToImage"] ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDN5oYPxAWzDeDqBjmcFv0C-t1N_PwGhJEdQ&s");
                }));
  }
}


// import 'package:flutter/material.dart';
// import 'package:news_app/services/category_news_api.dart'; // Assuming you have this service

// class CategoryNewsScreen extends StatefulWidget {
//   final String categoryName;

//   const CategoryNewsScreen({super.key, required this.categoryName});

//   @override
//   State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
// }

// class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
//   bool isLoading = true;
//   List<dynamic> categoryNews = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCategoryNews();
//   }

//   Future<void> fetchCategoryNews() async {
//     // Replace this with your logic to fetch news based on the category
//     CategoryNewsApi categoryNewsApi = CategoryNewsApi();
//     categoryNews = await categoryNewsApi.fetchCategoryNews(widget.categoryName);

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.categoryName} News"),
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: categoryNews.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(
//                       categoryNews[index]["title"] ?? "No title available"),
//                   subtitle: Text(categoryNews[index]["description"] ??
//                       "No description available"),
//                   leading:
//                       Image.network(categoryNews[index]["urlToImage"] ?? ""),
//                 );
//               },
//             ),
//     );
//   }
// }
