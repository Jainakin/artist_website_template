import 'package:andrea_stee/components/side_menu.dart';
import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:andrea_stee/responsive.dart';
import 'package:andrea_stee/screens/pages/about_page.dart';
import 'package:andrea_stee/screens/pages/contact_page.dart';
import 'package:andrea_stee/screens/pages/home_page.dart';
import 'package:andrea_stee/screens/pages/home_page_mobile.dart';
import 'package:andrea_stee/screens/pages/home_page_tab.dart';
import 'package:andrea_stee/screens/pages/parallax_page.dart';
import 'package:andrea_stee/screens/pages/projects_page.dart';
import 'package:andrea_stee/screens/pages/projects_page_mobile.dart';
import 'package:flutter/material.dart';
import 'package:parallax_animation/parallax_animation.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ScrollProvider>(
      builder: (context, scrollData, child) {
        return Scaffold(
          endDrawerEnableOpenDragGesture: false,
          endDrawer: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height,
              minWidth: size.width * (4/5),
              maxWidth: size.width * (4/5),
            ),
            child: SideMenu(),
          ),
          body: Container(
            constraints: BoxConstraints(
              minWidth: size.width,
              minHeight: size.height,
            ),
            child: Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    minWidth: size.width,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1600522907071-85ea3bd6f625?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2560&q=80"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ParallaxArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(child: isMobile(context) ? HomePageMobile() : isTab(context) ? HomePageTab() : HomePage()),
                        Container(key: scrollData.projectsKey, child: (isTab(context) || isMobile(context)) ? ProjectsPageMobile() : ProjectsPage()),
                        ParallaxPage(position: false),
                        Container(key: scrollData.aboutKey, child: AboutPage()),
                        ParallaxPage(position: true),
                        Container(key: scrollData.contactKey, child: ContactPage()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
