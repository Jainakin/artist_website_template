import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  GlobalKey projectsKey = GlobalKey();
  GlobalKey aboutKey = GlobalKey();
  GlobalKey contactKey = GlobalKey();
  double imageIndex = 1;

  Future scroolToItem({required double alignment, required int duration, required int index}) async {
    List<GlobalKey> _myList = [projectsKey, aboutKey, contactKey];
    final context = _myList[index].currentContext!;

    await Scrollable.ensureVisible(
      context,
      duration: Duration(milliseconds: duration),
      curve: Curves.easeInOut,
      alignment: alignment,
    );
    notifyListeners();
  }
}
