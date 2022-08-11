import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/src/entypo.dart';
import 'package:andrea_stee/constants.dart';

class DisplayPageMobile extends StatefulWidget {
  const DisplayPageMobile({required this.imageNo});
  final double imageNo;

  @override
  State<DisplayPageMobile> createState() => _DisplayPageMobileState();
}

class _DisplayPageMobileState extends State<DisplayPageMobile> {
  bool _first = false;
  double currentImageNo = 1;
  double firstImageNo = 1;
  double secondImageNo = 1;
  bool leftBlock = false;
  bool rightBlock = false;

  @override
  void initState() {
    currentImageNo = widget.imageNo;
    secondImageNo = widget.imageNo;
    setIconState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        width: size.width,
        // height: size.height,
        constraints: BoxConstraints(minHeight: size.height),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Align(
            //   alignment: Alignment.topRight,
            //   child: MouseRegion(
            //     cursor: SystemMouseCursors.click,
            //     child: GestureDetector(
            //       onTap: () {
            //         if (ModalRoute.of(context)!.canPop) {
            //           Navigator.pop(context);
            //         } else {
            //           Navigator.pop(context);
            //         }
            //       },
            //       child: const Icon(
            //         LineIcons.times,
            //         size: 35,
            //         color: Color(0xFF545454),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 40),
            Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: leftBlock
                        ? SystemMouseCursors.basic
                        : SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (_first) {
                              if (currentImageNo > 2) {
                                currentImageNo -= 1;
                                secondImageNo = currentImageNo;
                                _first = !_first;
                                rightBlock = false;
                              } else if (currentImageNo == 2) {
                                currentImageNo -= 1;
                                secondImageNo = currentImageNo;
                                _first = !_first;
                                leftBlock = true;
                                rightBlock = false;
                              } else {
                                leftBlock = true;
                                rightBlock = false;
                              }
                            } else {
                              if (currentImageNo > 2) {
                                currentImageNo -= 1;
                                firstImageNo = currentImageNo;
                                _first = !_first;
                                rightBlock = false;
                              } else if (currentImageNo == 2) {
                                currentImageNo -= 1;
                                firstImageNo = currentImageNo;
                                _first = !_first;
                                leftBlock = true;
                                rightBlock = false;
                              } else {
                                leftBlock = true;
                                rightBlock = false;
                              }
                            }
                            print(_first);
                          },
                        );
                      },
                      child: Icon(
                        Entypo.chevron_thin_left,
                        size: 30,
                        color:
                            leftBlock ? Colors.transparent : Color(0xFF545454),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  AnimatedCrossFade(
                    sizeCurve: Curves.ease,
                    crossFadeState: _first
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 500),
                    firstChild: Container(
                      // height: 500,
                      constraints: BoxConstraints(
                        maxWidth: size.width - 100,
                      ),
                      child: Image.network(
                        imgUrlList[firstImageNo.toInt() - 1],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    secondChild: Container(
                      // height: 500,
                      constraints: BoxConstraints(
                        maxWidth: size.width - 100,
                      ),
                      child: Image.network(
                        imgUrlList[secondImageNo.toInt() - 1],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  MouseRegion(
                    cursor: rightBlock
                        ? SystemMouseCursors.basic
                        : SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (_first) {
                              if (currentImageNo < 6) {
                                currentImageNo += 1;
                                secondImageNo = currentImageNo;
                                _first = !_first;
                                leftBlock = false;
                              } else if (currentImageNo == 6) {
                                currentImageNo += 1;
                                secondImageNo = currentImageNo;
                                _first = !_first;
                                rightBlock = true;
                                leftBlock = false;
                              } else {
                                rightBlock = true;
                                leftBlock = false;
                              }
                            } else {
                              if (currentImageNo < 6) {
                                currentImageNo += 1;
                                firstImageNo = currentImageNo;
                                _first = !_first;
                                leftBlock = false;
                              } else if (currentImageNo == 6) {
                                currentImageNo += 1;
                                firstImageNo = currentImageNo;
                                _first = !_first;
                                leftBlock = false;
                                rightBlock = true;
                              } else {
                                rightBlock = true;
                                leftBlock = false;
                              }
                            }
                            print(_first);
                          },
                        );
                      },
                      child: Icon(
                        Entypo.chevron_thin_right,
                        size: 30,
                        color:
                            rightBlock ? Colors.transparent : Color(0xFF545454),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              constraints: BoxConstraints(
                maxWidth: size.width - 100,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I'm an image title.",
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Describe your image here. Use catchy text to tell people the story behind the photo. Go to “Manage Media” to add your content.",
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setIconState() {
    if (currentImageNo == 1) {
      leftBlock = true;
    }
    if (currentImageNo == 7) {
      rightBlock = true;
    }
  }
}
