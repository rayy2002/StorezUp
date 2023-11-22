class EventModel {
  final String date;
  final String shopName;
  final String eventName;
  final String description;
  final String shopImage;
  final String shopLocation;

  EventModel({
    required this.date,
    required this.shopName,
    required this.description,
    required this.eventName,
    required this.shopImage,
    required this.shopLocation,
  });

  Map<String, dynamic> getJson() {
    return {
      'date': date,
      'shopName': shopName,
      'description': description,
      'eventName': eventName,
      'shopImage': shopImage,
      'shopLocation': shopLocation
    };
  }

  factory EventModel.getModelFromJson({required Map<String, dynamic> json}) {
    return EventModel(
      date: json["date"],
      shopName: json["shopName"],
      eventName: json["eventName"],
      description: json["description"],
      shopImage: json["shopImage"],
      shopLocation: json["shopLocation"],
    );
  }
}
