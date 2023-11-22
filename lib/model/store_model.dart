class StoreModel {
  final String imageLink;
  final String shopName;
  final String description;
  final String address;
  final String category;
  final String contact;
  final String uid;
  final String ownerId;

  StoreModel({
    required this.imageLink,
    required this.shopName,
    required this.description,
    required this.address,
    required this.category,
    required this.contact,
    required this.uid,
    required this.ownerId,
  });

  Map<String, dynamic> getJson() {
    return {
      'imageLink': imageLink,
      'shopName': shopName,
      'description': description,
      'address': address,
      'category': category,
      'contact': contact,
      'uid': uid,
      'ownerId': ownerId
    };
  }

  factory StoreModel.getModelFromJson({required Map<String, dynamic> json}) {
    return StoreModel(
        imageLink: json["imageLink"],
        shopName: json["shopName"],
        category: json["category"],
        description: json["description"],
        address: json["address"],
        contact: json["contact"],
        uid: json["uid"],
        ownerId: json["ownerId"]);
  }
}
