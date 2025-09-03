import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/product_entity.dart';

abstract class ProductRepo{
  Future<Either<Failure, void>> addProduct(ProductEntity input);
}