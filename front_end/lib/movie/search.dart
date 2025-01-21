import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: '검색',
            hintStyle: TextStyle(color: Colors.white54),
            prefixIcon: Icon(Icons.search, color: Colors.white),
            suffixIcon: Icon(Icons.mic, color: Colors.white),
            filled: true,
            fillColor: Colors.grey[800],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 두 개의 열로 배치
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 6, // 이미지 개수
          itemBuilder: (context, index) {
            final List<Map<String, dynamic>> movies = [
              {'title': 'Movie 1', 'image': 'assets/movie1.jpg', 'rating': 9.0},
              {'title': 'Movie 2', 'image': 'assets/movie2.jpg', 'rating': 8.5},
              {'title': 'Movie 3', 'image': 'assets/movie3.jpg', 'rating': 8.0},
              {'title': 'Movie 4', 'image': 'assets/movie4.jpg', 'rating': 9.5},
              {'title': 'Movie 5', 'image': 'assets/movie5.jpg', 'rating': 7.5},
              {'title': 'Movie 6', 'image': 'assets/movie6.jpg', 'rating': 8.8},
            ];

            final movie = movies[index];

            return GestureDetector(
              onTap: () {
                // aboutMovie 화면으로 이동
                Navigator.pushNamed(
                  context,
                  '/aboutMovie',
                  arguments: movie, // 선택된 영화 정보 전달
                );
              },
              child: Image.asset(
                movie['image'],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: 2, // Search 탭을 선택된 상태로 표시
        onTap: (index) {
          // 탭 이동
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/myPage');
          } else if (index == 2) {
            // 현재 화면
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
