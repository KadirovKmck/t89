import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/presentation/widgets/custom_buttom.dart';

class SaleAlertWidget extends StatelessWidget {
  const SaleAlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sale_container(),
          sale_container(),
          sale_container(),
          SizedBox(
            height: 2.h,
          ),
          const Text(
            'Amount:',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xFFA3A3A3),
              fontSize: 12,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 1.h),
          CupertinoTextField(
            keyboardType: TextInputType.number,
            placeholder: 'Amount:',
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 2.h,
          ),
          CustomButton(
            colors: const Color(0xFF262A46),
            width: double.infinity,
            height: 4.4.h,
            onPressed: () {
              Navigator.pop(context);
            },
            text: Text(
              'Sale',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container sale_container() {
    return Container(
      width: double.infinity,
      height: 7.h,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 10.w,
                height: 10.h,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.52),
                  ),
                ),
                child: Image.asset(
                  'assets/images/mous.png',
                  width: 5.w,
                  height: 9.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Logitech G Pro",
                style: TextStyle(
                  color: const Color(0xFF262A46),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SvgPicture.asset('assets/icons/container.svg')
        ],
      ),
    );
  }
}
