part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class OrdersLoading extends OrdersState {}
final class OrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;

  OrdersSuccess({required this.orders});
}
final class OrdersFailure extends OrdersState {
  final String errMessage;

  OrdersFailure({required this.errMessage});
}
