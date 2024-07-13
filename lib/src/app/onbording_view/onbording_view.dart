import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/app/home_view/home_view.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  int currentPage = 0;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < 2) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  const HomeView())); // Update this to your next screen
    }
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 20,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.orange : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.5.dp),
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: OnbordingHelpers.blackText[index],
                              style: TextStyle(fontSize: 28.sp)),
                          TextSpan(
                              text: OnbordingHelpers.ornageText[index],
                              style: TextStyle(
                                  fontSize: 28.sp, color: Colors.orange)),
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
                      style: TextStyle(fontSize: 16.sp),
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
                text: "Continue",
                onPressed: nextPage,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.colors,
      this.text,
      required this.width,
      required this.height,
      required this.onPressed});
  final Color colors;
  final String? text;
  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
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
          child: Text(
            text ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
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
