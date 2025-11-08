import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/build_payment_method.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/build_product_item.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/build_shipping_section.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/build_status_chip.dart';

class OrderItemCard extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback? onTap;

  const OrderItemCard({super.key, required this.order, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tag, size: 14, color: Colors.grey.shade600),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      order.orderId,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Header with status and payment method
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildStatusChip(context,order),
                  buildPaymentMethodChip(order.paymentMethod),
                ],
              ),
              const SizedBox(height: 16),
              // Order Products List
              ...order.orderProducts.map(
                (product) => buildProductItem(product),
              ),
              const Divider(height: 24),
              // Shipping Address
              buildShippingSection(order.shippingAddressEntity),
              const Divider(height: 24),
              // Total Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$${order.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
