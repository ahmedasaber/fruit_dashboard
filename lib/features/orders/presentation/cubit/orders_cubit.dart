import 'package:bloc/bloc.dart';
import 'package:fruit_dashboard/features/orders/data/models/order%20model/order_model.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/repo/orders_repo.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  final OrdersRepo ordersRepo;

  Future<void> getOrders() async{
    var result = await ordersRepo.fetchOrders();
    result.fold(
      (failure) => emit(OrdersFailure(errMessage: failure.message)),
      (ordersEntity) => emit(OrdersSuccess(orders: ordersEntity))
    );
  }
}
