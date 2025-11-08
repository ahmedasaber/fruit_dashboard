import 'package:fruit_dashboard/features/orders/data/models/order%20model/shipping_address_model.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';

import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uld;
  final String orderId;
  final String status;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uld,
    required this.orderId,
    required this.status,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      uld: json['uld'],
      orderId: json['orderId'],
      status: json['status'] ?? 'pending',
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddressModel'],
      ),
      orderProducts: List.of(json['orderProducts']).map((e) => OrderProductModel.fromJson(e)).toList(),
      paymentMethod: json['paymentMethod'],
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uld: uld,
      orderId: orderId,
      status: status,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((e)=>e.toEntity()).toList(),
      paymentMethod: paymentMethod,
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uld': uld,
      'orderId': orderId,
      'status': 'pending',
      'data': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((entity) => entity.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
