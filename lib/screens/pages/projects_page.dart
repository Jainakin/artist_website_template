import 'package:andrea_stee/components/hover_card.dart';
import 'package:flutter/material.dart';
import 'package:andrea_stee/constants.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      color: Colors.white,
      constraints: BoxConstraints(minWidth: size.width, minHeight: size.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          const Text(
            'projects.',
            style: TextStyle(
              fontFamily: 'Georgia',
              fontWeight: FontWeight.normal,
              fontSize: 85,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  HoverCard(imageNo: 1, title: 'Abstract'),
                  SizedBox(height: 40),
                  HoverCard(imageNo: 3, title: 'Portrait'),
                  SizedBox(height: 40),
                  HoverCard(imageNo: 7, title: 'Beige Zebra'),
                ],
              ),
              const SizedBox(width: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  HoverCard(imageNo: 2, title: 'Abstract'),
                  SizedBox(height: 40),
                  HoverCard(imageNo: 4, title: 'Portrait'),
                  SizedBox(height: 40),
                  HoverCard(imageNo: 5, title: 'Variants'),
                  SizedBox(height: 40),
                  HoverCard(imageNo: 6, title: 'Complex'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
