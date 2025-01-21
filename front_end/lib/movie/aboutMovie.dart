import 'package:flutter/material.dart';

class AboutMovie extends StatelessWidget {
  const AboutMovie({super.key});

  @override
  Widget build(BuildContext context) {
    // 전달된 영화 데이터 받기
    final Map<String, dynamic> movie =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(movie['title'], style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // 리뷰 작성 화면으로 이동
              Navigator.pushNamed(context, '/writeReview', arguments: movie);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                movie['image'],
                fit: BoxFit.cover,
                height: 300,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 8),
                Text(
                  '${movie['rating']}',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Description about the movie goes here.',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
