class FeatureModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String pricingOption;

  FeatureModel({
    required this.id,
    required this.name,
    this.description = '',
    required this.price,
    required this.pricingOption,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      pricingOption: json['pricingOption'] ?? '',
    );
  }
}
