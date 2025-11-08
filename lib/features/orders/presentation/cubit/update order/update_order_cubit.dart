import 'package:bloc/bloc.dart';
import 'package:fruit_dashboard/features/orders/domain/repo/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;
  Future<void> updateStatus({required String status, required String orderId}) async{
    emit(UpdateOrderLoading());
    var result = await ordersRepo.updateOrderStatus(status: status, orderId: orderId);
    result.fold(
      (failure) => emit(UpdateOrderFailure(errMessage: failure.message)),
      (success) => emit(UpdateOrderSuccess())
    );
  }
}
