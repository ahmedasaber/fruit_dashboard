import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/dummy%20data/order_dummy_data.dart';
import 'package:fruit_dashboard/core/widgets/show_error.dart';
import 'package:fruit_dashboard/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:fruit_dashboard/features/orders/presentation/cubit/update%20order/update_order_cubit.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/orders_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 24,),
          FilterSection(),
          const SizedBox(height: 10,),
          Expanded(child: BlocListener<UpdateOrderCubit, UpdateOrderState>(
            listener: (context, state) {
              if (state is UpdateOrderFailure) {
                showError(context, state.errMessage);
              } else if (state is UpdateOrderSuccess) {
                showError(context, 'Updated Successfully');
              }
            },
            child: BlocBuilder<OrdersCubit, OrdersState>(
              builder: (context, state) {
                if (state is OrdersSuccess) {
                  return OrdersListView(orders: state.orders,);
                } else if (state is OrdersFailure) {
                  return Center(child: Text(state.errMessage),);
                } else {
                  return Skeletonizer(child: OrdersListView(
                    orders: OrderDummyData.getSomeDummyOrders(),));
                }
              },
            ),
          )),
        ],
      ),
    );
  }
}