import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/helper_functions/error_snack_bar.dart';
import 'package:fruit_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruit_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyBuilder extends StatelessWidget {
  const AddProductViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state){
        if (state is AddProductSuccess) {
          buildBar(context, 'Product added successfully');
        }
        if (state is AddProductFailure) {
          buildBar(context, state.message);
        }
      },
      builder: (context, state){
        return CustomProgressHUD(
            isLoading: state is AddProductLoading,
            child: AddProductViewBody(),
        );
      },
    );
  }
}
