import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/core/utils/movies_colors.dart';

class ButtonRestart extends StatelessWidget {
  final void Function()? onPressed;

  const ButtonRestart({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: MoviesColors.yellowColor,
        foregroundColor: MoviesColors.blackColor,
      ),
      onPressed: onPressed,
      icon: Icon(
        Icons.restart_alt,
        size: 32.sp,
      ),
      label: Text(""),
    );
  }
}
