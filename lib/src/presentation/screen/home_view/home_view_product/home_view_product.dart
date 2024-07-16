import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/models/product_models/product_provider/product_provider.dart';

class HomeViewProduct extends StatelessWidget {
  const HomeViewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return ListView.builder(
      itemCount: productProvider.products.length,
      itemBuilder: (context, index) {
        final product = productProvider.products[index];
        return Column(
          children: [
            SizedBox(
              height: 43.h,
              width: double.infinity,
              child: Card(
                color: const Color(0xFFF6F6F6),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most Profitable Product',
                            style: TextStyle(
                              color: const Color(0xFFA3A3A3),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.sp,
                            color: const Color(0xFFA3A3A3),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Text(
                        product.name,
                        style: TextStyle(
                          color: const Color(0xFF262A46),
                          fontSize: 16.sp,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Total profit:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFA3A3A3),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 1.w),
                          Text(
                            '\$ ${product.price}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF73D372),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Sold:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFA3A3A3),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '3324',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF262A46),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.6.h,
                      ),
                      Center(
                        child: Container(
                          width: 315.w,
                          height: 22.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.72),
                            ),
                          ),
                          child: product.productPhoto.isNotEmpty
                              ? Image.file(
                                  File(product.productPhoto),
                                  width: double.infinity,
                                  height: 20.h,
                                  fit: BoxFit.cover,
                                )
                              : SvgPicture.asset('assets/icons/no_image.svg'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            // <<<<<<<<==============================================================>>>>>>>>>
            SizedBox(
              height: 20.h,
              width: double.infinity,
              child: Card(
                color: const Color(0xFFF6F6F6),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Earnings',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFA3A3A3),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 3.7.h,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0x3385F883),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF73D372)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(
                                color: const Color(0xFF73D372),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              product.price,
                              style: TextStyle(
                                color: const Color(0xFF73D372),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Best sale:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFA3A3A3),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                '\$ 312',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF73D372),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 1.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Products in stock:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFA3A3A3),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                product.stock,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF262A46),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 1.w),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Products sold:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFA3A3A3),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                '513',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF262A46),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
