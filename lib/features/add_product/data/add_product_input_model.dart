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
    );
  }

  toMap() {
    return {
      'name': super.name,
      'code': super.code,
      'description': super.description,
      'price': super.price,
      'isFeatured': super.isFeatured,
      'imageUrl': super.imageUrl,
      'expirationsMonth': super.expirationsMonth,
      'isOrganic': super.isOrganic,
      'numOfCalories': super.numOfCalories,
      'unitAmount': super.unitAmount,
    };
  }
}
