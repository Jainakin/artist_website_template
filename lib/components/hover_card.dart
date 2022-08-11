import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:andrea_stee/screens/display_screen.dart';
import 'package:andrea_stee/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:andrea_stee/responsive.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({required this.imageNo, required this.title});
  final double imageNo;
  final String title;

  @override
  _HoverCardState createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late Animation padding;
  late Animation<double> _fadeInFadeOut;
  String imageURL = '';

  @override
  void initState() {
    super.initState();
    setImageURL();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 1.05).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
        reverseCurve: Curves.easeInOutSine));
    padding = Tween(begin: 0.0, end: -10.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
        reverseCurve: Curves.easeInOutSine));
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOutSine,
            reverseCurve: Curves.easeInOutSine));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _controller.forward();
        });
      },
      onExit: (value) {
        setState(() {
          _controller.reverse();
        });
      },
      child: GestureDetector(
        onTap: () {
          Provider.of<ScrollProvider>(context, listen: false).imageIndex =
              widget.imageNo;
          print(Provider.of<ScrollProvider>(context, listen: false).imageIndex);
          Navigator.push(
            context,
            PageTransition(
              child: DisplayScreen(),
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 400),
            ),
          );
        },
        child: ClipRect(
          child: Stack(
            children: [
              Container(
                constraints:  BoxConstraints(maxWidth: (isTab(context) || isMobile(context)) ? size.width : isDesktop(context) ? 400 : 600),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  clipBehavior: Clip.hardEdge,
                  transform: Matrix4(
                      _animation.value,
                      0,
                      0,
                      0,
                      0,
                      _animation.value,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                      padding.value,
                      padding.value,
                      0,
                      1),
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(
                  child: Center(
                    child: FadeTransition(
                      opacity: _fadeInFadeOut,
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        constraints: BoxConstraints(
                          maxWidth: ((isTab(context) || isMobile(context)) ? size.width : isDesktop(context) ? 400 : 600),
                        ),
                        child: Center(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void setImageURL() {
    imageURL = imgUrlList[widget.imageNo.toInt()-1];
  }
}
