import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/core/navigator/navbar_view.dart';
import 'package:t89/src/presentation/widgets/custom_buttom.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  double currentPage = 0;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      _controller.animateToPage(
        currentPage.toInt() + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const NavbarView()));
    }
  }

  Widget buildIndicator(int index) {
    Color determineColor(int index) {
      double activeThreshold = index - 0.5;
      return currentPage > activeThreshold
          ? const Color(0xFFE0966D)
          : Colors.grey;
    }

    return Flexible(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 80.w,
        height: 1.h,
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        decoration: BoxDecoration(
          color: determineColor(index),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.25.dp, horizontal: 0.25.dp),
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index.toDouble();
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: OnbordingHelpers.blackText[index],
                            style: TextStyle(
                              color: const Color(0xFF262A46),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: OnbordingHelpers.ornageText[index],
                            style: TextStyle(
                              color: const Color(0xFFE0966D),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (idx) => buildIndicator(idx)),
                    ),
                    Text(
                      OnbordingHelpers.subtitles[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF262A46),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Image.asset(OnbordingHelpers.images[index], height: 55.h),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 5.h,
              left: 10.w,
              right: 10.w,
              child: CustomButton(
                width: 80.w,
                height: 8.h,
                colors: const Color(0xFF262A46),
                text: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: nextPage,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnbordingHelpers {
  static final List<String> blackText = [
    'Welcome to \n',
    'Watch ',
    'Collect ',
  ];
  static final List<String> ornageText = [
    'APP NAME',
    'Statistics',
    'Achievements',
  ];
  static final List<String> subtitles = [
    'App Name is your virtual store simulator. Create your company and develop it!',
    'Track your product data in real time, sort or view data on all products',
    'Collect achievements for completed tasks'
  ];
  static final List<String> images = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];
}
