import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashboard/core/services/database_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_dashboard/features/add_product/data/add_product_input_model.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';

class ProductRepoImpl implements ProductRepo{
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, void>> addProduct(AddProductInputEntity input) async{
    try{
      await databaseService.addData(
        path: BackendEndpoints.addProduct,
        data: AddProductInputModel.fromEntity(input).toMap()
      );
      return const Right(null);
    }catch(e){
      return Left(ServerFailure('Failed to add the product'));
    }
  }
}