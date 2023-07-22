import 'package:flutter/material.dart';
import 'package:nike/profile/profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue, // Set the background color to blue
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                          'assets/profile/profile.png'), // Replace with your actual profile photo image asset path.
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Lorem Ipsum',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            buildMenuItem(
              icon: Icons.person,
              title: 'Profile',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            buildMenuItem(
              icon: Icons.insert_chart,
              title: 'My Chart',
              onTap: () {
                Navigator.pop(context);
                print("My Chart menu is selected.");
              },
            ),
            buildMenuItem(
              icon: Icons.favorite,
              title: 'Favorit',
              onTap: () {
                Navigator.pop(context);
                print("Favorit menu is selected.");
              },
            ),
            buildMenuItem(
              icon: Icons.shopping_cart,
              title: 'Order',
              onTap: () {
                Navigator.pop(context);
                print("Order menu is selected.");
              },
            ),
            buildMenuItem(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                Navigator.pop(context);
                print("Notifications menu is selected.");
              },
            ),
            buildMenuItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {
                Navigator.pop(context);
                print("Settings menu is selected.");
              },
            ),
            Divider(
              color:
                  Colors.white, // Set the color of the horizontal line to white
              height: 1, // Set the height of the horizontal line
              thickness: 1, // Set the thickness of the horizontal line
              indent:
                  16, // Set the indentation of the horizontal line from the left edge
              endIndent:
                  16, // Set the indentation of the horizontal line from the right edge
            ),
            buildMenuItem(
              icon: Icons.exit_to_app,
              title: 'Sign out',
              onTap: () {
                Navigator.pop(context);
                print("Sign out menu is selected.");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white, // Set icon color to white
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
