import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/models/product_models/product_provider/product_provider.dart';
import 'package:t89/src/models/user_models/user.dart';
import 'package:t89/src/presentation/screen/splash_view/splash_view.dart';
import 'package:t89/src/presentation/widgets/%20cantainer_add_pr_widget.dart';
import 'package:t89/src/presentation/widgets/alert_profile_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final providerP = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.75),
        leading: const Icon(
          Icons.settings,
          color: Color(0xFFE0966D),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 50.sp),
          child: Text(
            'SETTINGS',
            style: TextStyle(
              color: const Color(0xFFE0966D),
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                showAlertUpdateDialog(context);
              },
              child: Row(
                children: [
                  Container(
                    width: 20.w,
                    height: 7.h,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: userModel.photoProfile != null
                            ? FileImage(userModel.photoProfile!)
                            : const NetworkImage(
                                    "https://via.placeholder.com/75x75")
                                as ImageProvider,
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  Expanded(
                    child: Container(
                      height: 4.7.h,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const ShapeDecoration(
                        color: Color(0xFFF6F6F6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              userModel.name,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.edit,
                            color: Color(0xFFE0966D),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            InkWell(
              onTap: () {
                setState(() {
                  _switchValue = !_switchValue;
                });
              },
              child: buildSettingOption(
                context,
                title: 'Notifications',
                trailing: Switch(
                  activeTrackColor: Colors.green,
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                iconPath: 'assets/icons/notification.svg',
              ),
            ),
            SizedBox(height: 1.5.h),
            buildSettingOption(
              context,
              title: 'Rate Us',
              trailing: const Icon(Icons.chevron_right),
              iconPath: 'assets/icons/like.svg',
            ),
            SizedBox(height: 1.5.h),
            GestureDetector(
              onTap: () {
                _showFeedbackDialog(context);
              },
              child: buildSettingOption(
                context,
                title: 'Feedback',
                trailing: const Icon(Icons.chevron_right),
                iconPath: 'assets/icons/like.svg',
              ),
            ),
            SizedBox(height: 1.5.h),
            GestureDetector(
              onTap: () {
                _showDeleteProfileDialog(context, providerP);
              },
              child: buildSettingOption(
                context,
                title: 'Delete Profile',
                titleColor: const Color(0xFFF64040),
                backgroundColor: const Color(0xFFFFE6E6),
                trailing: const Icon(Icons.chevron_right),
                iconPath: 'assets/icons/del.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingOption(BuildContext context,
      {required String title,
      Color titleColor = const Color(0xFF262A46),
      Color backgroundColor = const Color(0xFFF6F6F6),
      Widget? trailing,
      required String iconPath}) {
    return Container(
      height: 6.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 13.w,
            height: 13.w,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          trailing ?? Container(),
        ],
      ),
    );
  }

  void showAlertUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.white,
          actions: [
            ProfilAlert(),
          ],
        );
      },
    );
  }

  void _showFeedbackDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Share your feedback',
            style: TextStyle(
              color: const Color(0xFF535778),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do you enjoy using APP NAME? What can we do to improve your experience?',
                style: TextStyle(
                  color: const Color(0xFF9B9B9B),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 315.w,
                height: 15.h,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF6F6F6),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.05),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Describe your experience or suggestions',
                    hintStyle: TextStyle(
                      color: const Color(0xFF535778).withOpacity(0.5),
                      fontSize: 14.sp,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    color: const Color(0xFF535778),
                    fontSize: 14.sp,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: null,
                ),
              )
            ],
          ),
          actions: const [
            CantainerAddPr(
              text1: 'Cancel',
              text2: 'Save',
              colors: Color(0xFF262A46),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteProfileDialog(
    BuildContext context,
    ProductProvider providerP,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Are you sure want to delete profile?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF535778),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          content: Opacity(
            opacity: 0.50,
            child: Text(
              'This will completely and irrevocably delete your profile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF535778),
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          actions: [
            CantainerAddPr(
              onTap: () {
                providerP.clearProdct();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
              text1: 'Cancel',
              text2: 'Delete',
              colors: Colors.red,
            ),
          ],
        );
      },
    );
  }
}
