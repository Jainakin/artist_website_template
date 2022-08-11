import 'package:flutter/material.dart';
import 'package:andrea_stee/constants.dart';
import 'package:andrea_stee/responsive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding / 2),
      color: Colors.white,
      constraints: BoxConstraints(minWidth: size.width),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: isMobile(context) ? 50 : 80),
          Text(
            'about.',
            style: TextStyle(
              fontFamily: 'Georgia',
              fontWeight: FontWeight.normal,
              fontSize: isMobile(context) ? 60 : 85,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isMobile(context) ? 30 : 50),
          Container(
            width: isTab(context)
                ? size.width * (3 / 4)
                : isMobile(context)
                    ? size.width
                    : size.width * (2 / 4),
            constraints: const BoxConstraints(
              maxWidth: 800,
            ),
            child: Text(
              "I'm a paragraph. Click here to add your own text and edit me. It’s easy. Just click “Edit Text” or double click me to add your own content and make changes to the font. I’m a great place for you to tell a story.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Futura',
                fontWeight: FontWeight.w300,
                fontSize: isMobile(context) ? 20 : 18,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: isMobile(context) ? 60 : 100),
        ],
      ),
    );
  }
}
