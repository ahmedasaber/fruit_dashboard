import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = "add product";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Add Product'),
      body: AddProductViewBody(),
    );
  }
}
