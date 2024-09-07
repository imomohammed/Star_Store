// import 'package:flutter/material.dart';
//
// class AnimationController extends StatefulWidget {
//   const AnimationController({super.key});
//
//   @override
//   State<AnimationController> createState() => _AnimationControllerState();
//   AnimationController _controller;
//   Animation<double> _animation;
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 1),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//   }
// }
//
// class _AnimationControllerState extends State<AnimationController> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
