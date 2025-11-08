
import 'package:fruit_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/shipping_address_entity.dart';


class OrderDummyData {
  // Dummy Shipping Addresses
  static ShippingAddressEntity address1 = ShippingAddressEntity(
    name: 'John Smith',
    email: 'john.smith@email.com',
    address: '123 Main Street',
    phone: '+1 234-567-8900',
    city: 'New York',
    addressDetails: 'Apartment 4B, Ring doorbell twice',
  );

  static ShippingAddressEntity address2 = ShippingAddressEntity(
    name: 'Sarah Johnson',
    email: 'sarah.j@email.com',
    address: '456 Oak Avenue',
    phone: '+1 987-654-3210',
    city: 'Los Angeles',
    addressDetails: 'Leave package at front desk',
  );

  static ShippingAddressEntity address3 = ShippingAddressEntity(
    name: 'Michael Brown',
    email: 'mbrown@email.com',
    address: '789 Pine Road',
    phone: '+1 555-123-4567',
    city: 'Chicago',
    addressDetails: 'Gate code: 1234',
  );

  // Dummy Order Products
  static List<OrderProductEntity> products1 = [
    OrderProductEntity(
      name: 'Fresh Strawberries',
      code: 'FRUIT-001',
      imageUrl: 'https://images.unsplash.com/photo-1543528176-61b239494933?w=400',
      price: 4.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Organic Bananas',
      code: 'FRUIT-002',
      imageUrl: 'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=400',
      price: 2.49,
      quantity: 3,
    ),
    OrderProductEntity(
      name: 'Red Apples',
      code: 'FRUIT-003',
      imageUrl: 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=400',
      price: 3.99,
      quantity: 1,
    ),
  ];

  static List<OrderProductEntity> products2 = [
    OrderProductEntity(
      name: 'Fresh Oranges',
      code: 'FRUIT-004',
      imageUrl: 'https://images.unsplash.com/photo-1547514701-42782101795e?w=400',
      price: 5.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Watermelon',
      code: 'FRUIT-005',
      imageUrl: 'https://images.unsplash.com/photo-1587049352846-4a222e784d38?w=400',
      price: 8.99,
      quantity: 1,
    ),
  ];

  static List<OrderProductEntity> products3 = [
    OrderProductEntity(
      name: 'Blueberries',
      code: 'FRUIT-006',
      imageUrl: 'https://images.unsplash.com/photo-1498557850523-fd3d118b962e?w=400',
      price: 6.99,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Mango',
      code: 'FRUIT-007',
      imageUrl: 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=400',
      price: 4.49,
      quantity: 3,
    ),
    OrderProductEntity(
      name: 'Pineapple',
      code: 'FRUIT-008',
      imageUrl: 'https://images.unsplash.com/photo-1550258987-190a2d41a8ba?w=400',
      price: 7.99,
      quantity: 1,
    ),
    OrderProductEntity(
      name: 'Grapes',
      code: 'FRUIT-009',
      imageUrl: 'https://images.unsplash.com/photo-1599819177186-9bdfe8e72884?w=400',
      price: 5.49,
      quantity: 2,
    ),
  ];

  static List<OrderProductEntity> products4 = [
    OrderProductEntity(
      name: 'Kiwi',
      code: 'FRUIT-010',
      imageUrl: 'https://images.unsplash.com/photo-1585059895524-72359e06133a?w=400',
      price: 3.49,
      quantity: 4,
    ),
  ];

  // Dummy Orders
  static OrderEntity order1 = OrderEntity(
    totalPrice: 19.44,
    uld: 'ORD-2024-001',
    shippingAddressEntity: address1,
    orderProducts: products1,
    paymentMethod: 'cash',
    status: 'pending',
  );

  static OrderEntity order2 = OrderEntity(
    totalPrice: 20.97,
    uld: 'ORD-2024-002',
    shippingAddressEntity: address2,
    orderProducts: products2,
    paymentMethod: 'online',
    status: 'pending',
  );

  static OrderEntity order3 = OrderEntity(
    totalPrice: 35.43,
    uld: 'ORD-2024-003',
    shippingAddressEntity: address3,
    orderProducts: products3,
    status: 'pending',
    paymentMethod: 'cash',
  );

  static OrderEntity order4 = OrderEntity(
    totalPrice: 13.96,
    uld: 'ORD-2024-004',
    shippingAddressEntity: address1,
    orderProducts: products4,
    status: 'pending',
    paymentMethod: 'online',
  );

  // List of all dummy orders
  static List<OrderEntity> getAllOrders() {
    return [order1, order2, order3, order4];
  }

  static List<OrderEntity> getSomeDummyOrders() {
    return [order1, order2];
  }

  // Get random order
  static OrderEntity getRandomOrder() {
    final orders = getAllOrders();
    return orders[(DateTime.now().millisecondsSinceEpoch % orders.length)];
  }
}