import 'package:fruit_dashboard/features/add_product/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final int sellingCount;
  ProductModel({
    required super.name,
    required super.code,
    required super.description,
    required super.price,
    required super.image,
    required super.isFeatured,
    required super.imageUrl,
    required super.expirationsMonth,
    required super.numOfCalories,
    required super.unitAmount,
    required super.isOrganic,
    required super.reviews,
    this.sellingCount = 0 ,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      image: entity.image,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      expirationsMonth: entity.expirationsMonth,
      numOfCalories: entity.numOfCalories,
      unitAmount: entity.unitAmount,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews,
    );
  }

  toMap() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonth': expirationsMonth,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e)=>e.toMap()).toList(),
    };
  }
}
