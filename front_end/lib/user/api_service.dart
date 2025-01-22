import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // 회원가입 API
  Future<bool> register(String username, String email, String password) async {
    final url = Uri.parse('http://localhost:3000/auth/signup');  // Android 에뮬레이터에서 로컬 서버에 접근

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return true;  // 회원가입 성공
    } else {
      print("회원가입 실패: ${response.statusCode}, ${response.body}");
      return false;  // 회원가입 실패
    }
  }

 
  // 로그인 API
  Future<String?> login(String email, String password) async {
    final url = Uri.parse('http://localhost:3000/auth/login');  // 실제 백엔드 URL로 수정

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['token'];  // 서버에서 받은 JWT 토큰
    } else {
      return null;  // 로그인 실패
    }
  }
}

  // 로그아웃 API
  Future<bool> logout(String token) async {
    final url = Uri.parse('http://localhost:3000/auth/logout');  // Android 에뮬레이터에서 로컬 서버에 접근

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",  // JWT 토큰을 Authorization 헤더에 포함
      },
    );

    if (response.statusCode == 201) {
      return true;  // 로그아웃 성공
    } else {
      print("로그아웃 실패: ${response.statusCode}, ${response.body}");
      return false;  // 로그아웃 실패
    }
  }

