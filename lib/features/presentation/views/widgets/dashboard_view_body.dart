import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomButton(text: 'add data', onPressed: (){})
        ],
      ),
    );
  }
}
