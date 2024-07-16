import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
import 'package:t89/src/presentation/screen/onbording_view/onbording_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      title: Column(
        children: [
          Text(
            'Loading...',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFE0966D),
              fontSize: 0.35.dp,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 2),
      done: Done(
        const OnbordingView(),
      ),
    );
  }
}
