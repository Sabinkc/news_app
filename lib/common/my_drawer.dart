import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          children: [
            Text(
              "World News",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              trailing: Icon(Icons.arrow_back_ios),
              title: Text("Settings"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              trailing: Icon(Icons.arrow_back_ios),
              title: Text("Notifications"),
            ),
            ListTile(
              leading: Icon(Icons.toggle_on),
              trailing: Icon(Icons.arrow_back_ios),
              title: Text("Switch Light Mode"),
            )
          ],
        ),
      ),
    );
  }
}
