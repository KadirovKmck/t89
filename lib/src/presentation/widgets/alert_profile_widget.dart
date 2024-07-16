import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/models/user_models/user.dart';
import 'package:t89/src/presentation/widgets/custom_buttom.dart';

class ProfilAlert extends StatefulWidget {
  const ProfilAlert({
    super.key,
  });

  @override
  State<ProfilAlert> createState() => _ProfilAlertState();
}

class _ProfilAlertState extends State<ProfilAlert> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final userModel = Provider.of<UserModel>(context, listen: false);
    _controller = TextEditingController(text: userModel.name);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Company Name',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color(0xFFA3A3A3),
            fontSize: 12.sp,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        TextField(
          controller: _controller,
          onChanged: (value) {
            userModel.setName(value);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Company Name',
            hintStyle: const TextStyle(color: Colors.black),
            contentPadding:
                EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
          ),
        ),
        SizedBox(
          height: 1.7.h,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              userModel.pickImage();
            },
            child: Container(
              height: 15.h,
              width: 60.w,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.72),
                ),
              ),
              child: userModel.photoProfile == null
                  ? SvgPicture.asset('assets/icons/addfoto.svg')
                  : Image.file(
                      userModel.photoProfile!,
                      width: double.infinity,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 1.7.h,
        ),
        CustomButton(
          colors: const Color(0xFF262A46),
          width: 315.w,
          height: 4.4.h,
          onPressed: () {
            Navigator.pop(context);
          },
          text: Text(
            'Save',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}