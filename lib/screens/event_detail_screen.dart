import 'package:flutter/material.dart';
import '../models/event_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class EventDetailScreen extends StatefulWidget {
  final EventModel event;

  EventDetailScreen({required this.event});

  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // void _submitRegistration() {
  //   if (_formKey.currentState!.validate()) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Registration Successful!')),
  //     );
  //   }
  // }

  void _submitRegistration() async {
  if (_formKey.currentState!.validate()) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('eventHistory') ?? [];

    // Creating a map to store user details and event details
    Map<String, dynamic> registrationData = {
      'name': _nameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'eventTitle': widget.event.title,
      'eventImage': widget.event.image,
      'eventDescription': widget.event.description,
      'eventDateTime': widget.event.dateTime.toIso8601String(),
      'eventAddress': widget.event.address,
      'eventCity': widget.event.city,
      'eventContactInfo': widget.event.contactInfo,
      'eventCategory': widget.event.category,
      'eventPrice': widget.event.price,
      'eventCapacity': widget.event.capacity,
    };

    // Add the registration data to the history list
    history.add(jsonEncode(registrationData));

    // Save the updated history back to SharedPreferences
    await prefs.setStringList('eventHistory', history);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration Successful!')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final event = widget.event;

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Card with image + event info
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image inside card
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      event.image,
                      width: double.infinity,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(event.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text("${event.category} | ${event.city}", style: TextStyle(color: Colors.grey[600])),
                        SizedBox(height: 12),
                        Text("📝 Description:", style: TextStyle(fontWeight: FontWeight.w600)),
                        Text(event.description),
                        SizedBox(height: 10),
                        Text("👤 Organizer: ${event.organizer}"),
                        Text("📅 Date & Time: ${event.dateTime.toString()}"),
                        Text("📍 Address: ${event.address}"),
                        Text("📞 Contact: ${event.contactInfo}"),
                        Text("💵 Price: ₹${event.price.toStringAsFixed(2)}"),
                        Text("👥 Capacity: ${event.capacity} People"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Register Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),

            // Registration Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Please enter your name' : null,
                  ),
                  SizedBox(height: 10),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Please enter your email';
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Enter valid email';
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Please enter phone number' : null,
                  ),
                  SizedBox(height: 20),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitRegistration,
                      child: Text('Submit Registration'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
