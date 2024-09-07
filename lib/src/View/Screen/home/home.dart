
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:star/src/View/Screen/home/widget/bodyhomescreen.dart';
import 'package:star/src/View/Screen/home/widget/bottomnavigationbar.dart';
import 'package:star/src/View/Screen/setting/settings.dart';
import '../cart/cart.dart';
import '../wishlist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),  // الصفحة الرئيسية
    Wishlist (),        // صفحة المنتجات
    Cart(),            // صفحة السلة
    Settings(),         // صفحة الحساب
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(

            child: _currentIndex == 0
                ? BodyHomeScreen()  // عرض `BodyHomeScreen` في الصفحة الرئيسية
                : _pages[_currentIndex],
            // عرض الصفحات الأخرى بناءً على `index`
          ),



              ],

      ),
      bottomNavigationBar: NavigationBarWidget(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
