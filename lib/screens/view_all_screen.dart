import 'package:flutter/material.dart';
import 'package:news_app/common/trending_newstile.dart';
import 'package:news_app/services/trending_news_api.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<ViewAllScreen> {
  bool isLoading = true;
  TrendingNewsApi trendingNewsApi = TrendingNewsApi();

  @override
  void initState() {
    fetchTrendingNews();
    super.initState();
  }

  Future<void> fetchTrendingNews() async {
    await trendingNewsApi.fetchTrendingNews();
    setState(() {
      isLoading = false;
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
                "World",
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
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: trendingNewsApi.trendingNews.length,
                itemBuilder: (context, index) {
                  return TrendingNewstile(
                      onTap: () {
                        final Uri _url = Uri.parse(
                            trendingNewsApi.trendingNews[index]["url"]);

                        Future<void> _launchUrl() async {
                          if (!await launchUrl(_url)) {
                            // Show a Snackbar if URL can't be launched
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Could not launch $_url'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        }

                        _launchUrl();
                      },
                      title: trendingNewsApi.trendingNews[index]["title"] ??
                          "No title",
                      description: trendingNewsApi.trendingNews[index]
                              ["description"] ??
                          "No description",
                      image: trendingNewsApi.trendingNews[index]
                              ["urlToImage"] ??
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDN5oYPxAWzDeDqBjmcFv0C-t1N_PwGhJEdQ&s");
                }));
  }
}
