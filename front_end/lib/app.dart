import 'package:flutter/material.dart';
import 'package:rflix/aboutMovie.dart';
import 'package:rflix/home.dart';
import 'package:rflix/myPage.dart';
import 'package:rflix/myReview.dart';
import 'package:rflix/search.dart';
import 'package:rflix/user/login.dart';
import 'package:rflix/user/register.dart';
import 'package:rflix/writeReview.dart';
import 'intro.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Intro(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/search': (context) => Search(),
        '/myPage': (context) => MyPage(),
        '/myReview': (context) => MyReview(),
        '/aboutMovie': (context) => AboutMovie(),
        '/writeReview': (context) => WriteReview(),
      },
    );
  }
}
