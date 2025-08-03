import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel extends AddProductInputEntity {
  AddProductInputModel({
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
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
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
