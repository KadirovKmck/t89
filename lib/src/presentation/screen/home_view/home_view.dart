import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t89/src/presentation/screen/home_view/home_view_headder/home_view_headder.dart';
import 'package:t89/src/presentation/screen/home_view/home_view_product/home_view_product.dart';
import 'package:t89/src/presentation/widgets/alert_profile_widget.dart';
import 'package:t89/src/presentation/widgets/custom_flout_action_widget.dart';
import 'package:t89/src/presentation/widgets/product_alert.dart';
import 'package:t89/src/presentation/widgets/sale_alert_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkFirstTime();
    });
  }

  Future<void> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    if (isFirstTime) {
      _showAlertDialog(context).then((_) {
        _showProductAlert(context);
      });
      await prefs.setBool('isFirstTime', false);
    }
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog(
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

  void _showSaleAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          backgroundColor: Colors.white,
          content: SaleAlertWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 15.sp),
        child: Column(
          children: [
            const HomeViewHeadder(),
            SizedBox(
              height: 1.h,
            ),
            const Expanded(
              child: HomeViewProduct(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: double.infinity,
        height: 5.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFloatingActionButton(
              colors: const Color(0xFF262A46),
              height: 5.h,
              width: 41.w,
              iconsSvg: 'assets/icons/home.svg',
              left: 30,
              right: 4,
              onPressed: () {
                _showProductAlert(context);
              },
              text: Text(
                'Add a Product',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 0.5.w,
            ),
            CustomFloatingActionButton(
              colors: const Color(0xFF262A46),
              height: 5.h,
              width: 41.w,
              iconsSvg: 'assets/icons/shopping-cart.svg',
              left: 4,
              right: 30,
              onPressed: () {
                _showSaleAlert(context);
              },
              text: Text(
                'Add a Sale',
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
    );
  }
}
