// lib/navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavigationBarWidget extends StatelessWidget {
  final Function(int) onTap;

  NavigationBarWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.black87,
      backgroundColor: Colors.transparent,
      height: 50,
      animationDuration: Duration(milliseconds: 200),
      items: [
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.favorite_border, size: 30, color: Colors.white),
        Icon(Icons.shopping_cart_checkout, size: 30, color: Colors.white),
        Icon(Icons.account_circle_rounded, size: 30, color: Colors.white),
      ],
      onTap: onTap,
    );
  }
}
