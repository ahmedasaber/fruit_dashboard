import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_dashboard/features/orders/presentation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(text: 'add data', onPressed: (){
            Navigator.pushNamed(context, AddProductView.routeName);
          }),
          SizedBox(height: 16,),
          CustomButton(text: 'Show Orders', onPressed: (){
            Navigator.pushNamed(context, OrdersView.routeName);
          }),
        ],
      ),
    );
  }
}
