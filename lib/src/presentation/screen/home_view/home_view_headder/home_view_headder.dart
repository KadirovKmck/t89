import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeViewHeadder extends StatelessWidget {
  const HomeViewHeadder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/home.svg',
        ),
        SizedBox(
          width: 1.5.w,
        ),
        Text(
          'MAIN',
          style: TextStyle(
            color: const Color(0xFFE0966D),
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
