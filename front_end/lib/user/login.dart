import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';  // SharedPreferences import 추가
import 'api_service.dart'; // API 서비스를 위한 import 추가

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final ApiService _apiService = ApiService(); // ApiService 인스턴스 생성

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('로그인', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,  // 이메일 입력 처리
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'email',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,  // 비밀번호 입력 처리
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;

                final token = await _apiService.login(email, password);

                if (token != null) {
                  // 로그인 성공 시
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('jwtToken', token);  // JWT 토큰 저장

                  Navigator.pushReplacementNamed(context, '/home');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('로그인 성공!')),
                  );
                } else {
                  // 로그인 실패 시: 서버에서의 에러 메시지 제공
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('로그인 실패: 이메일 또는 비밀번호를 확인하세요')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text('로그인', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('회원가입', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
