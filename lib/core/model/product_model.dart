
import 'dart:io';

import 'package:fruit_hup/core/model/review_model.dart';

import '../entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int? expirationMonths;
  final bool isOrganic ;
  final int? numOfCalories;
  final int? unitAmount;
  final num averageRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews ;

  ProductModel({
    required this.reviews,
    this.isOrganic=false,
    required this.name,
    required this.code,
    required this.description,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromEntity(ProductEntity entity) =>
      ProductModel(
        reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
        isOrganic: entity.isOrganic,
        expirationMonths: entity.expirationMonths,
        numOfCalories: entity.numOfCalories,
        unitAmount: entity.unitAmount,
        imageUrl: entity.imageUrl,
        isFeatured: entity.isFeatured,
        code: entity.code,
        name: entity.name,
        description: entity.description,
        price: entity.price,
        image: entity.image,
      );

  toJson() => <String, dynamic>{
    'name': name,
    'code': code,
    'description': description,
    'price': price,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'expirationMonths': expirationMonths,
    'isOrganic': isOrganic,
    'numOfCalories': numOfCalories,
    'unitAmount': unitAmount,
    'reviews': reviews.map((e) => e.toJson()).toList(),
  };
}
