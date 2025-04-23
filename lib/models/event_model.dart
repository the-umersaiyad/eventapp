// class EventModel {
//   final String title;
//   final String image;
//   final String description;

//   EventModel({required this.title, required this.image, required this.description});
// }

class EventModel {
  final String title;
  final String image;
  final String description;
  final String organizer;
  final DateTime dateTime;
  final String address;
  final String city;
  final String contactInfo;
  final String category;
  final double price;
  final int capacity;

  EventModel({
    required this.title,
    required this.image,
    required this.description,
    required this.organizer,
    required this.dateTime,
    required this.address,
    required this.city,
    required this.contactInfo,
    required this.category,
    required this.price,
    required this.capacity,
  });


   factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json['title'],
        image: json['image'],
        description: json['description'],
        organizer: json['organizer'],
        dateTime: DateTime.parse(json['dateTime']),
        address: json['address'],
        city: json['city'],
        contactInfo: json['contactInfo'],
        category: json['category'],
        price: json['price'],
        capacity: json['capacity'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'image': image,
        'description': description,
        'organizer': organizer,
        'dateTime': dateTime.toIso8601String(),
        'address': address,
        'city': city,
        'contactInfo': contactInfo,
        'category': category,
        'price': price,
        'capacity': capacity,
      };
}