import 'package:andrea_stee/responsive.dart';
import 'package:flutter/material.dart';
import 'package:parallax_animation/parallax_animation.dart';

class ParallaxPage extends StatelessWidget {
  const ParallaxPage({required this.position});
  // final double imageNo;
  final bool position;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ParallaxWidget(
      inverted: true,
      alignment: position ? Alignment.bottomRight : Alignment.topLeft,
      fixedHorizontal: true,
      overflowHeightFactor: 1.8,
      background: Image.network(
        'https://images.unsplash.com/photo-1600522907071-85ea3bd6f625?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2560&q=80',
        fit: BoxFit.fitWidth,
      ),
      child: Container(
        color: Colors.black.withOpacity(0.2),
        width: size.width,
        height: isMobile(context) ? (size.height * 1/3) : isTab(context) ? (size.height * 2/4) : isDesktop(context) ? (size.height * 3/4) : (size.height * 2/4),
      ),
    );
  }
}
