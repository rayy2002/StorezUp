class OfferModel {
  final String shopName;
  final String offerTitle;
  final String description;

  OfferModel({
    required this.shopName,
    required this.description,
    required this.offerTitle,
  });

  Map<String, dynamic> getJson() {
    return {
      'shopName': shopName,
      'description': description,
      'offerTitle': offerTitle,
    };
  }

  factory OfferModel.getModelFromJson({required Map<String, dynamic> json}) {
    return OfferModel(
      shopName: json["shopName"],
      offerTitle: json["offerTitle"],
      description: json["description"],
    );
  }
}
