




import 'package:flutter/material.dart';
import '../models/event_model.dart';
import 'event_detail_screen.dart';
import 'profile_screen.dart';
import 'about_us_screen.dart';
import 'login_screen.dart';
import 'history_screen.dart';
class HomeScreen extends StatelessWidget {
  final List<EventModel> events = [
    EventModel(
      title: 'Music Concert',
      image: 'assets/music.jpg',
      description: 'Live Music Concert',
      organizer: 'XYZ Events',
      dateTime: DateTime.now().add(Duration(days: 5)),
      address: 'Stadium Road',
      city: 'Mumbai',
      contactInfo: '1234567890',
      category: 'Music',
      price: 500.0,
      capacity: 100,
    ),
    EventModel(
      title: 'Tech Conference',
      image: 'assets/tech.jpg',
      description: 'Latest Tech Trends',
      organizer: 'Tech Corp',
      dateTime: DateTime.now().subtract(Duration(days: 3)),
      address: 'Tech Park',
      city: 'Bangalore',
      contactInfo: '0987654321',
      category: 'Technology',
      price: 1000.0,
      capacity: 200,
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final pastEvents = events.where((e) => e.dateTime.isBefore(now)).toList();
    final upcomingEvents = events.where((e) => e.dateTime.isAfter(now)).toList();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: Text('Events')),
        body: TabBarView(
          children: [
            _buildEventList(context, events),
            _buildEventList(context, upcomingEvents),
            _buildEventList(context, pastEvents),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.event), text: "Upcoming"),
            Tab(icon: Icon(Icons.history), text: "Past"),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                  title: Text('History'),
                  onTap: () => Navigator.push( context,
                        MaterialPageRoute(builder: (_) =>RegistrationHistoryScreen()),
                 ),
              ),
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
      ),
    );
  }

  Widget _buildEventList(BuildContext context, List<EventModel> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          child: ListTile(
            leading: Image.asset(event.image,
                width: 80, height: 80, fit: BoxFit.cover),
            title: Text(event.title,
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(event.description),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EventDetailScreen(event: event),
              ),
            ),
          ),
        );
      },
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
              onPressed: () => Navigator.of(context).pop(),
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => LoginScreen()));
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}