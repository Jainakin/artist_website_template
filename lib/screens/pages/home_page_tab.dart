import 'package:andrea_stee/components/nav_icon.dart';
import 'package:andrea_stee/components/nav_text.dart';
import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vector_icons/src/entypo.dart';

class HomePageTab extends StatelessWidget {
  const HomePageTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ScrollProvider>(
      builder: (context, scrollData, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          constraints:
          BoxConstraints(minWidth: size.width, minHeight: size.height * 4/5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const CircleAvatar(
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NavText(
                      title: 'projects.',
                      alignment: 0,
                      duration: 1000,
                      index: 0,
                      fontSize: 30),
                  // SizedBox(width: 50),
                  NavText(
                      title: 'about.',
                      alignment: 0,
                      duration: 1500,
                      index: 1,
                      fontSize: 30),
                  // SizedBox(width: 50),
                  NavText(
                      title: 'contact.',
                      alignment: 1,
                      duration: 2000,
                      index: 2,
                      fontSize: 30),
                ],
              ),
              const SizedBox(height: 60),
              const Text(
                'Digital - Sketch Artist',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
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
