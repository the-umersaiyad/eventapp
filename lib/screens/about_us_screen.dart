import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Us')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text('EventConnect', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 10),
            Text(
              'EventConnect is a platform designed to provide users with the latest and trending events happening around them. From concerts to tech conferences, we keep you updated!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            SizedBox(height: 30),
            Text('Developed by:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 5),
            Text('• Umer Saiyad', style: TextStyle(color: Colors.white)),
            Text('• Email: contact@example.com', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
