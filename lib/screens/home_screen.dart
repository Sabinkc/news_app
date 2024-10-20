import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/category_card.dart';
import 'package:news_app/common/slider_card.dart';
import 'package:news_app/common/trending_newstile.dart';
import 'package:news_app/repository/categories_list_data.dart';
import 'package:news_app/screens/category_news_screen.dart';
import 'package:news_app/services/breaking_news_api.dart';
import 'package:news_app/services/trending_news_api.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool isTrendLoading = true;
  bool isBreakLoading = true;

  BreakingNewsApi breakingNewsApi = BreakingNewsApi();
  TrendingNewsApi trendingNewsApi = TrendingNewsApi();
  @override
  void initState() {
    fetchBrekaingNews();
    fetchTrendingNews();
    super.initState();
  }

  Future<void> fetchBrekaingNews() async {
    await breakingNewsApi.fetchBreakingNews();
    setState(() {
      isBreakLoading = false;
    });
  }

  Future<void> fetchTrendingNews() async {
    await trendingNewsApi.fetchTrendingNews();
    setState(() {
      isTrendLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
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
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CategoryNewsScreen(
                              category: CategoryListData.categories[index]
                                  ["category_name"]!);
                        }));
                      },
                      child: CategoryCard(
                        category_name: CategoryListData.categories[index]
                            ["category_name"]!,
                        category_image: CategoryListData.categories[index]
                            ["category_image"]!,
                      ),
                    );
                  })),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Breaking News!",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text("View all",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          isBreakLoading
              ? Center(child: CircularProgressIndicator())
              : CarouselSlider.builder(
                  itemCount: breakingNewsApi.breakingNews.length,
                  itemBuilder: (context, index, realIndex) {
                    return SliderCard(
                        sliderText: breakingNewsApi.breakingNews[index]
                                ["title"] ??
                            "No title availiable",
                        sliderImage: breakingNewsApi.breakingNews[index]
                                ["urlToImage"] ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDN5oYPxAWzDeDqBjmcFv0C-t1N_PwGhJEdQ&s");
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, context) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    enlargeCenterPage: true,
                    viewportFraction: 0.6,
                    autoPlay: true,
                    height: 200,
                  )),
          SizedBox(
            height: 15,
          ),
          AnimatedSmoothIndicator(activeIndex: currentIndex, count: 5),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending News!",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text("View all",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue))
              ],
            ),
          ),
          Expanded(
            child: isTrendLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: trendingNewsApi.trendingNews.length,
                    itemBuilder: (context, index) {
                      return TrendingNewstile(
                        title: trendingNewsApi.trendingNews[index]["title"] ??
                            "No title availiable",
                        description: trendingNewsApi.trendingNews[index]
                                ["description"] ??
                            "No description availiable",
                        image: trendingNewsApi.trendingNews[index]
                                ["urlToImage"] ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDN5oYPxAWzDeDqBjmcFv0C-t1N_PwGhJEdQ&s",
                      );
                    }),
          )
        ],
      ),
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/common/category_card.dart';
// import 'package:news_app/common/slider_card.dart';
// import 'package:news_app/common/trending_newstile.dart';
// import 'package:news_app/repository/categories_list_data.dart';
// import 'package:news_app/screens/category_news_screen.dart';
// import 'package:news_app/services/breaking_news_api.dart';
// import 'package:news_app/services/trending_news_api.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int currentIndex = 0;
//   bool isTrendLoading = true;
//   bool isBreakLoading = true;

//   BreakingNewsApi breakingNewsApi = BreakingNewsApi();
//   TrendingNewsApi trendingNewsApi = TrendingNewsApi();
//   @override
//   void initState() {
//     fetchBrekaingNews();
//     fetchTrendingNews();
//     super.initState();
//   }

//   Future<void> fetchBrekaingNews() async {
//     await breakingNewsApi.fetchBreakingNews();
//     setState(() {
//       isBreakLoading = false;
//     });
//   }

//   Future<void> fetchTrendingNews() async {
//     await trendingNewsApi.fetchTrendingNews();
//     setState(() {
//       isTrendLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.search,
//                 color: Colors.blue,
//               ))
//         ],
//         elevation: 0,
//         centerTitle: true,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "World",
//               style: TextStyle(fontWeight: FontWeight.w600),
//             ),
//             Text(
//               "News",
//               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 80,
//             child: ListView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               itemCount:
//                   CategoryListData.categories.length, // Get count dynamically
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to the CategoryNewsScreen when tapped
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CategoryNewsScreen(
//                           categoryName: CategoryListData.categories[index]
//                               ["category_name"]!,
//                         ),
//                       ),
//                     );
//                   },
//                   child: CategoryCard(
//                     category_name: CategoryListData.categories[index]
//                         ["category_name"]!,
//                     category_image: CategoryListData.categories[index]
//                         ["category_image"]!,
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Breaking News!",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                 ),
//                 Text("View all",
//                     style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.blue,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.blue))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           isBreakLoading
//               ? Center(child: CircularProgressIndicator())
//               : CarouselSlider.builder(
//                   itemCount: breakingNewsApi.breakingNews.length,
//                   itemBuilder: (context, index, realIndex) {
//                     return SliderCard(
//                         sliderText: breakingNewsApi.breakingNews[index]
//                                 ["title"] ??
//                             "No title availiable",
//                         sliderImage: breakingNewsApi.breakingNews[index]
//                                 ["urlToImage"] ??
//                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDN5oYPxAWzDeDqBjmcFv0C-t1N_PwGhJEdQ&s");
//                   },
//                   options: CarouselOptions(
//                     onPageChanged: (index, context) {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     },
//                     enlargeCenterPage: true,
//                     viewportFraction: 0.6,
//                     autoPlay: true,
//                     height: 200,
//                   )),
//           SizedBox(
//             height: 15,
//           ),
//           AnimatedSmoothIndicator(activeIndex: currentIndex, count: 5),
//           SizedBox(
//             height: 15,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Trending News!",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
//                 ),
//                 Text("View all",
//                     style: TextStyle(
//                         decoration: TextDecoration.underline,
//                         decorationColor: Colors.blue,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.blue))
//               ],
//             ),
//           ),
//           Expanded(
//             child: isTrendLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                     itemCount: trendingNewsApi.trendingNews.length,
//                     itemBuilder: (context, index) {
//                       return TrendingNewstile(
//                         title: trendingNewsApi.trendingNews[index]["title"] ??
//                             "No title availiable",
//                         description: trendingNewsApi.trendingNews[index]
//                                 ["description"] ??
//                             "No description availiable",
//                         image: trendingNewsApi.trendingNews[index]
//                                 ["urlToImage"] ??
//                             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDN5oYPxAWzDeDqBjmcFv0C-t1N_PwGhJEdQ&s",
//                       );
//                     }),
//           )
//         ],
//       ),
//     );
//   }
// }
