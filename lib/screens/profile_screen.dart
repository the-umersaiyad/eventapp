import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                  radius: 60, backgroundImage: AssetImage('assets/image.png')),
              SizedBox(height: 10),
              Text('John Doe',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              SizedBox(height: 5),
              Text('user@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.blueAccent),
                title: Text('+91 9876543210'),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.redAccent),
                title: Text('New York, USA'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Back'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
