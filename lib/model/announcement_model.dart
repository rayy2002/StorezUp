class AnnouncementModel {
  final String shopName;
  final String announcement;
  final String description;

  AnnouncementModel({
    required this.shopName,
    required this.description,
    required this.announcement,
  });

  Map<String, dynamic> getJson() {
    return {
      'shopName': shopName,
      'description': description,
      'announcement': announcement,
    };
  }

  factory AnnouncementModel.getModelFromJson(
      {required Map<String, dynamic> json}) {
    return AnnouncementModel(
      shopName: json["shopName"],
      announcement: json["announcement"],
      description: json["description"],
    );
  }
}
