import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/models/product_models/product_provider/product_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            'assets/icons/chart.svg',
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 50.sp),
          child: Text(
            'STATISTICS',
            style: TextStyle(
              color: const Color(0xFFE0966D),
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total profit: ',
                      style: TextStyle(
                        color: const Color(0xFFA3A3A3),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: '\$3324.25',
                      style: TextStyle(
                        color: const Color(0xFF73D372),
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 30.h,
                child: BarChart(
                  BarChartData(
                    backgroundColor: const Color(0xFFF6F6F6),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: [
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(
                          toY: 50,
                          color: Colors.orange,
                          width: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        )
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                          toY: 180,
                          color: Colors.orange,
                          width: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        )
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(
                          toY: 20,
                          color: Colors.orange,
                          width: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        )
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(
                          toY: 120,
                          color: Colors.orange,
                          width: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        )
                      ]),
                      BarChartGroupData(x: 5, barRods: [
                        BarChartRodData(
                          toY: 80,
                          color: Colors.orange,
                          width: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        )
                      ]),
                      BarChartGroupData(x: 6, barRods: [
                        BarChartRodData(
                          toY: 65,
                          color: Colors.orange,
                          width: 30,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        )
                      ]),
                      BarChartGroupData(
                        x: 7,
                        barRods: [
                          BarChartRodData(
                            toY: 100,
                            color: Colors.orange,
                            width: 30,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          )
                        ],
                      ),
                    ],
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 1:
                                return const Text('11.16');
                              case 2:
                                return const Text('11.17');
                              case 3:
                                return const Text('11.18');
                              case 4:
                                return const Text('11.19');
                              case 5:
                                return const Text('11.20');
                              case 6:
                                return const Text('11.21');
                              case 7:
                                return const Text('Today');
                              default:
                                return const Text('');
                            }
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 10:
                                return const Text('\$10');
                              case 34:
                                return const Text('\$34');
                              case 64:
                                return const Text('\$64');
                              case 74:
                                return const Text('\$74');
                              case 95:
                                return const Text('\$95');
                              case 452:
                                return const Text('\$452');
                              case 748:
                                return const Text('\$748');
                              case 967:
                                return const Text('\$967');
                              case 1004:
                                return const Text('\$1004');
                              case 124567:
                                return const Text('\$124567');
                              default:
                                return const Text('');
                            }
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFF6F6F6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 25.sp,
                      color: const Color(0xFFA3A3A3),
                    ),
                    Text(
                      'Scroll Up to see All products',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFA3A3A3),
                        fontSize: 15.sp,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
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
                              SvgPicture.asset('assets/icons/check.svg'),
                              SizedBox(
                                width: 2.w,
                              ),
                              Text(
                                'All products',
                                style: TextStyle(
                                  color: const Color(0xFF262A46),
                                  fontSize: 14.sp,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 15.sp,
                            color: const Color(0xFFA3A3A3),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemCount: productProvider.products.length,
                      itemBuilder: (context, index) {
                        final product = productProvider.products[index];
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 7.h,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 15.w,
                                        height: 5.4.h,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11.52),
                                          ),
                                        ),
                                        child: product.productPhoto
                                                .startsWith('assets')
                                            ? Image.asset(
                                                'assets/images/default.png',
                                                width: 15.w,
                                                height: 8.h,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(
                                                File(product.productPhoto),
                                                width: 15.w,
                                                height: 8.h,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        product.name,
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
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                          ],
                        );
                      },
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
