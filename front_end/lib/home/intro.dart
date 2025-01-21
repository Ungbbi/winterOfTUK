import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/intro_image.png', // 로컬 이미지 경로
                fit: BoxFit.cover, // 화면에 꽉 차도록 설정
                width: double.infinity, // 가로로 꽉 채움
              ),
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0), // 둥근 버튼 모양
              ),
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
            ),
            child: Text('시작하기',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
