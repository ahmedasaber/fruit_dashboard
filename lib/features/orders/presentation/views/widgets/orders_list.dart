import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/custom_order_item_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderItemCard(
          order: orders[index],
          onTap: () {
            // Navigate to order details page
            print('Order tapped: ${orders[index].uld}');
          },
        );
      },
    );
  }
}
