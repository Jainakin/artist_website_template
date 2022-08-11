import 'package:andrea_stee/components/nav_icon.dart';
import 'package:andrea_stee/components/nav_text.dart';
import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vector_icons/src/entypo.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ScrollProvider>(
      builder: (context, scrollData, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(
              minWidth: size.width, minHeight: size.height * 4 / 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black,
                        child: Text(
                          'AS',
                          style: TextStyle(
                            // fontFamily: 'Georgia',
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 22.5),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {Scaffold.of(context).openEndDrawer();},
                              child: const Icon(
                                LineIcons.bars,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
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
