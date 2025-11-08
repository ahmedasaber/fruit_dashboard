import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/repo/orders_repo.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;

  late StreamSubscription _streamSubscription; // manage stream for cancellation

  void getOrders() {
    _streamSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (failure) => emit(OrdersFailure(errMessage: failure.message)),
        (ordersEntity) => emit(OrdersSuccess(orders: ordersEntity)),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
