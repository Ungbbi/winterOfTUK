import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // 검색 화면으로 이동 (추가적으로 구현 필요)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 4, // 영화 포스터 수
          itemBuilder: (context, index) {
            final images = [
              'assets/1899.jpg',
              'assets/russian_doll.jpg',
              'assets/barbarians.jpg',
              'assets/ares.jpg',
            ];
            return Image.asset(
              images[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(color: Colors.red), // 선택된 라벨 색상
        unselectedLabelStyle: TextStyle(color: Colors.black), // 선택되지 않은 라벨 색상
        currentIndex: 0, // Home 탭을 선택된 상태로 표시
        onTap: (index) {
          // 탭 이동
          if (index == 0) {
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/myPage');
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
