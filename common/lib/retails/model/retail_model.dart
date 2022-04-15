import 'package:core/core.dart';

class RetailModel {
  final String id;
  final String name;
  final int transactionsNumber;
  final String totalAmount;
  final int discountPercentage;
  final String? description;
  final String? imageUrl;

  RetailModel({
    required this.id,
    required this.name,
    required this.transactionsNumber,
    required this.totalAmount,
    required this.discountPercentage,
    this.description,
    this.imageUrl,
  });

  factory RetailModel.fromJson(Map<String, dynamic> json) {
    return RetailModel(
      id: json.getRequiredKey('id'),
      name: json.getRequiredKey('name'),
      transactionsNumber: json.getRequiredKey('transactionsNumber'),
      totalAmount: json.getRequiredKey('totalAmount'),
      discountPercentage: json.getRequiredKey('discountPercentage'),
      description: json.getNullableKey('description'),
      imageUrl: json.getNullableKey('imageUrl'),
    );
  }

  String get discountPercentageString {
    return "$discountPercentage %";
  }

  @override
  bool operator ==(Object other) => other is RetailModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
