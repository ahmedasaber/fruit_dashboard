import 'package:fruit_dashboard/features/orders/domain/entities/shipping_address_entity.dart';
import 'order_product_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uld;
  final String orderId;
  final String status;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;

  OrderEntity({
    required this.totalPrice,
    required this.uld,
    required this.orderId,
    required this.status,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
