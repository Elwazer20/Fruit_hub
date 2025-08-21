import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruit_hup/core/entities/review_entity.dart';


class ProductEntity extends Equatable {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
   String? imageUrl;
   final int? expirationsMonths;
   final bool isOrganic;
   final int? numberOfCalories;
   final int? unitAmount;
   final num averageRating=0;
   final num ratingCount=0;
   final List<ReviewEntity> reviews;




  ProductEntity({
    required this.reviews,
     this.isOrganic=false,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
      this.imageUrl,
    required this.isFeatured,
    required this.code,
    required this.name,
    required this.description,
    required this.price,

  });

  @override
  List<Object?> get props => [name, code];
}