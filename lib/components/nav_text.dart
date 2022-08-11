import 'dart:ui';

import 'package:andrea_stee/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:andrea_stee/models/scroll_provider.dart';

class NavText extends StatefulWidget {
  NavText(
      {required this.title,
      required this.fontSize,
      required this.alignment,
      required this.duration,
      required this.index});
  final String title;
  final double fontSize;
  final double alignment;
  final int duration;
  final int index;

  @override
  State<NavText> createState() => _NavTextState();
}

class _NavTextState extends State<NavText> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollProvider>(
      builder: (context, scrollData, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (e) {
            setState(() {
              isHovering = !isHovering;
            });
          },
          onExit: (e) {
            setState(() {
              isHovering = !isHovering;
            });
          },
          child: GestureDetector(
            onTap: () {
              if(homePageBreakPoint(context)) {
                Scaffold.of(context).closeEndDrawer();
              }
              Listener(
                onPointerDown: (event) {
                  if (event.kind == PointerDeviceKind.touch || event.kind == PointerDeviceKind.stylus) {
                    setState(() {
                      isHovering = !isHovering;
                      Future.delayed(Duration(milliseconds: 300), () {
                        setState(() {
                          isHovering = !isHovering;
                        });
                      });
                    });
                  };
                },
              );
              scrollData.scroolToItem(alignment: widget.alignment, duration: widget.duration, index: widget.index);
            },
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontFamily: 'Georgia',
                fontWeight: FontWeight.w400,
                fontSize: widget.fontSize,
                color: isHovering ? Color(0xFFd01523) : Colors.black,
              ),
              child: Text(widget.title),
            ),
          ),
        );
      },
    );
  }
}
