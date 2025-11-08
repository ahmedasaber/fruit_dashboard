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
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async*{
    try {
      await for(var data in databaseService.getStreamData(path: BackendEndpoints.order)){
        List<OrderEntity> ordersEntity = data.map((e) => OrderModel.fromJson(e).toEntity()).toList();
        yield right(ordersEntity);
      }
    } catch (e) {
      yield left(ServerFailure('Failed to fetch orders -> $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus({required String status , required String orderId}) async{
    try {
      databaseService.updateData(path: BackendEndpoints.updateOrder, data: {'status': status} , docId: orderId);
      return right(null);
    } catch (e) {
      return left(ServerFailure('Failed to update orders -> $e'));
    }
  }
}