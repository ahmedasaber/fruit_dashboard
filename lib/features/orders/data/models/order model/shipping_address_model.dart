import 'package:fruit_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  final String name;
  final String email;
  final String address;
  final String phone;
  final String city;
  final String addressDetails;

  ShippingAddressModel({
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    required this.city,
    required this.addressDetails,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      phone: json['phone'],
      city: json['city'],
      addressDetails: json['addressDetails'],
    );
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      address: address,
      phone: phone,
      city: city,
      addressDetails: addressDetails,
    );
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'city': city,
      'addressDetails': addressDetails,
    };
  }
}
