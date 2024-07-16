
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.colors,
    required this.text,
    required this.width,
    required this.height,
    required this.left,
    required this.right,
    required this.iconsSvg,
    this.onPressed,
  });

  final Color colors;
  final Widget text;
  final double width;
  final double height;
  final double left;
  final double right;
  final String iconsSvg;
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
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(left), right: Radius.circular(right)),
          ),
          side: BorderSide.none,
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconsSvg),
            SizedBox(
              width: 1.2.w,
            ),
            text,
          ],
        ),
      ),
    );
  }
}
