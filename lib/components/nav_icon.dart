import 'package:flutter/material.dart';

class NavIcon extends StatefulWidget {
  NavIcon(
      {required this.iconData ,required this.tapEvent, required this.iconSize});
  final IconData iconData;
  final GestureTapCallback tapEvent;
  final double iconSize;

  @override
  State<NavIcon> createState() => _NavIconState();
}

class _NavIconState extends State<NavIcon> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        setState(() {

        });
      },
      onExit: (e) {
        setState(() {

        });
      },
      child: GestureDetector(
        onTap: widget.tapEvent,
        child: Icon(
          widget.iconData,
          size: widget.iconSize,
        )
      ),
    );
  }
}
