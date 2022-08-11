import 'package:andrea_stee/components/nav_text.dart';
import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollProvider>(
      builder: (context, scrollSectionData, child) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42.5),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Scaffold.of(context).closeEndDrawer();
                  },
                  child: const Icon(
                    LineIcons.times,
                    size: 35,
                  ),
                ),
              ),
              SizedBox(height: 60),
              NavText(
                  title: 'projects.',
                  alignment: 0,
                  duration: 1000,
                  index: 0,
                  fontSize: 20),
              SizedBox(height: 30),
              NavText(
                  title: 'about.',
                  alignment: 0,
                  duration: 1500,
                  index: 1,
                  fontSize: 20),
              SizedBox(height: 30),
              NavText(
                  title: 'contact.',
                  alignment: 1,
                  duration: 2000,
                  index: 2,
                  fontSize: 20),
            ],
          ),
        );
      },
    );
  }
}
