import 'dart:developer';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key,
  });

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async{
          setState(() { isLoading = true; });
          try {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(source: ImageSource.gallery);
            log(image!.name);
          } on Exception catch (e) {
            log(e.toString());
          }
          setState(() { isLoading = false; });
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.hintTextColor,
                width: 2
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.image_outlined,
            size: 180,
            color: AppColors.hintTextColor,
          ),
        ),
      ),
    );
  }
}