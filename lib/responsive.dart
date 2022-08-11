import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;
bool isTab(BuildContext context) => MediaQuery.of(context).size.width <= 1000 && MediaQuery.of(context).size.width >= 650;
bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width <= 2560 && MediaQuery.of(context).size.width > 1000;
bool is4K(BuildContext context) => MediaQuery.of(context).size.width > 2560;

bool homePageBreakPoint(BuildContext context) => MediaQuery.of(context).size.width < 860;