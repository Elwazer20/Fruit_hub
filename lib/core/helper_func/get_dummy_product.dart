import 'dart:io';

import 'package:fruit_hup/core/entities/product_entity.dart';

ProductEntity getDummyProduct() => ProductEntity(
  name: "Avocado",
  code: "AVO",
  description: "Avocado is a fruit",
  price: 20,
  reviews: [],
  expirationsMonths: 12,
  numberOfCalories: 100,
  unitAmount: 1,
  isOrganic: true,
  isFeatured: true,
  imageUrl: null ,

);
List<ProductEntity> getDummyProducts() => List.generate(10, (index) => getDummyProduct());