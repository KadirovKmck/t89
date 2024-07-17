import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/models/product_models/product_models.dart';
import 'package:t89/src/models/product_models/product_provider/product_provider.dart';
import 'package:t89/src/presentation/widgets/product_alert.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {




  void _showProductAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.white,
          content: ProductAlert(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(2.w),
          child: SvgPicture.asset('assets/icons/bag.svg', width: 6.w),
        ),
        title: Text(
          'PRODUCTS',
          style: TextStyle(
            color: const Color(0xFFE0966D),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        titleSpacing: 0,
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return ProductItem(
            product: product,
            onEdit: () {
              productProvider.updateProduct(product);
            },
            onDelete: () {
              productProvider.deleteProduct(product);
            },
          );
        },
      ),
      floatingActionButton: SizedBox(
        width: 70.w,
        height: 5.h,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _showProductAlert(context);
                },
                child: Container(
                  height: 50.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF262A46),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/box.svg'),
                      SizedBox(width: 1.w),
                      Text(
                        '+ Add a Product',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp, // Responsive font size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final Function()? onEdit;
  final Function()? onDelete;

  const ProductItem({
    super.key,
    required this.product,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF6F6F6),
      margin: const EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            Container(
              height: 7.h,
              width: 20.w,
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
            SizedBox(width: 1.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: const Color(0xFF262A46),
                      fontSize: 16.sp, // Responsive font size
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Total profit: ',
                          style: TextStyle(
                            color: const Color(0xFFA3A3A3),
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '\$ ${product.price}',
                          style: TextStyle(
                            color: const Color(0xFF73D372),
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'In stock: ',
                          style: TextStyle(
                            color: const Color(0xFFA3A3A3),
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: product.stock,
                          style: TextStyle(
                            color: const Color(0xFF262A46),
                            fontSize: 14.sp, // Responsive font size
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                GestureDetector(
                  onTap: onEdit,
                  child: SvgPicture.asset('assets/icons/writ.svg'),
                ),
                SizedBox(height: 1.h),
                GestureDetector(
                  onTap: onDelete,
                  child: SvgPicture.asset('assets/icons/deleit.svg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
