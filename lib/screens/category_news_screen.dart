import 'package:flutter/material.dart';
import 'package:news_app/common/trending_newstile.dart';
import 'package:news_app/services/category_news_api.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      onTap: () {
                        final Uri url = Uri.parse(
                            categoryNewsApi.categoryNews[index]["url"]);

                        Future<void> _launchUrl() async {
                          if (!await launchUrl(url)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(seconds: 3),
                                content: Text("Couldnot load url")));
                          }
                        }

                        _launchUrl();
                      },
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
