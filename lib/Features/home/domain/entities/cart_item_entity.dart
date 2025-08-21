import 'package:equatable/equatable.dart';

import '../../../../core/entities/product_entity.dart';

class CarItemEntity extends Equatable {
  final ProductEntity productEntity;
  int count;

  CarItemEntity({required this.productEntity, this.count = 0});

  num toTalPrice() => productEntity.price * count;

  num totalWeight() => productEntity.unitAmount! * count;

  increaseCount() => count++;

  decreaseCount() {
    if (count > 1) {
      count--;
    }
  }

  @override
  List<Object> get props => [productEntity];
}
