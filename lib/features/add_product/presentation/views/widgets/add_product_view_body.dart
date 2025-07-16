import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/widgets/custom_image_field.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLine: 5,
              ),
              SizedBox(height: 16),
              ImageField(),
            ],
          ),
        ),
      ),
    );
  }
}
