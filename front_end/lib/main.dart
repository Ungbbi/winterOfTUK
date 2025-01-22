import 'package:flutter/material.dart';
import 'home/home.dart'; // Updated path for home.dart
import 'movie/aboutMovie.dart'; // Updated path for aboutMovie.dart
import 'mypage/myPage.dart'; // Updated path for myPage.dart
import 'mypage/myReview.dart'; // Updated path for myReview.dart
import 'movie/search.dart'; // Updated path for search.dart
import 'movie/writeReview.dart'; // Updated path for writeReview.dart
import 'user/login.dart'; // Updated path for login.dart
import 'user/register.dart'; // Updated path for register.dart
import 'movie/writeReview.dart'; // Updated path for writeReview.dart
import 'home/intro.dart'; // Updated path for intro.dart


// 전역 리뷰 데이터 정의
List<Map<String, dynamic>> reviews = [];

void main() {
  runApp(const MyApp());
}

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
