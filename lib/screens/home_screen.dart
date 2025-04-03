import 'package:flutter/material.dart';
import 'event_detail_screen.dart';
import 'profile_screen.dart';
import 'about_us_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {
      'title': 'Music Concert',
      'image': 'assets/music.jpg',
      'description': 'Live Music Concert'
    },
    {
      'title': 'Tech Conference',
      'image': 'assets/tech.jpg',
      'description': 'Latest Tech Trends'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: Image.asset(events[index]['image']!,
                  width: 80, height: 80, fit: BoxFit.cover),
              title: Text(events[index]['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(events[index]['description']!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => EventDetailScreen(event: events[index]))),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                title: Text('Profile'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()))),
            ListTile(
                title: Text('About Us'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AboutUsScreen()))),
            ListTile(
              title: Text('Logout'),
              onTap: () => _showLogoutDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LoginScreen())); // Navigate to Login
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
