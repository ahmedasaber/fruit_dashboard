import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/core/services/database_service.dart';
import 'package:fruit_dashboard/core/utils/backend_endpoints.dart';
import 'package:fruit_dashboard/features/orders/data/models/order%20model/order_model.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/repo/orders_repo.dart';

class OrdersRepoImpl extends OrdersRepo{
  final DatabaseService databaseService;

  OrdersRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async{
    try {
      var data = await databaseService.getData(path: BackendEndpoints.order) as List<Map<String, dynamic>>;
      List<OrderEntity> ordersEntity = data.map((e) => OrderModel.fromJson(e).toEntity()).toList();
      return right(ordersEntity);
    } catch (e) {
      return left(ServerFailure('Failed to fetch orders -> $e'));
    }
  }
}