import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/repos/image_repo/image_repo.dart';
import 'package:fruit_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_dashboard/core/services/get_it_service.dart';
import 'package:fruit_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruit_dashboard/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:fruit_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = "add product";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Add Product'),
      body: BlocProvider(
        create: (context) => AddProductCubit(getIt<ImageRepo>(), getIt<ProductRepo>()),
        child: AddProductViewBodyBuilder(),
      ),
    );
  }
}
