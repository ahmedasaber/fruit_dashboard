import 'package:dartz/dartz.dart';
import 'package:fruit_dashboard/core/errors/failures.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo{
  Stream<Either<Failure,List<OrderEntity>>> fetchOrders();
  Future<Either<Failure,void>> updateOrderStatus({required String status , required String orderId});
}