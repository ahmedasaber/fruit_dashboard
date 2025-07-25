import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyles.bold16.copyWith(color: Colors.white),)
      ),
    );
  }
}
