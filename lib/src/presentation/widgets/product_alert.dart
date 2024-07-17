import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:t89/src/models/product_models/product_models.dart';
import 'package:t89/src/models/product_models/product_provider/product_provider.dart';
import 'dart:io';
import 'custom_buttom.dart';

class ProductAlert extends StatefulWidget {
  const ProductAlert({super.key});

  @override
  State<ProductAlert> createState() => _ProductAlertState();
}

class _ProductAlertState extends State<ProductAlert> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productStockController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productPriceController.dispose();
    _productStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(1.sp),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.h),
              Text(
                'Product Name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFFA3A3A3),
                  fontSize: 12.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.h),
              CupertinoTextField(
                controller: _productNameController,
                placeholder: 'Product Name',
                placeholderStyle: const TextStyle(color: Colors.black),
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              SizedBox(height: 2.h),
              Text(
                'Product Price',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFFA3A3A3),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.h),
              CupertinoTextField(
                controller: _productPriceController,
                placeholder: 'Product Price',
                placeholderStyle: const TextStyle(color: Color(0xFF73D372)),
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                keyboardType: TextInputType.number,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                style: const TextStyle(color: Color(0xFF73D372)),
              ),
              SizedBox(height: 2.h),
              Text(
                'Product in stock',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: const Color(0xFFA3A3A3),
                  fontSize: 12.sp,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.h),
              CupertinoTextField(
                controller: _productStockController,
                placeholder: 'Product in stock',
                placeholderStyle: const TextStyle(color: Colors.black),
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                keyboardType: TextInputType.number,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              SizedBox(height: 2.h),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 15.h,
                  width: 60.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.72),
                    ),
                  ),
                  child: _selectedImage != null
                      ? Image.file(
                          _selectedImage!,
                          width: 100.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                        )
                      : SvgPicture.asset('assets/icons/addfoto.svg'),
                ),
              ),
              SizedBox(height: 2.h),
              CustomButton(
                colors: const Color(0xFF262A46),
                width: double.infinity,
                height: 4.4.h,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProduct = ProductModel(
                      name: _productNameController.text,
                      price: _productPriceController.text,
                      stock: _productStockController.text,
                      productPhoto: _selectedImage?.path ?? '',
                    );

                    Provider.of<ProductProvider>(context, listen: false)
                        .addProduct(newProduct);

                    Navigator.pop(context);
                  }
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
          ),
        ),
      ),
    );
  }
}
