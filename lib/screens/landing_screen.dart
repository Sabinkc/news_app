import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login_screen.dart';
import 'package:page_transition/page_transition.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/news.jpg",
                height: MediaQuery.of(context).size.height * 0.7,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              textAlign: TextAlign.center,
              "Bringing the world's news to your fingertips",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Take your time, there’s a world of stories waiting for you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 12)),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        duration: Duration(seconds: 1),
                        child: LoginScreen(),
                        type: PageTransitionType.leftToRight));
              },
              child: Text(
                "GetStarted",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
