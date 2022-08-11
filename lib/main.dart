// @dart=2.9
import 'package:andrea_stee/models/scroll_provider.dart';
import 'package:andrea_stee/screens/home_screen.dart';
import 'package:andrea_stee/screens/display_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:andrea_stee/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(WebApp());
}

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScrollProvider(),
      child: MaterialApp(
        title: 'Andrea Stee',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.black,
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          DisplayScreen.id: (context) => DisplayScreen(),
        },
        home: HomeScreen(),
      ),
    );
  }
}
