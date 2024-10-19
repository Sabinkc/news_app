import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/category_card.dart';
import 'package:news_app/common/slider_card.dart';
import 'package:news_app/common/trending_newstile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

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
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryCard();
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
                        fontWeight: FontWeight.w600, color: Colors.blue))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
              items: [
                SliderCard(),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
                SliderCard()
              ],
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
          AnimatedSmoothIndicator(activeIndex: currentIndex, count: 3),
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
                        fontWeight: FontWeight.w600, color: Colors.blue))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TrendingNewstile();
                }),
          )
        ],
      ),
    );
  }
}
