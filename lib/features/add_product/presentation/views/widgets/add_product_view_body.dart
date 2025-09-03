import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_style.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/core/widgets/custom_checkedbox.dart';
import 'package:fruit_dashboard/core/widgets/custom_image_field.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_dashboard/core/widgets/show_error.dart';
import 'package:fruit_dashboard/features/add_product/data/review_model.dart';
import 'package:fruit_dashboard/features/add_product/domain/entities/product_entity.dart';

import '../../cubit/add_product_cubit.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationsMonths, numOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

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
                onSaved: (value){
                  code = value!.toLowerCase();
                },
                hintText: 'Product Code',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value){
                  name = value!;
                },
                hintText: 'Product Name',
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value){
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value){
                  expirationsMonths = num.parse(value!);
                },
                hintText: 'expiration months',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value){
                  numOfCalories = num.parse(value!);
                },
                hintText: 'Number of Calories',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value){
                  unitAmount = num.parse(value!);
                },
                hintText: 'Unit Amount',
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value){
                  description = value!;
                },
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLine: 5,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Is Featured Item?',
                    style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(width: 25,),
                  CustomCheckedBox(
                    isChecked: isFeatured,
                    onChanged: (bool value) {
                      isFeatured = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Is Organic Item?',
                    style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
                  ),
                  SizedBox(width: 25,),
                  CustomCheckedBox(
                    isChecked: isOrganic,
                    onChanged: (bool value) {
                      isOrganic = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ImageField(onFileChanged: (file){
                image = file;
              },),
              SizedBox(height: 16),
              CustomButton(
                text: 'add',
                onPressed: () {
                  if(image!=null){
                    if(_formKey.currentState!.validate()){
                      _formKey.currentState!.save();
                      ProductEntity input = ProductEntity(
                          name: name,
                          code: code,
                          description: description,
                          price: price,
                          image: image!,
                          isFeatured: isFeatured,
                          expirationsMonth: expirationsMonths as int,
                          isOrganic: isOrganic,
                          numOfCalories: numOfCalories as int,
                          unitAmount: unitAmount as int,
                          reviews: [
                            ReviewModel(
                              name: 'tharwat',
                              imageProfile: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeautiful%2F&psig=AOvVaw19xjUBre0RXfV2IZ-cEAEV&ust=1726749821993000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCPCJ3L_CzIgDFQAAAAAdAAAAABAE',
                              rating: 5,
                              date: DateTime.now().toIso8601String(),
                              reviewDescription: 'Nice product',
                            ),
                          ],
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    }else{
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }else{
                    showError(context, 'Select image, please');
                  }
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
