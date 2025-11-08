import 'package:flutter/material.dart';
import 'package:fruit_dashboard/features/orders/domain/entities/shipping_address_entity.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/widgets/build_address_info.dart';

Widget buildShippingSection(ShippingAddressEntity shippingAddress) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.local_shipping, size: 20, color: Colors.grey.shade700),
          const SizedBox(width: 8),
          const Text(
            'Shipping Address',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
      buildAddressInfo(Icons.person, shippingAddress.name ?? 'N/A'),
      buildAddressInfo(Icons.email, shippingAddress.email ?? 'N/A'),
      buildAddressInfo(Icons.phone, shippingAddress.phone ?? 'N/A'),
      buildAddressInfo(Icons.location_on, '${shippingAddress.address ?? ''}, ${shippingAddress.city ?? ''}'),
      buildAddressInfo(Icons.info_outline, shippingAddress.addressDetails),
    ],
  );
}
