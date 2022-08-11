import 'package:andrea_stee/components/hover_card.dart';
import 'package:andrea_stee/responsive.dart';
import 'package:flutter/material.dart';
import 'package:andrea_stee/constants.dart';

class ProjectsPageMobile extends StatelessWidget {
  const ProjectsPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile(context) ? horizontalPadding/2 : horizontalPadding),
      color: Colors.white,
      constraints: BoxConstraints(minWidth: size.width, minHeight: size.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'projects.',
            style: TextStyle(
              fontFamily: 'Georgia',
              fontWeight: FontWeight.normal,
              fontSize: 60,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HoverCard(imageNo: 1, title: 'Abstract'),
              SizedBox(height: isMobile(context) ? horizontalPadding/2 : horizontalPadding),
              HoverCard(imageNo: 3, title: 'Portrait'),
              SizedBox(height: isMobile(context) ? horizontalPadding/2 : horizontalPadding),
              HoverCard(imageNo: 7, title: 'Beige Zebra'),
              SizedBox(height: isMobile(context) ? horizontalPadding/2 : horizontalPadding),
              HoverCard(imageNo: 2, title: 'Abstract'),
              SizedBox(height: isMobile(context) ? horizontalPadding/2 : horizontalPadding),
              HoverCard(imageNo: 4, title: 'Portrait'),
              SizedBox(height: isMobile(context) ? horizontalPadding/2 : horizontalPadding),
              HoverCard(imageNo: 5, title: 'Variants'),
              SizedBox(height: isMobile(context) ? horizontalPadding/2 : horizontalPadding),
              HoverCard(imageNo: 6, title: 'Complex'),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
