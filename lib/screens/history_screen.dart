import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RegistrationHistoryScreen extends StatefulWidget {
  @override
  _RegistrationHistoryScreenState createState() =>
      _RegistrationHistoryScreenState();
}

class _RegistrationHistoryScreenState
    extends State<RegistrationHistoryScreen> {
  List<Map<String, dynamic>> _eventHistory = [];

  @override
  void initState() {
    super.initState();
    _loadHistory(); 
  }

  Future<void> _loadHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyStrings = prefs.getStringList('eventHistory') ?? [];

    setState(() {
      // Convert the history list from JSON string to actual list of maps
      _eventHistory = historyStrings
          .map((eventString) => jsonDecode(eventString) as Map<String, dynamic>)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Registration History'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _eventHistory.isEmpty
          ? Center(child: Text('No event registrations found.'))
          : ListView.builder(
              itemCount: _eventHistory.length,
              itemBuilder: (context, index) {
                final event = _eventHistory[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(event['eventTitle']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Organizer: ${event['eventOrganizer']}"),
                        Text("Date: ${event['eventDateTime']}"),
                        Text("Location: ${event['eventCity']}, ${event['eventAddress']}"),
                        Text("Price: ₹${event['eventPrice']}"),
                      ],
                    ),
                    leading: Image.asset(
                      event['eventImage'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
