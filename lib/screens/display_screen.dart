import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:andrea_stee/responsive.dart';
import 'package:andrea_stee/screens/pages/display_page.dart';
import 'package:andrea_stee/screens/pages/display_page_mobile.dart';
import 'package:andrea_stee/screens/pages/display_page_tab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({Key? key}) : super(key: key);
  static String id = 'art';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isMobile(context)
          ? DisplayPageMobile(
              imageNo: Provider.of<ScrollProvider>(context, listen: false)
                  .imageIndex)
          : isTab(context)
              ? DisplayPageTab(
                  imageNo: Provider.of<ScrollProvider>(context, listen: false)
                      .imageIndex)
              : DisplayPage(
                  imageNo: Provider.of<ScrollProvider>(context, listen: false)
                      .imageIndex),
    );
  }
}
