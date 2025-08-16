import 'dart:io';

import 'package:fruit_hup/core/entities/review_entity.dart';


class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final File image;
  final bool isFeatured;
   String? imageUrl;
   final int? expirationMonths;
   final bool isOrganic;
   final int? numOfCalories;
   final int? unitAmount;
   final num averageRating=0;
   final num ratingCount=0;
   final List<ReviewEntity> reviews;




  ProductEntity({
    required this.reviews,
     this.isOrganic=false,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
      this.imageUrl,
    required this.isFeatured,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.image,

  });

}