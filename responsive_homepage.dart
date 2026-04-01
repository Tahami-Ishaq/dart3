import 'package:flutter/material.dart';

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Colors.blue,
      ),

      // 🔹 Drawer (Slide Menu)
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // 🔹 Body with Responsive Layout
      backgroundColor: Colors.grey.shade200,
      body: OrientationBuilder(
        builder: (context, orientation) {

          double screenWidth = MediaQuery.of(context).size.width;
          double baseWidth = 375;
          double scaleFactor = screenWidth / baseWidth;

          if (orientation == Orientation.landscape) {
            scaleFactor *= 0.8;
          }

          double avatarSize = 120 * scaleFactor;
          double buttonWidth = 200 * scaleFactor;
          double buttonHeight = 50 * scaleFactor;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Avatar
                CircleAvatar(
                  radius: avatarSize / 2,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.person,
                    size: 60 * scaleFactor,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 25 * scaleFactor),

                // Name Text
                Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 20 * scaleFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),

                SizedBox(height: 25 * scaleFactor),

                // Button
                SizedBox(
                  width: buttonWidth,
                  height: buttonHeight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Follow",
                      style: TextStyle(
                        fontSize: 16 * scaleFactor,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}