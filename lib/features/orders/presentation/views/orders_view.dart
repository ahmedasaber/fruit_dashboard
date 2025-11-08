import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/features/orders/domain/repo/orders_repo.dart';
import 'package:fruit_dashboard/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => OrdersCubit(getIt<OrdersRepo>())..getOrders(),
        child: OrdersViewBody(),
      ),
    );
  }
}
