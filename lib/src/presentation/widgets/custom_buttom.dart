import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.colors,
      this.text,
      required this.width,
      required this.height,
      required this.onPressed});
  final Color colors;
  final Widget? text;
  final double width;
  final double height;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: colors,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: BorderSide.none,
        ),
        child: text,
      ),
    );
  }
}
