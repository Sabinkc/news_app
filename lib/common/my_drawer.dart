import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/login_screen.dart';

class MyDrawer extends StatelessWidget {
  Future<void> logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.people,
                  size: 30,
                )),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Loggedin Email: ",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Text(
                  user!.email ?? "Guest",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
              ],
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
            ),
            ListTile(
              leading: Icon(Icons.toggle_on),
              title: Text("Switch Light Mode"),
            ),
            Expanded(
              child: SizedBox(),
            ),
            ListTile(
              onTap: () {
                logOut(context);
              },
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
              title: Text("LogOut"),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
