import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('MyPage', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false, // 뒤로가기 버튼 제거
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.grey[800],
              leading: Icon(Icons.list, color: Colors.white),
              title: Text(
                'My Review',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                // 리뷰 화면으로 이동
                Navigator.pushNamed(context, '/myReview');
              },
            ),
            SizedBox(height: 16),
            ListTile(
              tileColor: Colors.grey[800],
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                // 로그아웃 액션 (로그인 화면으로 이동)
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: 1, // MyPage 탭 선택 상태
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            // 현재 화면: MyPage
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/search');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/settings');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'MyPage'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
