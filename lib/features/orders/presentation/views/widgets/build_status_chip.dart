import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/cubit/update%20order/update_order_cubit.dart';

List<String> statuses = ['Pending', 'Completed', 'Canceled'];

Widget buildStatusChip(BuildContext context, OrderEntity order) {
  String status = order.status;
  return PopupMenuButton(
      onSelected: (i) {
        if (statuses[i].toLowerCase() != status.toLowerCase()) {
          context.read<UpdateOrderCubit>().updateStatus(
            status: statuses[i],
            orderId: order.orderId,
          );
        }
      },
      itemBuilder: (context) {
        return List.generate(
          statuses.length,
          (i) => PopupMenuItem(value: i, child: Text(statuses[i])),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: status == statuses[0] ? Colors.orange.shade100
            : status == statuses[1] ? Colors.green.shade100
            : Colors.red.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: status == statuses[0] ? Colors.orange.shade900
              : status == statuses[1] ? Colors.green.shade900
              : Colors.red.shade900,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
  );
}
