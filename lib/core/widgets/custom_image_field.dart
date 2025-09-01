import 'dart:developer';
import 'dart:io';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key, required this.onFileChanged,
  });

  final ValueChanged<File?> onFileChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;
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
            if (image != null) {
              imageFile = File(image.path);
              widget.onFileChanged(imageFile);
            }
            log(imageFile!.path);
          } on Exception catch (e) {
            log(e.toString());
          }finally {
            // Always stop loading regardless of success or cancel
            if (mounted) {
              setState(() => isLoading = false);
            }
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.hintTextColor,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child:
              imageFile != null
                ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(imageFile!))
                : Icon(
                Icons.image_outlined,
                size: 180,
                color: AppColors.hintTextColor,
              ),
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  imageFile = null;
                  widget.onFileChanged(null);
                });
              },
              icon: imageFile != null
                ? Icon(Icons.cancel_rounded, color: Colors.red, )
                : SizedBox()
            )
          ],
        ),
      ),
    );
  }
}