import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductRepo{
  Future<Either<Failure, void>> addProduct(AddProductInputEntity input);
}