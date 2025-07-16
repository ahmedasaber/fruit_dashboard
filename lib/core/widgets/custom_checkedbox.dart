import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';

class CustomCheckedBox extends StatelessWidget {
  const CustomCheckedBox({super.key, required this.isChecked, required this.onChanged});

  final bool isChecked;
  final ValueChanged<bool> onChanged;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        height: 24,
        width: 24,
        padding: EdgeInsets.all(2),
        duration: Duration(milliseconds: 200),
        decoration: ShapeDecoration(
          color: isChecked? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 1.5,
              color: isChecked? Colors.transparent : Color(0XFFDDDFDF),
            )
          )
        ),
        child: isChecked? SvgPicture.asset('assets/images/Check.svg') : SizedBox.shrink(),
      ),
    );
  }
}
