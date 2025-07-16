import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_style.dart';
import 'package:fruit_dashboard/core/widgets/custom_button.dart';
import 'package:fruit_dashboard/core/widgets/custom_checkedbox.dart';
import 'package:fruit_dashboard/core/widgets/custom_image_field.dart';
import 'package:fruit_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruit_dashboard/core/widgets/show_error.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  File? image;
  bool isChecked = false;

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
                    isChecked: isChecked,
                    onChanged: (bool value) {
                      isChecked = value;
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
                      // TODO write code that add the data in the database
                    }else{
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }else{
                    showError(context, 'Select image, please');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
