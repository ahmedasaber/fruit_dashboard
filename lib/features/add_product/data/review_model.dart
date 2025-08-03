import 'package:fruit_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.name,
    required super.imageProfile,
    required super.rating,
    required super.ratingDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity){
    return ReviewModel(
      name: reviewEntity.name,
      imageProfile: reviewEntity.imageProfile,
      rating: reviewEntity.rating,
      ratingDescription: reviewEntity.ratingDescription
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData){
    return ReviewModel(
      name: jsonData['name'],
      imageProfile: jsonData['imageProfile'],
      rating: jsonData['rating'],
      ratingDescription:jsonData['ratingDescription']
    );
  }

  toMap() {
    return {
      'name': name,
      'imageProfile': imageProfile,
      'rating': rating,
      'ratingDescription': ratingDescription,
    };
  }
}
