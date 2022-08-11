import 'package:andrea_stee/components/nav_icon.dart';
import 'package:andrea_stee/components/nav_text.dart';
import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vector_icons/src/entypo.dart';
import 'package:andrea_stee/constants.dart';
import 'package:andrea_stee/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ScrollProvider>(
      builder: (context, scrollData, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          constraints:
              BoxConstraints(minWidth: size.width, minHeight: size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.black,
                child: Text(
                  'AS',
                  style: TextStyle(
                    // fontFamily: 'Georgia',
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavText(
                      title: 'projects.',
                      alignment: 0,
                      duration: 1000,
                      index: 0,
                      fontSize: 40),
                  SizedBox(width: 180),
                  NavText(
                      title: 'about.',
                      alignment: 0,
                      duration: 1500,
                      index: 1,
                      fontSize: 40),
                  SizedBox(width: 180),
                  NavText(
                      title: 'contact.',
                      alignment: 1,
                      duration: 2000,
                      index: 2,
                      fontSize: 40),
                ],
              ),
              const SizedBox(height: 80),
              const Text(
                'Digital - Sketch Artist',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              NavIcon(
                iconData: Entypo.chevron_small_down,
                tapEvent: () => scrollData.scroolToItem(
                    alignment: 0, duration: 1000, index: 0),
                iconSize: 50,
              ),
            ],
          ),
        );
      },
    );
  }
}
